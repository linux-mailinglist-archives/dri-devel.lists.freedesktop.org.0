Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84A294657
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 03:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376466E847;
	Wed, 21 Oct 2020 01:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD106E83C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKW/3n06xH6NMWmifIMQt/y6CmLWk3nTw1stgYvrc+Mbjn9sT7zzbgatA0WsEdMQdl6+RAKDXeclUr4d97YNpe1pucwO6h84mY3I2ID6Z6TQpmxBT3/DhQW2SbLaLLzDfmKiuaBg7DNjxsmv4g4LK90OZnIca/VYAxZGo6KdXowEW/Q2hamz7eJzYd0wcU7lk87x81ErpL7tUpiVtPjk04xq+N126TYkjCVDS3VSj4123QjX7D8AGgskHyLg8ZAN/Mv6IoEWTOeFZIp51kzxvohiEhwBhbPuUM9wz7jXsaHyiRZfI6lcJG6KiShIZ1LBch24B2xoPfANPHpLeECcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm/cXj5ukPzEf10coIs8Jd++Me2a/rDJRAq0YV9Jtgk=;
 b=jw66cse0OVO1E6szjKvO6K1tABNbj/oQXUXcGPG+nbht+UstI6rNtC2KLzKwt/LGhXcl42doC/VrxEccmEceMZ1Pw41dSif4enrBfVstKDoRUTccHhUKy5el1k0jvqXvq3gftHpvs0gZkt8gm9hKzt4KnJifvnAKTqzoOLpWxrMJp54U//fhD1DMAfOm1zDWti5ZHe4ggrH9Fxd16k6r0Y0NnNXqnTaiB+xoQx7YeOgBxerdt0CtkKwWYFi8VRhOHVTAYpGw+l3egOlhx6DSNdI48gzwmKo7pIIYDnU3IexCW657BeSixsUddnnobRFujBT28X8DS87BxwJzlrDdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm/cXj5ukPzEf10coIs8Jd++Me2a/rDJRAq0YV9Jtgk=;
 b=QTKgJVS7SaZfiNiuWR9nn+2CHGo6KKzBDvmdIBJDyhUAq5+advYMw0QfUAbB2XoWGyFZ9+FuwA8v+Rn0oq/8Kp3kNIEeJ19zSkzYYN0pfCiV86hcP9SdKE0Ysp6oDWJbf+tlqf9O0dfVHNNGTApUjP0uUknUrxR6UbIM9QVueVw=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MWHPR12MB1552.namprd12.prod.outlook.com (2603:10b6:301:a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 21 Oct
 2020 01:46:34 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::c489:ed80:4e2d:cf24%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 01:46:34 +0000
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
 <20201016135016.GO6112@intel.com> <20201019104948.5ae842c0@eldfell>
 <4f443474-6884-c480-6e72-60ed47ccc0de@amd.com>
 <20201020150443.GZ6112@intel.com>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <bb6a9bfe-e85e-8db5-fa85-37436940ead6@amd.com>
Date: Tue, 20 Oct 2020 21:46:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201020150443.GZ6112@intel.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:404:8c::14) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.3.46] (165.204.84.11) by
 BN6PR07CA0004.namprd07.prod.outlook.com (2603:10b6:404:8c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 01:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 169619bc-085b-4dd7-1c17-08d8756323f4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1552:
X-Microsoft-Antispam-PRVS: <MWHPR12MB155260491017AEBBEC48A7E5811C0@MWHPR12MB1552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yX9iIXVGzFAKSpAjNYzg6hIge5r47pHjT/pGfZikUqIoRO7DsujW7bjD8A0XybBodYsSCbHDTrFrzhSmYs3/pBAo+1eM29Zl+LU2RA8pZDtixyntFqOsBnZJptkhK52d1gtcDnB+dQz/kx7hQqNFX3dnjJmui9aekgPIpPBMmP5ODouQriveovhIJ7aIiGsTE9gKEe6KMMjHooyb08uFzxMX0AMyH4b0td1yOOG46cLh/s2IkoX3LOw5OJG8AJe+RKN3b6mRunhnBtGSXkiE72sGIFrMN89vslGSyqjWcoHYmwnPNbqBkO+929pi7vzh9diLG6mJuml1crs7diddnhn3wHa5OGbujR+7vQLzyj5dtcwvgnx7KB58tWNflBQyMKGZfcuU0oREUZtV3jLem4sM2hHf+RAbzENmOubifwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(956004)(54906003)(36756003)(86362001)(26005)(478600001)(8936002)(66946007)(316002)(44832011)(31696002)(2906002)(21615005)(2616005)(8676002)(4326008)(16576012)(30864003)(16526019)(6486002)(186003)(31686004)(83380400001)(52116002)(66556008)(53546011)(66476007)(4001150100001)(5660300002)(33964004)(166002)(66574015)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: h542LdenlMon2/V6aTFFjlt5C9xGb9vTCoEcXFgv9cGB80/B8AL2OrzeRZDbh78/bwLXJ/FwfscQMbsqyC5YUADYNUDgNSv4Wb0ytmF2LzOGcOeujnYF1AEIOOXVRfYbg95gE6aw9Y4Q2IiCAQcKbkAQQi395YbdEehIhtA0fWfrvogXJGcItGaYyfARzNUlxaxkqwmaMCpdx8D1rTYZY+amCkHz/2JFmkKEzV3bEB9+E8vUcx5+IvPlFSxturdmkmCSf4QbPY6l7IBnvee9hWtLM4E2JAeg38PoYNL8VGr/mbEj7NguL8opUFSaQ5CESqRm08hBBurU8+OcBjmT1vAda9ha/anEWzfu5f2kNmqJc5AETNlU/StGJm/PgMhoVfF1GMZcfIwxfoRlyTheQFtn1ilnjHU8UCvgvH44L8GOL97tJNKI0RBlgUzSfxhQtak83+eH3p/dRuagYuPDI0thomMliQKF39sxpe7IagoCGLbJW/lbM9n7ChHDPp51D4Mw1L6UFFxCa699ezyhOQOkPFGA66SBSq1bhkO99MBEVGJzQ/x0v3EbQmot69Jk+P+Zdsi0Mxa8ll1Wo4DSA4pHgNFdoWhW4bWC87jpb40/+TvOY3eWhD3JlNGxlMhV6WDz3M+Wy4clLv0wwEbfQQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169619bc-085b-4dd7-1c17-08d8756323f4
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 01:46:34.0776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLtDHrPycPL/KMMP/Y5x7T3ToiTzeja4OzPw8ADONEcIRg2V9DHacZHeUOxQFog6YqyIfdKH3kjxbvDe1MITmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1552
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
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1456535687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1456535687==
Content-Type: multipart/alternative;
 boundary="------------93A32BF94057B7ABB4E62EB9"
Content-Language: en-US

--------------93A32BF94057B7ABB4E62EB9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020-10-20 11:04 a.m., Ville Syrjälä wrote:
> On Mon, Oct 19, 2020 at 11:08:27PM -0400, Vitaly Prosyak wrote:
>> On 2020-10-19 3:49 a.m., Pekka Paalanen wrote:
>>> On Fri, 16 Oct 2020 16:50:16 +0300
>>> Ville Syrjälä<ville.syrjala@linux.intel.com>  wrote:
>>>
>>>> On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
>>>>> On Fri, 9 Oct 2020 17:20:18 +0300
>>>>> Ville Syrjälä<ville.syrjala@linux.intel.com>  wrote:
> <snip>
>>>> There is a slight snag on some Intel platforms that the gamma LUT
>>>> is sitting after the CSC unit, and currently we use the CSC for
>>>> the range compression.
>> Thanks a lot for letting us to know about this!
>> AMD display pipe has always at the end CSC matrix where we apply appropriate range conversion if necessary.
>>
>>>> On glk in particular I*think*  we currently just do the wrong
>>>> thing do the range compression before gamma. The same probably
>>>> applies to hsw+ when both gamma and degamma are used at the same
>>>> time. But that is clearly buggy, and we should fix it to either:
>>>> a) return an error, which isn't super awesome since then you
>>>>      can't do gamma+limited range at the same time on glk, nor
>>>>      gamma+degamma+limited range on hsw+.
>>>> b) for the glk case we could use the hw degamma LUT for the
>>>>      gamma, which isn't great becasue the hw gamma and degamma
>>>>      LUTs are quite different beasts, and so the hw degamma LUT
>>>>      might not be able to do exactly what we need.
>> Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, just select the proper bit)?
> No. The hw degamma LUT is a 1x33 linearly interpolated
> non-decreasing curve. So can't do directcolor type stuff,
> and each RGB channel must have the same gamma.
>
> The hw gamma LUT on the other hand can operate in multiple
> different modes, from which we currently choose the
> 3x1024 non-interpoated mode. Which can do all those
> things the degamma LUT can't do.
>
>>>> On hsw+ we do
>>>>      use this trick already to get the gamma+limited range right,
>>>>      but on these platforms the hw gamma and degamma LUTs have
>>>>      identical capabilities.
>>>> c) do the range compression with the hw gamma LUT instead, which
>>>>      of course means we have to combine the user gamma and range
>>>>      compression into the same gamma LUT.
>> Nice w/a and in amdgpu we are using also curve concatenations into re gamma LUT.
>>
>> The number of concatenations could be as many as need it and we may take advantage of this in user mode. Does this sounds preliminarily  good?
>>
>> Wouldn't the following sentence be interesting for you if the user mode generates 1D LUT points using X axis exponential distribution to avoid
>> unnecessary interpolation in kernel?  It may be especially important if curve concatenation is expected?
> Yeah, I think we want a new uapi for gamma stuff that will allow
> userspace to properly calculate things up front for different kinds
> of hw implementations, without the kernel having to interpolate/decimate.
> We've had some discussions/proposals on the list.
>
>>>> So I think c) is what it should be. Would just need to find the time
>>>> to implement it, and figure out how to not totally mess up our
>>>> driver's hw state checker. Hmm, except this won't help at all
>>>> with YCbCr output since we need to apply gamma before the
>>>> RGB->YCbCr conversion (which uses the same CSC again). Argh.
>>>> So YCbCr output would still need option b).
>>>>
>>>> Thankfully icl+ fixed all this by adding a dedicated output CSC
>>>> unit which sits after the gamma LUT in the pipeline. And pre-hsw
>>>> is almost fine as well since the hw has a dedicated fixed function
>>>> thing for the range compression. So the only snag on pre-hsw
>>>> is the YCbCr+degamma+gamma case.
>> Where is the display engine scaler is located on Intel platforms?
>> AMD old ASIC's have a display scaler after display color pipeline ,so the whole color processing can be a bit mess up unless integer scaling is in use.
>>
>> The new ASIC's ( ~5 years already)  have scaler before color pipeline.
> We have a somewhat similar situation.
>
> On older hw the scaler tap point is at the end of the pipe, so
> between the gamma LUT and dithering.
>
> On icl+ I think we have two tap points; one between degamma
> LUT and the first pipe CSC, and a second one between the output
> CSC and dithering. The spec calls these non-linear and linear tap
> points. The scaler also gained another linear vs. non-linear
> control knob which affects the precision at which it can operate
> in some form. There's also some other interaction between this and
> another knob ("HDR" mode) which controls the precision of blending
> in the pipe. I haven't yet thought how we should configure all this
> to the best effect. For the moment we leave these scaler settings
> to their defaults, which means using the non-linear tap point and
> non-linear precision setting. The blending precision we adjust
> dynamically depending on which planes are enabled. Only a subset
> of the planes (so called HDR planes) can be enabled when using the
> high precision blending mode.
>
> On icl+ plane scaling also has the two different tap points, but
> this time I think it just depdends on the type of plane used;
> HDR planes have a linear tap point just before blending, SDR
> planes have a non-linear tap point right after the pixels enter
> the plane's pipeline. Older hw again just had the non-linear
> tap point.

