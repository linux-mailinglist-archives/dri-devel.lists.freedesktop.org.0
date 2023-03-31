Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC476D1DA1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 12:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F4910E0A1;
	Fri, 31 Mar 2023 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E07610E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:09:53 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1piBhb-0001bz-Qs; Fri, 31 Mar 2023 12:09:47 +0200
Message-ID: <d5c9d3fa-7f73-1179-8055-b31568ae2228@leemhuis.info>
Date: Fri, 31 Mar 2023 12:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To: Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v3-4-d1bdcf31c71c@tessares.net>
 <c2d5cc07-ec95-eb64-0cef-42f8378ea054@leemhuis.info>
 <ac473b8f-e7c1-edf9-9d9c-f1fd726e1e17@tessares.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 4/4] checkpatch: check for misuse of the link tags
In-Reply-To: <ac473b8f-e7c1-edf9-9d9c-f1fd726e1e17@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680257393;4699f220;
X-HE-SMSGID: 1piBhb-0001bz-Qs
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.03.23 11:44, Matthieu Baerts wrote:
> Hi Thorsten,
> 
> On 31/03/2023 10:57, Thorsten Leemhuis wrote:
>> On 30.03.23 20:13, Matthieu Baerts wrote:
>>> "Link:" and "Closes:" tags have to be used with public URLs.
>>>
>>> It is difficult to make sure the link is public but at least we can
>>> verify the tag is followed by 'http(s):'.
>>>
>>> With that, we avoid such a tag that is not allowed [1]:
>>>
>>>   Closes: <number>
>>>
>>> Link: https://lore.kernel.org/linux-doc/CAHk-=wh0v1EeDV3v8TzK81nDC40=XuTdY2MCr0xy3m3FiBV3+Q@mail.gmail.com/ [1]
>>> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
>>> [...]
>>> +# Check for misuse of the link tags
>>> +		if ($in_commit_log &&
>>> +		    $line =~ /^\s*(\w+:)\s*(\S+)/) {
>>> +			my $tag = $1;
>>> +			my $value = $2;
>>> +			if ($tag =~ /^$link_tags_search$/ && $value !~ /^https?:/) {
>>> +				WARN("COMMIT_LOG_WRONG_LINK",
>>> +				     "'$tag' should be followed by a public http(s) link\n" . $herecurr);
>>> +			}
>>> +		}
>>> +
>>
>> I must be missing something here, but it looks to me like this is
>> checked twice now. See this line in patch2 (which is changed there, but
>> the check itself remains):
>>
>>> } elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
> 
> If I'm not mistaken, we had the following checks:
> 
> - after Reported-by, there is a link tag (Link:|Closes:)
>
> - (link tags can take more than 75 chars)
> - tags followed by "http(s)://" are restricted to link ones
> 
> Then not: link tags (Link:|Closes:) are followed by "http(s):".

Not in general, afaics -- and ensuring that is likely wise, so thx for
this. But for Link: and Closes: tags after a Reported-by it is already
checked, that's what I meant (and didn't communicate well, sorry). It's
just a detail, but might be wise to do this in patch 4:

- } elsif ($rawlines[$linenr] !~ m{^$link_tags_search\s*https?://}i) {
+ } elsif ($rawlines[$linenr] !~ m{^$link_tags_search}i) {

(that's a line changed in patch2)

Ciao, Thorsten





