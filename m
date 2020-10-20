Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB973293373
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 05:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29786EBFE;
	Tue, 20 Oct 2020 03:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B196EBFE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 03:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBR0PaAw3mO9NvSLjKLmLhaSdbR+YLc4UkyTMiz2//+1H8cP2YQH1xmhtAxa+J8egu21EKbIAb2Lm08TUtrzTWtyCPxwwuDUVzdQqtk1iGZN/OYt7xMan44oSeeqF05WOWNNOJC72nG7gBmjp5qUlSJgrK9aQV25h59AZSRgXC/8lU7k5v8PSGYjoYcrTG6I16gPn/bUra772CHJnKj8tRPEkbCQQC40WcfekU5CP1pgZooVGbFsvqSJ1JAdOn0eQTTVhG8C/uiIhpYmKOA3Gvs0qRGxKl2ge5t+rq/U03qlqdhW3kASZBWJLH/zzK2FTshx560geLy0t3qjQzSQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/uXGpfMJZKs19ItdztExKjWBF0F86NzTR1tnN/YMVw=;
 b=AjEkLeCfXs61yl1G7HgNXOSZIls8+uVp5KLks+yVZBK710PG/6wt+VzO0z+taL7I8V6L/SgkYJHfNxHgL43T8jQ4IapOEwuc9WhG13gQdCa6wVYVAJnfmgL6VwF5xdeYV/b1Wc/ZL0ok+bEYdUmvhVsJc83j9eOm3jMXzEDeBXy7ZjVmjnAEE7CXe2HGW4z8HZf2SiRJ+nseaL3Xr/oxYwm+RvBWAmvZYN4fhOiVs7L+nUd47IGzR0xEkuliz2ULX8xkadWteb5O0yh/pHsZ1h0oxebBnpPyCuCMJOhC7BPUMB2oI909z46iU0+NH5muTJrf1FLy72D7N57EwkeHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/uXGpfMJZKs19ItdztExKjWBF0F86NzTR1tnN/YMVw=;
 b=jaVvUgCGSeoTtKN8Uilw3mhEbTjo9tXkclwou328z0p18Ry5icBSuZ9FCTayCOpp9OMxJD0hPdR7wqsDM2Yr8MkifRrKoV0Hh7HFfMe18neVmZQLOluowAdcp4JaBDwqzJu1M8VdZb3FcKIHReff54DwPe9hOExp1JF7GI1vvPo=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MWHPR12MB1694.namprd12.prod.outlook.com (2603:10b6:301:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 03:08:31 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24%6]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 03:08:31 +0000
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
 <20201016135016.GO6112@intel.com> <20201019104948.5ae842c0@eldfell>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <4f443474-6884-c480-6e72-60ed47ccc0de@amd.com>
Date: Mon, 19 Oct 2020 23:08:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201019104948.5ae842c0@eldfell>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:408:e6::12) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.2.224] (165.204.84.11) by
 BN0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:408:e6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Tue, 20 Oct 2020 03:08:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07a808db-972d-4454-fcab-08d874a56c44