Thanks for the clarification Ville!

I am not sure if i understood correctly tap points.

Are you referring that you have full 2 scalers and each-one can do horizontal and vertical scaling?

The first scaler does scaling in linear space and and the second in non linear. Is it correct?

I just found thread from Pekka :https://lists.freedesktop.org/archives/wayland-devel/2020-October/041637.html

regarding integer scaling and other related stuff.

AMD display engine has always 1 scaler, we do concatenation of two or more scaling transforms into one if it is necessary.

Old ASIC's do scaling in nonlinear space, new ASIC's in linear space since scaler precision is half float.

All these questions are become important for hardware composition and if the differences are too big( not sure about this) and it can't be abstracted.

As one approach , can we think about shared object in user mode for each vendor ( this approach was in android for hardware composition) and this small component can do

LUT's , scaler coefficients content and other not compatible stuff ) ?

For example, tiling is already has nice abstraction level  like  dma buf modifiers .

Another approach , I am not sure if user mode can request abstraction from driver regarding color pipeline

in accordance to ICC spec. In fact all display engine pipes are look very similar to ICC spec which grew also from 8 bpc to half float.

If we take this as baseline then we can try to abstract and this may be beneficial for entire Linux ecosystem and move forward together with Color Consortium.

Thanks, Vitaly






