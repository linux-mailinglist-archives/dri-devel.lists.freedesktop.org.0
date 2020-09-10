Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18794264AB9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 19:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7EF6E10E;
	Thu, 10 Sep 2020 17:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44486E10E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:09:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPtEC7yTlQgL5AyBwi6pxjQsEDP71ssxBy+8rErY2vwkVw03jcxSBbzQpXARjx3HFWbpdMCpymLh44S0vpk6iaWGeNGsQsQ0+LNJIHGeueZD/mdoo2RZ5ns+EAnbawOaX4dNE1jr3RsNRaYhyz3WhxSnRID9BTWoesHTi80mBx9kpULv6i9ihAL1OVoFEyAVNcSaws0YPLGwAVPI3COj2zCnUofLmup6yXxyUQR4iQJpdWNL5l+I9JgRecyYvvcIQ64/dFEbNJjwWn5pt8Jzadl6xEdzB4v0vm1dd9Qj3jYkOC9lOln4MHeerqqqwCZUoD1XQ/AfgTU3bb09k/AWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE15kc1MBbo16p59svmzFTnP0I2zPgAJFTttM5tcuog=;
 b=Apcy2u/B7ah+bqrSWBrbs8sNm6nLdCFAST28qhSjMYxVuopJ9qSXoiD7WEIUXun7D/w9YqNzS7LL6nH/nlBJy8wYaXZvHuoXOTU8hRkbLFx7rhDZKD8Loakslvj2J5QplRd/pKF8C3VL63O2PZbrjWtI8wLVIU8P7PApupDKR7JX7lUJJHOcIUUmBW0bjD6q0O4bHgxjaQ6n02tFGEi3aK5EdZ+g9ACqQA+e8sTkln3UCAmpl889HYumrh/TyY9ev0NzQDrFAK6I8FZzesh3Sb2UoQd9M682k8vBe+tgSTiCLzj5WOBcSFv7D8zpheROEGQ+xk5kBsajiBECzOzu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE15kc1MBbo16p59svmzFTnP0I2zPgAJFTttM5tcuog=;
 b=BpGEAwSzVLdxKrHnm2sEZ9ZTsNmQjoLLjAmYcfkd4x7WkbMNg7RXQB+SHsROVkwuViDO1hTSDsm1KyxqnTPFCUoZWvyMp39BlmOx/0wtYtTo/v3LuHFGmscjwigIRSOC6JTB9aUGaoU7gaQBoYHWBOBYnvH1JW1yfTghoCkoOC0=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MW2PR12MB2347.namprd12.prod.outlook.com (2603:10b6:907:7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 17:09:13 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 17:09:12 +0000
Subject: Re: per-plane LUTs and CSCs?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
 <20200910132803.14dc028d@eldfell>
 <20200910105618.GE3940@pendragon.ideasonboard.com>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <5f39e5ee-bf2b-e4dc-7584-7e6cd4c5b104@amd.com>
Date: Thu, 10 Sep 2020 13:09:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200910105618.GE3940@pendragon.ideasonboard.com>
Content-Language: en-US
X-ClientProxiedBy: BN8PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:408:94::22) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.2.74] (165.204.84.11) by
 BN8PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:94::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 17:09:07 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8e8b0c7-dd0e-4c65-9ab3-08d855ac3d4b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2347:
X-Microsoft-Antispam-PRVS: <MW2PR12MB23477D1FFE5BAAD9176D6FC881270@MW2PR12MB2347.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpV3yScyzMjA2C2Or8RQsVi/LM/N+t/kPhcmGd1GWZEOYfwOvkd1UnxlXSbKtL/3P9g6o3rSD8uzEIjuipJ5oVBf0WFP3pDarnvXg3ICIWqiEud7U3XEbHNG7peNVDtbYjSTHTS8/Sk+Yxr4CjIvjGdtcY6flqiRnQNMTuQnw4OBnFuniCQyptiZJLV6y3yC118FxV+upCmdfVN9awdGOaffpzvz3Vj1so/iMR9aoGyKQrA2W4UwnaJkNfGmk4s8F2z0MI/raLd2OFCZO1CL4WUMVyW9w45VYa4RN27cf0t9Nne42l7Pl06fOe5tGJtKUWf7nghI+igx6LiLbcsxwWEvg2U0U96lmw0ZTH3rRhLOyLsdtKX1g3feK8bHkhwq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(31696002)(6666004)(316002)(8676002)(16576012)(54906003)(16526019)(110136005)(5660300002)(36756003)(6486002)(86362001)(44832011)(4326008)(83380400001)(3480700007)(52116002)(53546011)(33964004)(26005)(66556008)(186003)(2906002)(478600001)(8936002)(66476007)(956004)(2616005)(31686004)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ayhVSbTytzBOgmtclR17DNc1ANu3Lhox+43Fjy+R9nitEijZMw+EaWn+uWF9kU9L5pmy9Npw9qF3c70LkbApkLJ9NAJXvmNfQpGADCz4G1740UOVafltnwLWVG4uy9j2InYRLwkdyfD7IxQ1rqvJESa4daqfHhTF9vZUrT78U2vHC8IlHkL/iq+z/mFOzpUy00MPgmMYKJ1IoCoH6kwPlsOqRKLKZVTlg4Xt0UMKrYh2uDqFHm1y9xAcRFgm21Tjov72++yUYZtT5i9eeD53my7KWaVmRHVBTHFI//ai0rDHGNj1fZT+GvracpxgAAA0O5gxdUNguQV7S8XjbU020yj2nqpL42Vj/B5PFp0W6tkkk7ApeqYxL+YA09OwWlWA6oLhcIyCdcdMlrzlzV2xFcweHO36Cc8HhAQS5AjZ+eY1gLM3QNcBYJfBFW69FJ6QyxdDzMNQACvyJHt9D4JaTPUibCgDJY8QsRTR9s1VntKw6X7tXA1FlpoiEtU/nVtPdl5HA7xA3u3jasBXF9bG0diV0dnICmN853deAb6CMlT7M969eQWpnPoAWo6+/LKselFYjrYQRWSN8ol//fxGktAzJwX/z+w3u7v4RQIKMKesI5AZu/jTJ28/fZRUdkUkqKTkGU+ztjPUfinsSV739w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e8b0c7-dd0e-4c65-9ab3-08d855ac3d4b
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 17:09:12.7743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td7rDuDmikYtzniMGqHlBG6n/1wX41xd/gktMVnmWo+IkMMZBBh21/zRHet0qzzEGPUcQhNsJ/ucX6EB3kK0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2347
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1421549198=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1421549198==
Content-Type: multipart/alternative;
 boundary="------------1FEB9AF259BA85FE3BF3CE4D"
