Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7267DFCF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1089755;
	Fri, 27 Jan 2023 09:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B0A89755;
 Fri, 27 Jan 2023 09:15:14 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pLKpC-00042p-Pj; Fri, 27 Jan 2023 10:15:10 +0100
Message-ID: <36e72298-e9d3-967e-8b14-7197719953cb@leemhuis.info>
Date: Fri, 27 Jan 2023 10:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
To: Greg KH <gregkh@linuxfoundation.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <20230120174634.GA889896@roeck-us.net>
 <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com> <Y9N/wiIL758c3ozv@kroah.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
In-Reply-To: <Y9N/wiIL758c3ozv@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1674810914;
 28913ce1; 
X-HE-SMSGID: 1pLKpC-00042p-Pj
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 stanislav.lisovskiy@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 stable@vger.kernel.org, Wayne Lin <Wayne.Lin@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.01.23 08:39, Greg KH wrote:
> On Fri, Jan 20, 2023 at 11:51:04AM -0600, Limonciello, Mario wrote:
>> On 1/20/2023 11:46, Guenter Roeck wrote:
>>> On Thu, Jan 12, 2023 at 04:50:44PM +0800, Wayne Lin wrote:
>>>> This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
>>>>
>>>> [Why]
>>>> Changes cause regression on amdgpu mst.
>>>> E.g.
>>>> In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove payload
>>>> one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
>>>> maintained payload table. But previous change tries to go through all the
>>>> payloads in mst_state and update amdpug hw maintained table in once everytime
>>>> driver only tries to add/remove a specific payload stream only. The newly
>>>> design idea conflicts with the implementation in amdgpu nowadays.
>>>>
>>>> [How]
>>>> Revert this patch first. After addressing all regression problems caused by
>>>> this previous patch, will add it back and adjust it.
>>>
>>> Has there been any progress on this revert, or on fixing the underlying
>>> problem ?
>>>
>>> Thanks,
>>> Guenter
>>
>> Hi Guenter,
>>
>> Wayne is OOO for CNY, but let me update you.
>>
>> Harry has sent out this series which is a collection of proper fixes.
>> https://patchwork.freedesktop.org/series/113125/
>>
>> Once that's reviewed and accepted, 4 of them are applicable for 6.1.
> 
> Any hint on when those will be reviewed and accepted?  patchwork doesn't
> show any activity on them, or at least I can't figure it out...

I didn't look closer (hence please correct me if I'm wrong), but the
core changes afaics are in the DRM pull airlied send a few hours ago to
Linus (note the "amdgpu […] DP MST fixes" line):

https://lore.kernel.org/all/CAPM%3D9tzuu4xnx6T5v7sKsK%2BA5HEaPOc1ieMyzNSYQZGztJ%3D6Qw@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