--------------93A32BF94057B7ABB4E62EB9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-10-20 11:04 a.m., Ville Syrjälä
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201020150443.GZ6112@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Oct 19, 2020 at 11:08:27PM -0400, Vitaly Prosyak wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 2020-10-19 3:49 a.m., Pekka Paalanen wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, 16 Oct 2020 16:50:16 +0300
Ville Syrjälä<a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>  wrote:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Fri, 9 Oct 2020 17:20:18 +0300
Ville Syrjälä<a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>  wrote:
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">&lt;snip&gt;
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">There is a slight snag on some Intel platforms that the gamma LUT
is sitting after the CSC unit, and currently we use the CSC for
the range compression.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks a lot for letting us to know about this!
AMD display pipe has always at the end CSC matrix where we apply appropriate range conversion if necessary.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
On glk in particular I*think*  we currently just do the wrong
thing do the range compression before gamma. The same probably
applies to hsw+ when both gamma and degamma are used at the same
time. But that is clearly buggy, and we should fix it to either:
a) return an error, which isn't super awesome since then you
    can't do gamma+limited range at the same time on glk, nor
    gamma+degamma+limited range on hsw+.
b) for the glk case we could use the hw degamma LUT for the
    gamma, which isn't great becasue the hw gamma and degamma
    LUTs are quite different beasts, and so the hw degamma LUT
    might not be able to do exactly what we need.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, just select the proper bit)?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No. The hw degamma LUT is a 1x33 linearly interpolated