X-MS-TrafficTypeDiagnostic: MWHPR12MB1694:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1694EE182EC90E1F1B8C5932811F0@MWHPR12MB1694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLMkzkADJz0GBxIjUzq0+FeKZhsOWpEwVU2eYZVSkXOs/ucVehvuVEO1j9ivJ/xXpRh3y/CKORgH99l87UdOXmdK9qe+MFNvMLCrRrN5KVDOPLogP+ySmEdiVUb9fzZd7ZYmWOnbbR2Tayuj7ZdMGpifvimXSUXqGXX3mWT/1PkjuZ6k+mt+XDAi3WQZVVOhJbU9P1O+2FhT1oHwRKH+KmilhMOthpE5MFffEXLFEunKccWJyi4+hBjsNtI2hP1qOO5cfGHUfwnUcBrniI1Lyhnb57sbJUeGBVvnt250WirneM4SNkPiFsL99ounFK1S4s/0fVawi+n9eDPjNfr9cooQSes38z3DYTq3YSLKnPCrRjdlIOQGM29a1OB0J99g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(8676002)(4001150100001)(30864003)(31696002)(83380400001)(66574015)(4326008)(956004)(2616005)(44832011)(8936002)(31686004)(26005)(16576012)(54906003)(36756003)(316002)(5660300002)(86362001)(16526019)(53546011)(2906002)(66476007)(66556008)(478600001)(66946007)(33964004)(6486002)(52116002)(186003)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hhX8zXH/fsHDRqqLqAWLkh10+W5O8EJDRWXrkj81DUE/KzXEza3GuzivrvE0g7JVKWyvalHsgvBfzAGpWOHcP47cPcHRHu6P+SxLd/LyjRkHvBuWBkMnfvpRBpbxavMZqmUKRUMs93ywL5mYcS63VGQZ2VoN3mOBcRDvC+5zkNOQWmY7dDpnVviYiloO+fVW6CB5/fpKrbmchsimMFiax2UUDI73NYvS/wT8XwRMScyHG2iZmzsEtayQHD4QqoVoD2LFq23HooAsVx42bOinpKIo8TiFtpW4lLeQT7n9lacxY3YsHAXvHkZETAz5k/VffKr8Z052PuUB2jT4onzSSjePz5u1DqNn2CTJbdYw18N0FusRFLQhFMCuecojjWPlVC1tCzgKlM413gRBe9I4oBJ8xN8EKolLTLqYj2wklXdZpGfja8VhxqkapBWTmdLnjNMC3d1vzbHT0VwCSVt31X4RqzHns6ww58m4qKmz2zpnL+VsBOzS35hUFed1aRhDbe3C0sHAysV22zFNhJ9NWvUWdlDy57kv2jymE7lqK56PxHNZrjSUbLwo37R5z+ohXu2JZi/oPNlnMFOH6CnpGFyNn4vhrQ60JVU925eh25kuL1xLdnQZNazu5a6/zAaea/aWU9m2kmS/lWDsp6r3Yw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a808db-972d-4454-fcab-08d874a56c44
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 03:08:31.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1J+hQVDZ35GEjTq12CdBF57fKxrdsIZpTcmBwvLGdWFvo8A9oU3MFWz0j1baaIha1iP+WMGixa/q+/oQ9a56Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1694
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0194065261=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0194065261==
Content-Type: multipart/alternative;
 boundary="------------546E9C6D8E1C731BA5EF50DE"
Content-Language: en-US

--------------546E9C6D8E1C731BA5EF50DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020-10-19 3:49 a.m., Pekka Paalanen wrote:
> On Fri, 16 Oct 2020 16:50:16 +0300
> Ville Syrjälä<ville.syrjala@linux.intel.com>  wrote:
>
>> On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
>>> On Fri, 9 Oct 2020 17:20:18 +0300
>>> Ville Syrjälä<ville.syrjala@linux.intel.com>  wrote:
>>>    
>>>> On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote:
>>>>> On Fri, 9 Oct 2020 16:10:25 +0300
>>>>> Ville Syrjälä<ville.syrjala@linux.intel.com>  wrote:
>>>>>      
>>>>>> On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Fri, 9 Oct 2020 at 10:24, Simon Ser<contact@emersion.fr>  wrote:
>>>>>>>> User-space should avoid parsing EDIDs for metadata already exposed via
>>>>>>>> other KMS interfaces and properties. For instance, user-space should not
>>>>>>>> try to extract a list of modes from the EDID: the kernel might mutate
>>>>>>>> the mode list (because of link capabilities or quirks for instance).
>>>>>>>>
>>>>>>>> Other metadata not exposed by KMS can be parsed by user-space. This
>>>>>>>> includes for instance monitor identification (make/model/serial) and
>>>>>>>> supported color-spaces.
>>>>>>> So I take it the only way to get modes is through the connector's list
>>>>>>> of modes. That sounds reasonable enough to me, but I think to properly
>>>>>>> handle colour (e.g. CEA modes have different behaviour for
>>>>>>> limited/full range depending on which VIC they correspond to IIRC)
>>>>>> If the mode has a VIC and that VIC is not 1, then it's limited range,
>>>>>> otherwise full range. There are fortunately no cases where you would
>>>>>> have the same exact timings corresponding to different quantization
>>>>>> range depending on the VIC.
>>>>>>
>>>>>> And the only reason the same timings could correspond to multiple VICs
>>>>>> is aspect ratio. Which is already exposed via the mode flags, assuming
>>>>>> the appropriate client cap is enabled.
>>>>>>
>>>>>> So I think the only reason to expose the VIC would be if userspace is
>>>>>> non-lazy and wants to manage its colors presicely, but is otherwise lazy
>>>>>> and doesn't want to figure out what the VIC of the mode is on its own.
>>>>> What would "figure out what the VIC of the mode is" require in userspace?
>>>>>
>>>>> A database of all VIC modes and then compare if the detailed timings match?
>>>>>
>>>>> Is that also how the kernel recognises that userspace wants to set a
>>>>> certain VIC mode instead of some arbitrary mode?
>>>> Yes and yes.
>>>>
>>>> Note that atm we also don't have a way for userspace to say that it
>>>> wants to signal limited range to the sink but wants the kernel
>>>> to not do the full->limited range conversion. Ie. no way for userspace
>>>> to pass in pixels that are already in limited range. There was a patch
>>>> for that posted quite long ago, but it didn't go in.
>>> Thanks for the heads-up.
>>>
>>> If userspace uses all available KMS color management properties
>>> (CTM, LUTs, etc.)*and*  the video mode implies limited range on the
>>> cable, at what point in the pixel pipeline does that conversion from
>>> full to limited range occur?
>> It should be the last step.
>>
>> <stop reading now if you don't care about Intel hw details>
>>
>> There is a slight snag on some Intel platforms that the gamma LUT
>> is sitting after the CSC unit, and currently we use the CSC for
>> the range compression.

