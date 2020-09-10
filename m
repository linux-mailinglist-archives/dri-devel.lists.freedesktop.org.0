Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26A264F45
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 21:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33E36E187;
	Thu, 10 Sep 2020 19:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E536E187
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 19:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM1wgjYwVHiI/ZBZjmf1X/7uiIyQpXriIGKQdcJafuO96rygbhp7VLthpLwCi/e9W4zGkGIgcfcoU4/ZhJEKMpwiO3AYLOMYx+q5bRhSq43X2XZ1fc39p9VPeyTE33X65WuJ8iVJfUOjQOsnTCJ6UWfZkzaK8YDqjqCnEemah4e5+m17P/5tos3xBqdE1LkYQMm7gOhjLD1S8sGiTkKCFxSjwwC5iw9DO99HTNi9mPfKxtOr/3eLKrZbmDztk3obBt0h6MKSTyAPCZp9haxLn6YdliUpssALiAgzvztZIAf09uV+uOsTT76eNvncUUE5/N2tEx9A/DB9YTu+Us+U9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX5pdUx8tekwO4oBGbNflACYUgGxZV5H5xeZdrFw+xs=;
 b=YSiVF01esfY2/ozLUJFV0BNzZR8kUbvH/aEOKTSthke4OJH7yImL6750TiywFFT4IGIOyHj3Or1yigKhFlIcyW1OS7Appk3uakXS1N9Pk/SpE2LYHuJ5FMN8SwsG2dHBuT4JGdCtubQ+ZsJ+lzuG6V1E+fk3FCiT1GMq+wWXdpEabOeSAyIbBgA5l58Vpa5WT1bQ763gePG2CQXiHfkufWV8Xi8eFhBu1FWsTCRBj+6s/GOYhwctDAS+skEyasTwb9WcfwCI67qTS5fQ++hIWgSTEGTtwKVspQCTfSfmlB0WeguUN+Pi9C718mAtBmcxroWsNVxRr9fwv/kkm1Q1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX5pdUx8tekwO4oBGbNflACYUgGxZV5H5xeZdrFw+xs=;
 b=BeOHd1RwYAaoDmIMt7eVoTIDnsOILVeVbKX1IhFkvZqwdFYSkO+AxdZzpkipDgAk9XAfjbVxWuLfBbDBV9EMxijCp0WlggQdIHUP9MHa/y74KhAdPyYGfKhc6qPzqQt94d8rU3+FLMT2HUnnfoLvYkx19PkG4X5JZcDZBGHaYZ4=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MWHPR1201MB0143.namprd12.prod.outlook.com (2603:10b6:301:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 19:39:14 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 19:39:14 +0000
Subject: Re: per-plane LUTs and CSCs?
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
 <20200910132803.14dc028d@eldfell>
 <20200910105618.GE3940@pendragon.ideasonboard.com>
 <5f39e5ee-bf2b-e4dc-7584-7e6cd4c5b104@amd.com>
 <20200910175113.GG3940@pendragon.ideasonboard.com>
 <536023f7-e5c1-d1fa-fd4f-e2378f1077e2@amd.com>
Message-ID: <00ed1099-fbcb-6bd7-79a4-7b2890c78aa3@amd.com>
Date: Thu, 10 Sep 2020 15:39:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <536023f7-e5c1-d1fa-fd4f-e2378f1077e2@amd.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR2001CA0038.namprd20.prod.outlook.com
 (2603:10b6:405:16::24) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.2.74] (165.204.84.11) by
 BN6PR2001CA0038.namprd20.prod.outlook.com (2603:10b6:405:16::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 19:39:11 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc59b66c-21c5-4971-6aa0-08d855c13269
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0143:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB014384AD1E949F163BBACAE181270@MWHPR1201MB0143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nCsm0y0uoUXLLd0OcZ1C/CpygySf4xQ+Z0gTIwvWWF2tCXA2pb4/s09r+0DJnJ3OQtc2xoFX9RLUqV7px+5TAqhCthMN8PW5aDEQOMGe7HLJENHb8ytA3jIqmV0C8egHZHbNfSNwzHjVmHpJyAxUy+eOEPbKF9pxIF4FHXgGzysQOYv6j3f7j8GS//VIHQkOkAhUIICqim7QAEWleDkgwsNZAYE8Qxu/Rr0MsPqT8EmR0nraacQUO3EsH88on5Al1JZL0aUfdefehwmH1leRmjH4RHfyugMnMCuHcgQP1GRCvv+GJdtHJGSFos2goOjCeIljms31bJBRwL1wpAAuJWhw5lpA+DvliuO7E/9+O/QCqf1xLOLYs8JBB+v7Uv0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(8936002)(956004)(4326008)(2906002)(86362001)(83380400001)(54906003)(66556008)(66946007)(31686004)(66476007)(36756003)(44832011)(33964004)(16576012)(478600001)(16526019)(2616005)(52116002)(5660300002)(186003)(31696002)(6666004)(6486002)(8676002)(6916009)(26005)(316002)(53546011)(3480700007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: u2w3pK62QTiA/ONEcyffqOqT5qY0dgApKyT1uUCn8ayPExuI57VpiCTLneOQY2BZPkt2SedQPCfJiZgIXbvVoro9vgmKJfHeR6QJw5e6zSXEmq41BJzlv7lsgb4cdqDcYnc1QN4Er61tnWQQQkc+MiRfat3FvGHD6JsRTiFiCXskQwsqlfv+ydhc13SQNn0DkUXUxVsyp6DPa/e2/9AHRVAf+ZGE2Uz9KPzthG1MuhXhDTK3hMqdynu+Ma4i6KT/OwZOzjtHdSm1NHulpAI3sgUhys1BtI6bo7r96wtbxtU1VeRLZXPVV3PwtkpdUMcLSSq5SE1aM6dhWx8EwPMGTeSBeEyH+yV/PoGLJ+pzsuAKBR578jNymXMacNkQ7tHU6zK1fpUQNHN+inJKlMC5L40cY0DjEogtMV7bxHq2krJI0sfdBPBTJQvO9FfkMJWktpYihqmWqUUtsz7HTx4msTQbg0Zk0vlZI13SGY/em1n0+IezeLq6ZtTlVg1D+FihWy4MqywB0bovd/N6D3Zzki16CjFDcNWF5Fi+zuQUTU5cuVEFEM7SueF2AL8FGDr+ODWEcF/j9kV8gPdFj1rzrRw1QJpszSZzpgXHBYhurirhQRk0JvUI7SaJHETbNRxZwJtJwV3ZfBk0sz+gF64aiw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc59b66c-21c5-4971-6aa0-08d855c13269
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 19:39:14.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIEf0aphM4h+3g39hNU4FF5ZLZKc1cqE8PVgqFztUmdNyg5y8Lq74uGl/O8+reEqgXuo3U6etWh+4dvaFYonpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0143
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
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1142789346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1142789346==
Content-Type: multipart/alternative;
 boundary="------------7F54EF0603E79BF0AD07782A"
Content-Language: en-US

--------------7F54EF0603E79BF0AD07782A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-09-10 2:07 p.m., Vitaly Prosyak wrote:
>
>
> On 2020-09-10 1:51 p.m., Laurent Pinchart wrote:
>> Hi Vitaly,
>>
>> On Thu, Sep 10, 2020 at 01:09:03PM -0400, Vitaly Prosyak wrote:
>>> On 2020-09-10 6:56 a.m., Laurent Pinchart wrote:
>>>> On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
>>>>> On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote:
>>>>>> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
>>>>>>> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
>>>>>>>> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
>>>>>>>>> On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
>>>>>>>>>       
>>>>>>>>>> Hi all,
>>>>>>>>>>
>>>>>>>>>> I was wondering whether you could give me an advise on how to proceed further
>>>>>>>>>> with the following issue as I'm preparing to upstream the next set of patches
>>>>>>>>>> for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
>>>>>>>>>> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
>>>>>>>>>> respectively. Then the output from those 3 pipes is blended together and then
>>>>>>>>>> gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
>>>>>>>>>> needed.
>>>>>>> Hi,
>>>>>>>
>>>>>>> hmm, so FB -> CSC -> LUT -> CSC -> blending?
>>>>>>>
>>>>>>> Is it then
>>>>>>> 	blending -> LUT -> CSC -> encoder
>>>>>>> or
>>>>>>> 	blending -> CSC -> LUT -> encoder?
>>>>>> The DCSS pipeline topology is this:
>>>>>>
>>>>>> FB1->CSC_A->LUT->CSC_B-\
>>>>>> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
>>>>>> FB3->CSC_A->LUT->CSC_B-/
>>>>>>
>>>>>> Basically, CSC_A is used to convert to a common colorspace if needed
>>>>>> (YUV->RGB) as well as to perform pixel range conversions: limited->full.
>>>>>> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
>>>>>> convert to the colorspace used by the output (like RGB->YUV).
>>>>> I didn't realize that it would be correct to do RGB-YUV conversion in
>>>>> non-linear space, but yeah, that's what most software do too I guess.
>>>>>
>>>>>>> Are all these LUTs per-channel 1D LUTs or something else?
>>>>>> LUTs are 3D, per pixel component.
>>>>> Sorry, which one?
>>>>>
>>>>> An example of a 3D LUT is 32x32x32 entries with each entry being a
>>>>> triplet, while a 1D LUT could be 1024 entries with each entry being a
>>>>> scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
>>>>> you need just one for the color value triplet mapping.
>>>>>
>>>>> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
>>>>> channel mixing that a CTM can.
>>>>>
>>>>> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
>>>>> blocks exist...
>>>> Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
>>>> R-Car), having a separate CSC can give more precision (as well as
>>>> allowing the two problems to be decoupled, at a relatively low hardware
>>>> cost).
>>> If you put nonlinear signal to 3DLUT then your
>>> precision would be improved.
>>> How many bits each color value has in 3DLUT ?
>> The whole display pipeline uses 8 bits per component.
> It is pretty low , please, use always nonlinear signal in the pipe and it allows you to compress and 'win' about 2 bits.