non-decreasing curve. So can't do directcolor type stuff,
and each RGB channel must have the same gamma.

The hw gamma LUT on the other hand can operate in multiple
different modes, from which we currently choose the
3x1024 non-interpoated mode. Which can do all those
things the degamma LUT can't do.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On hsw+ we do
    use this trick already to get the gamma+limited range right,
    but on these platforms the hw gamma and degamma LUTs have
    identical capabilities.
c) do the range compression with the hw gamma LUT instead, which
    of course means we have to combine the user gamma and range
    compression into the same gamma LUT.
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Nice w/a and in amdgpu we are using also curve concatenations into re gamma LUT.

The number of concatenations could be as many as need it and we may take advantage of this in user mode. Does this sounds preliminarily  good?

Wouldn't the following sentence be interesting for you if the user mode generates 1D LUT points using X axis exponential distribution to avoid
unnecessary interpolation in kernel?  It may be especially important if curve concatenation is expected?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah, I think we want a new uapi for gamma stuff that will allow
userspace to properly calculate things up front for different kinds
of hw implementations, without the kernel having to interpolate/decimate.
We've had some discussions/proposals on the list.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
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
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Where is the display engine scaler is located on Intel platforms?
AMD old ASIC's have a display scaler after display color pipeline ,so the whole color processing can be a bit mess up unless integer scaling is in use.