Thanks a lot for letting us to know about this!
AMD display pipe has always at the end CSC matrix where we apply appropriate range conversion if necessary.

>>
>> On glk in particular I*think*  we currently just do the wrong
>> thing do the range compression before gamma. The same probably
>> applies to hsw+ when both gamma and degamma are used at the same
>> time. But that is clearly buggy, and we should fix it to either:
>> a) return an error, which isn't super awesome since then you
>>     can't do gamma+limited range at the same time on glk, nor
>>     gamma+degamma+limited range on hsw+.
>> b) for the glk case we could use the hw degamma LUT for the
>>     gamma, which isn't great becasue the hw gamma and degamma
>>     LUTs are quite different beasts, and so the hw degamma LUT
>>     might not be able to do exactly what we need.

Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, just select the proper bit)?

>> On hsw+ we do
>>     use this trick already to get the gamma+limited range right,
>>     but on these platforms the hw gamma and degamma LUTs have
>>     identical capabilities.
>> c) do the range compression with the hw gamma LUT instead, which
>>     of course means we have to combine the user gamma and range
>>     compression into the same gamma LUT.

Nice w/a and in amdgpu we are using also curve concatenations into re gamma LUT.

The number of concatenations could be as many as need it and we may take advantage of this in user mode. Does this sounds preliminarily  good?

Wouldn't the following sentence be interesting for you if the user mode generates 1D LUT points using X axis exponential distribution to avoid
unnecessary interpolation in kernel?  It may be especially important if curve concatenation is expected?

>>
>> So I think c) is what it should be. Would just need to find the time
>> to implement it, and figure out how to not totally mess up our
>> driver's hw state checker. Hmm, except this won't help at all
>> with YCbCr output since we need to apply gamma before the
>> RGB->YCbCr conversion (which uses the same CSC again). Argh.
>> So YCbCr output would still need option b).
>>
>> Thankfully icl+ fixed all this by adding a dedicated output CSC
>> unit which sits after the gamma LUT in the pipeline. And pre-hsw
>> is almost fine as well since the hw has a dedicated fixed function
>> thing for the range compression. So the only snag on pre-hsw
>> is the YCbCr+degamma+gamma case.

Where is the display engine scaler is located on Intel platforms?

AMD old ASIC's have a display scaler after display color pipeline ,so the whole color processing can be a bit mess up unless integer scaling is in use.

The new ASIC's ( ~5 years already)  have scaler before color pipeline.

> Interesting.
>
> I gather that if I stick to RGB and full-range, or maybe just
> full-range regardless of RGB vs. YCbCr on the cable, I should be fine.
> I'd need to have color management disable all limited-range (VIC)
> modes in a compositor... no, not disable, but maybe print a warning in
> the log.
>
> I'd love if there was a test suite ensuring these work correctly, but
> that's a lot of work. I'm not sure if writeback or CRC helps with
> it, or does it need actual HDMI or DP frame grabber hardware?
>
> I presume that there is too much acceptable fuzz in output signal that
> CRC testing is not going to be useful anyway.
>
> The Wayland color management design, or more like compositor designs,
> kind of rely on the KMS hardware doing exactly what it's told.
>
>
> Thanks,
> pq

