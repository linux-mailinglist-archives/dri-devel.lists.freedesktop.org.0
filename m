Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A640265CE02
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 09:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC1D10E433;
	Wed,  4 Jan 2023 08:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B19910E234
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 22:08:51 +0000 (UTC)
Received: from fsav112.sakura.ne.jp (fsav112.sakura.ne.jp [27.133.134.239])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 303M7k2O030536;
 Wed, 4 Jan 2023 07:07:46 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav112.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav112.sakura.ne.jp);
 Wed, 04 Jan 2023 07:07:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav112.sakura.ne.jp)
Received: from [192.168.1.20] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 303M7j07030532
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 4 Jan 2023 07:07:45 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <2b35515e-5ad0-ee84-c90f-cb61428be4e4@I-love.SAKURA.ne.jp>
Date: Wed, 4 Jan 2023 07:07:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [syzbot] WARNING: locking bug in inet_autobind
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, Waiman Long <longman@redhat.com>,
 edumazet@google.com, jakub@cloudflare.com
References: <0000000000002ae67f05f0f191aa@google.com>
 <ea9c2977-f05f-3acd-ee3e-2443229b7b55@amd.com>
 <3e531d65-72a7-a82a-3d18-004aeab9144b@redhat.com>
 <a47b840f-b2b8-95d7-ddc0-c9d5dde3c28c@amd.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <a47b840f-b2b8-95d7-ddc0-c9d5dde3c28c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 04 Jan 2023 08:05:38 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Yong.Zhao@amd.com, songliubraving@fb.com, Christian.Koenig@amd.com,
 airlied@linux.ie, yhs@fb.com, ast@kernel.org, Ray.Huang@amd.com,
 will@kernel.org, David1.Zhou@amd.com,
 syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>, ozeng@amd.com,
 daniel@iogearbox.net, Oak.Zeng@amd.com, peterz@infradead.org, mingo@redhat.com,
 kuba@kernel.org, pabeni@redhat.com, boqun.feng@gmail.com,
 syzkaller-bugs@googlegroups.com, kuznet@ms2.inr.ac.ru, Evan.Quan@amd.com,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 davem@davemloft.net, gautammenghani201@gmail.com, Alexander.Deucher@amd.com,
 rex.zhu@amd.com, kafai@fb.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/01/04 1:20, Felix Kuehling wrote:
> 
> Am 2023-01-03 um 11:05 schrieb Waiman Long:
>> On 1/3/23 10:39, Felix Kuehling wrote:
>>> The regression point doesn't make sense. The kernel config doesn't enable CONFIG_DRM_AMDGPU, so there is no way that a change in AMDGPU could have caused this regression.
>>>
>> I agree. It is likely a pre-existing problem or caused by another commit that got triggered because of the change in cacheline alignment caused by commit c0d9271ecbd ("drm/amdgpu: Delete user queue doorbell variable").
> I don't think the change can affect cache line alignment. The entire amdgpu driver doesn't even get compiled in the kernel config that was used, and the change doesn't touch any files outside drivers/gpu/drm/amd/amdgpu:
> 
> # CONFIG_DRM_AMDGPU is not set
> 
> My guess would be that it's an intermittent bug that is confusing bisect.
> 
> Regards,
>   Felix

This was already explained in https://groups.google.com/g/syzkaller-bugs/c/1rmGDmbXWIw/m/nIQm0EmxBAAJ .

Jakub Sitnicki suggested

  What if we revisit Eric's lockdep splat fix in 37159ef2c1ae ("l2tp: fix
  a lockdep splat") and: 

  1. remove the lockdep_set_class_and_name(...) call in l2tp; it looks
     like an odd case within the network stack, and

  2. switch to bh_lock_sock_nested in l2tp_xmit_core so that we don't
     break what has been fixed in 37159ef2c1ae.

and we are waiting for response from Eric Dumazet.