Content-Language: en-US

--------------1FEB9AF259BA85FE3BF3CE4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-09-10 6:56 a.m., Laurent Pinchart wrote:
> Hi Pekka,
>
> On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
>> On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote:
>>> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
>>>> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
>>>>> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
>>>>>> On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
>>>>>>      
>>>>>>> Hi all,
>>>>>>>
>>>>>>> I was wondering whether you could give me an advise on how to proceed further
>>>>>>> with the following issue as I'm preparing to upstream the next set of patches
>>>>>>> for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
>>>>>>> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
>>>>>>> respectively. Then the output from those 3 pipes is blended together and then
>>>>>>> gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
>>>>>>> needed.
>>>> Hi,
>>>>
>>>> hmm, so FB -> CSC -> LUT -> CSC -> blending?
>>>>
>>>> Is it then
>>>> 	blending -> LUT -> CSC -> encoder
>>>> or
>>>> 	blending -> CSC -> LUT -> encoder?
>>> The DCSS pipeline topology is this:
>>>
>>> FB1->CSC_A->LUT->CSC_B-\
>>> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
>>> FB3->CSC_A->LUT->CSC_B-/
>>>
>>> Basically, CSC_A is used to convert to a common colorspace if needed
>>> (YUV->RGB) as well as to perform pixel range conversions: limited->full.
>>> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
>>> convert to the colorspace used by the output (like RGB->YUV).
>> I didn't realize that it would be correct to do RGB-YUV conversion in
>> non-linear space, but yeah, that's what most software do too I guess.
>>
>>>> Are all these LUTs per-channel 1D LUTs or something else?
>>> LUTs are 3D, per pixel component.
>> Sorry, which one?
>>
>> An example of a 3D LUT is 32x32x32 entries with each entry being a
>> triplet, while a 1D LUT could be 1024 entries with each entry being a
>> scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
>> you need just one for the color value triplet mapping.
>>
>> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
>> channel mixing that a CTM can.
>>
>> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
>> blocks exist...
> Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
> R-Car), having a separate CSC can give more precision (as well as
> allowing the two problems to be decoupled, at a relatively low hardware
> cost).

If you put nonlinear signal to 3DLUT then your
precision would be improved.
How many bits each color value has in 3DLUT ?



--------------1FEB9AF259BA85FE3BF3CE4D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-09-10 6:56 a.m., Laurent
      Pinchart wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200910105618.GE3940@pendragon.ideasonboard.com">
      <pre class="moz-quote-pre" wrap="">Hi Pekka,

On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:  
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
    
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Hi all,

I was wondering whether you could give me an advise on how to proceed further
with the following issue as I'm preparing to upstream the next set of patches
for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
respectively. Then the output from those 3 pipes is blended together and then
gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
needed.  
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Hi,

hmm, so FB -&gt; CSC -&gt; LUT -&gt; CSC -&gt; blending?

Is it then
	blending -&gt; LUT -&gt; CSC -&gt; encoder
or
	blending -&gt; CSC -&gt; LUT -&gt; encoder?  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
The DCSS pipeline topology is this:

FB1-&gt;CSC_A-&gt;LUT-&gt;CSC_B-\
FB2-&gt;CSC_A-&gt;LUT-&gt;CSC_B-|-blender-&gt;LUT-&gt;CSC_O-&gt;encoder
FB3-&gt;CSC_A-&gt;LUT-&gt;CSC_B-/

Basically, CSC_A is used to convert to a common colorspace if needed
(YUV-&gt;RGB) as well as to perform pixel range conversions: limited-&gt;full.
CSC_B is for gamut conversions(like 709-&gt;2020). The CSC_O is used to
convert to the colorspace used by the output (like RGB-&gt;YUV).
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I didn't realize that it would be correct to do RGB-YUV conversion in
non-linear space, but yeah, that's what most software do too I guess.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Are all these LUTs per-channel 1D LUTs or something else?  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
LUTs are 3D, per pixel component.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Sorry, which one?

An example of a 3D LUT is 32x32x32 entries with each entry being a
triplet, while a 1D LUT could be 1024 entries with each entry being a
scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
you need just one for the color value triplet mapping.

A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
channel mixing that a CTM can.

So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
blocks exist...
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
R-Car), having a separate CSC can give more precision (as well as
allowing the two problems to be decoupled, at a relatively low hardware
cost).
</pre>
    </blockquote>
    <pre>If you put nonlinear signal to 3DLUT then your 
precision would be improved.
How many bits each color value has in 3DLUT ?
</pre>
    <blockquote type="cite" cite="mid:20200910105618.GE3940@pendragon.ideasonboard.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature"><br>
    </div>
  </body>
</html>

--------------1FEB9AF259BA85FE3BF3CE4D--

--===============1421549198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1421549198==--