The new ASIC's ( ~5 years already)&nbsp; have scaler before color pipeline.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We have a somewhat similar situation.

On older hw the scaler tap point is at the end of the pipe, so
between the gamma LUT and dithering.

On icl+ I think we have two tap points; one between degamma
LUT and the first pipe CSC, and a second one between the output
CSC and dithering. The spec calls these non-linear and linear tap
points. The scaler also gained another linear vs. non-linear
control knob which affects the precision at which it can operate
in some form. There's also some other interaction between this and
another knob (&quot;HDR&quot; mode) which controls the precision of blending
in the pipe. I haven't yet thought how we should configure all this
to the best effect. For the moment we leave these scaler settings
to their defaults, which means using the non-linear tap point and
non-linear precision setting. The blending precision we adjust
dynamically depending on which planes are enabled. Only a subset
of the planes (so called HDR planes) can be enabled when using the
high precision blending mode.

On icl+ plane scaling also has the two different tap points, but
this time I think it just depdends on the type of plane used;
HDR planes have a linear tap point just before blending, SDR
planes have a non-linear tap point right after the pixels enter
the plane's pipeline. Older hw again just had the non-linear
tap point.
</pre>
    </blockquote>
    <pre>Thanks for the clarification Ville!</pre>
    <pre>I am not sure if i understood correctly tap points.</pre>
    <pre>Are you referring that you have full 2 scalers and each-one can do horizontal and vertical scaling?</pre>
    <pre>The first scaler does scaling in linear space and and the second in non linear. Is it correct?
</pre>
    <pre>I just found thread from Pekka :<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/wayland-devel/2020-October/041637.html">https://lists.freedesktop.org/archives/wayland-devel/2020-October/041637.html</a></pre>
    <pre>regarding integer scaling and other related stuff.</pre>
    <pre>AMD display engine has always 1 scaler, we do concatenation of two or more scaling transforms into one if it is necessary.</pre>
    <pre>Old ASIC's do scaling in nonlinear space, new ASIC's in linear space since scaler precision is half float.</pre>
    <pre>All these questions are become important for hardware composition and if the differences are too big( not sure about this) and it can't be abstracted.
</pre>
    <pre>As one approach , can we think about shared object in user mode for each vendor ( this approach was in android for hardware composition) and this small component can do</pre>
    <pre>LUT's , scaler coefficients content and other not compatible stuff ) ?</pre>
    <pre>For example, tiling is already has nice abstraction level&nbsp; like&nbsp; dma buf modifiers .</pre>
    <pre>Another approach , I am not sure if user mode can request abstraction from driver regarding color pipeline</pre>
    <pre>in accordance to ICC spec. In fact all display engine pipes are look very similar to ICC spec which grew also from 8 bpc to half float.</pre>
    <pre>If we take this as baseline then we can try to abstract and this may be beneficial for entire Linux ecosystem and move forward together with Color Consortium.
</pre>
    <pre>Thanks, Vitaly
</pre>
    <p><br>
    </p>
    <pre>
</pre>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20201020150443.GZ6112@intel.com">
    </blockquote>
    <div class="moz-signature"><br>
    </div>
  </body>
</html>

--------------93A32BF94057B7ABB4E62EB9--

--===============1456535687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1456535687==--