Thanks, Vitaly


--------------546E9C6D8E1C731BA5EF50DE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-10-19 3:49 a.m., Pekka Paalanen
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201019104948.5ae842c0@eldfell">
      <div class="moz-text-plain" wrap="true" graphical-quote="true" style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">On Fri, 16 Oct 2020 16:50:16 +0300
Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com" moz-do-not-send="true">&lt;ville.syrjala@linux.intel.com&gt;</a> wrote:

</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre class="moz-quote-pre" wrap="">On Fri, 9 Oct 2020 17:20:18 +0300
Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com" moz-do-not-send="true">&lt;ville.syrjala@linux.intel.com&gt;</a> wrote:
  
</pre>
            <blockquote type="cite" style="color: #000000;">
              <pre class="moz-quote-pre" wrap="">On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote:  
</pre>
              <blockquote type="cite" style="color: #000000;">
                <pre class="moz-quote-pre" wrap="">On Fri, 9 Oct 2020 16:10:25 +0300
Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com" moz-do-not-send="true">&lt;ville.syrjala@linux.intel.com&gt;</a> wrote:
    
</pre>
                <blockquote type="cite" style="color: #000000;">
                  <pre class="moz-quote-pre" wrap="">On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:    
</pre>
                  <blockquote type="cite" style="color: #000000;">
                    <pre class="moz-quote-pre" wrap="">Hi,

On Fri, 9 Oct 2020 at 10:24, Simon Ser <a class="moz-txt-link-rfc2396E" href="mailto:contact@emersion.fr" moz-do-not-send="true">&lt;contact@emersion.fr&gt;</a> wrote:      
</pre>
                    <blockquote type="cite" style="color: #000000;">
                      <pre class="moz-quote-pre" wrap="">User-space should avoid parsing EDIDs for metadata already exposed via
other KMS interfaces and properties. For instance, user-space should not
try to extract a list of modes from the EDID: the kernel might mutate
the mode list (because of link capabilities or quirks for instance).

Other metadata not exposed by KMS can be parsed by user-space. This
includes for instance monitor identification (make/model/serial) and
supported color-spaces.      
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">So I take it the only way to get modes is through the connector's list
of modes. That sounds reasonable enough to me, but I think to properly
handle colour (e.g. CEA modes have different behaviour for
limited/full range depending on which VIC they correspond to IIRC)      
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">If the mode has a VIC and that VIC is not 1, then it's limited range,
otherwise full range. There are fortunately no cases where you would
have the same exact timings corresponding to different quantization
range depending on the VIC.

And the only reason the same timings could correspond to multiple VICs
is aspect ratio. Which is already exposed via the mode flags, assuming
the appropriate client cap is enabled.

So I think the only reason to expose the VIC would be if userspace is
non-lazy and wants to manage its colors presicely, but is otherwise lazy
and doesn't want to figure out what the VIC of the mode is on its own.    
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">What would &quot;figure out what the VIC of the mode is&quot; require in userspace?

A database of all VIC modes and then compare if the detailed timings match?

Is that also how the kernel recognises that userspace wants to set a
certain VIC mode instead of some arbitrary mode?    
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Yes and yes.

Note that atm we also don't have a way for userspace to say that it
wants to signal limited range to the sink but wants the kernel
to not do the full-&gt;limited range conversion. Ie. no way for userspace
to pass in pixels that are already in limited range. There was a patch
for that posted quite long ago, but it didn't go in.  
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Thanks for the heads-up.

If userspace uses all available KMS color management properties
(CTM, LUTs, etc.) <b class="moz-txt-star"><span class="moz-txt-tag">*</span>and<span class="moz-txt-tag">*</span></b> the video mode implies limited range on the
cable, at what point in the pixel pipeline does that conversion from
full to limited range occur?  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It should be the last step.

&lt;stop reading now if you don't care about Intel hw details&gt;

There is a slight snag on some Intel platforms that the gamma LUT
is sitting after the CSC unit, and currently we use the CSC for
the range compression.</pre>
        </blockquote>
      </div>
    </blockquote>
    <pre>Thanks a lot for letting us to know about this!