Do you have alpha and de-alpha blocks in your pipeline?
You can do CSC and blending in nonlinear mode, it is less accurate than in linear, but it is viable way.
Also alpha should be removed (if it is applied) before CSC.



--------------7F54EF0603E79BF0AD07782A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-09-10 2:07 p.m., Vitaly Prosyak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:536023f7-e5c1-d1fa-fd4f-e2378f1077e2@amd.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2020-09-10 1:51 p.m., Laurent
        Pinchart wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20200910175113.GG3940@pendragon.ideasonboard.com">
        <pre class="moz-quote-pre" wrap="">Hi Vitaly,

On Thu, Sep 10, 2020 at 01:09:03PM -0400, Vitaly Prosyak wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 2020-09-10 6:56 a.m., Laurent Pinchart wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
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
                  <pre class="moz-quote-pre" wrap="">Hi,

hmm, so FB -&gt; CSC -&gt; LUT -&gt; CSC -&gt; blending?

Is it then
	blending -&gt; LUT -&gt; CSC -&gt; encoder
or
	blending -&gt; CSC -&gt; LUT -&gt; encoder?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">The DCSS pipeline topology is this:

FB1-&gt;CSC_A-&gt;LUT-&gt;CSC_B-\
FB2-&gt;CSC_A-&gt;LUT-&gt;CSC_B-|-blender-&gt;LUT-&gt;CSC_O-&gt;encoder
FB3-&gt;CSC_A-&gt;LUT-&gt;CSC_B-/

Basically, CSC_A is used to convert to a common colorspace if needed
(YUV-&gt;RGB) as well as to perform pixel range conversions: limited-&gt;full.
CSC_B is for gamut conversions(like 709-&gt;2020). The CSC_O is used to
convert to the colorspace used by the output (like RGB-&gt;YUV).
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">I didn't realize that it would be correct to do RGB-YUV conversion in
non-linear space, but yeah, that's what most software do too I guess.

</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Are all these LUTs per-channel 1D LUTs or something else?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">LUTs are 3D, per pixel component.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Sorry, which one?

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
            <pre class="moz-quote-pre" wrap="">Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
R-Car), having a separate CSC can give more precision (as well as
allowing the two problems to be decoupled, at a relatively low hardware
cost).
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">If you put nonlinear signal to 3DLUT then your
precision would be improved.
How many bits each color value has in 3DLUT ?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The whole display pipeline uses 8 bits per component.
</pre>
      </blockquote>
      <pre>It is pretty low , please, use always nonlinear signal in the pipe and it allows you to compress and 'win' about 2 bits.</pre>
    </blockquote>
    <pre>Do you have alpha and de-alpha blocks in your pipeline?
You can do CSC and blending in nonlinear mode, it is less accurate than in linear, but it is viable way.
Also alpha should be removed (if it is applied) before CSC.
</pre>
    <br>
  </body>
</html>

--------------7F54EF0603E79BF0AD07782A--

--===============1142789346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1142789346==--