AMD display pipe has always at the end CSC matrix where we apply appropriate range conversion if necessary.
</pre>
    <blockquote type="cite" cite="mid:20201019104948.5ae842c0@eldfell">
      <div class="moz-text-plain" wrap="true" graphical-quote="true" style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">

On glk in particular I <b class="moz-txt-star"><span class="moz-txt-tag">*</span>think<span class="moz-txt-tag">*</span></b> we currently just do the wrong
thing do the range compression before gamma. The same probably
applies to hsw+ when both gamma and degamma are used at the same
time. But that is clearly buggy, and we should fix it to either:
a) return an error, which isn't super awesome since then you
   can't do gamma+limited range at the same time on glk, nor
   gamma+degamma+limited range on hsw+.
b) for the glk case we could use the hw degamma LUT for the
   gamma, which isn't great becasue the hw gamma and degamma
   LUTs are quite different beasts, and so the hw degamma LUT
   might not be able to do exactly what we need. </pre>
        </blockquote>
      </div>
    </blockquote>
    <pre>Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, just select the proper bit)?
</pre>
    <blockquote type="cite" cite="mid:20201019104948.5ae842c0@eldfell">
      <div class="moz-text-plain" wrap="true" graphical-quote="true" style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">On hsw+ we do
   use this trick already to get the gamma+limited range right,
   but on these platforms the hw gamma and degamma LUTs have
   identical capabilities.
c) do the range compression with the hw gamma LUT instead, which
   of course means we have to combine the user gamma and range
   compression into the same gamma LUT.</pre>
        </blockquote>
      </div>
    </blockquote>
    <pre>Nice w/a and in amdgpu we are using also curve concatenations into re gamma LUT.</pre>
    <pre>The number of concatenations could be as many as need it and we may take advantage of this in user mode. Does this sounds preliminarily  good?
</pre>
    <pre>Wouldn't the following sentence be interesting for you if the user mode generates 1D LUT points using X axis exponential distribution to avoid 
unnecessary interpolation in kernel?  It may be especially important if curve concatenation is expected?
</pre>
    <blockquote type="cite" cite="mid:20201019104948.5ae842c0@eldfell">
      <div class="moz-text-plain" wrap="true" graphical-quote="true" style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">

So I think c) is what it should be. Would just need to find the time
to implement it, and figure out how to not totally mess up our
driver's hw state checker. Hmm, except this won't help at all
with YCbCr output since we need to apply gamma before the
RGB-&gt;YCbCr conversion (which uses the same CSC again). Argh.
So YCbCr output would still need option b).

Thankfully icl+ fixed all this by adding a dedicated output CSC
unit which sits after the gamma LUT in the pipeline. And pre-hsw
is almost fine as well since the hw has a dedicated fixed function
thing for the range compression. So the only snag on pre-hsw
is the YCbCr+degamma+gamma case.
</pre>
        </blockquote>
      </div>
    </blockquote>
    <pre>Where is the display engine scaler is located on Intel platforms?</pre>
    <pre>AMD old ASIC's have a display scaler after display color pipeline ,so the whole color processing can be a bit mess up unless integer scaling is in use.</pre>
    <pre>The new ASIC's ( ~5 years already)&nbsp; have scaler before color pipeline.
</pre>
    <blockquote type="cite" cite="mid:20201019104948.5ae842c0@eldfell">
      <div class="moz-text-plain" wrap="true" graphical-quote="true" style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
        <pre class="moz-quote-pre" wrap="">Interesting.

I gather that if I stick to RGB and full-range, or maybe just
full-range regardless of RGB vs. YCbCr on the cable, I should be fine.
I'd need to have color management disable all limited-range (VIC)
modes in a compositor... no, not disable, but maybe print a warning in
the log.

I'd love if there was a test suite ensuring these work correctly, but
that's a lot of work. I'm not sure if writeback or CRC helps with
it, or does it need actual HDMI or DP frame grabber hardware?

I presume that there is too much acceptable fuzz in output signal that
CRC testing is not going to be useful anyway.

The Wayland color management design, or more like compositor designs,
kind of rely on the KMS hardware doing exactly what it's told.


Thanks,
pq
</pre>
      </div>
    </blockquote>
    <div class="moz-signature">
      <pre>Thanks, Vitaly</pre>
    </div>
  </body>
</html>

--------------546E9C6D8E1C731BA5EF50DE--

--===============0194065261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0194065261==--
