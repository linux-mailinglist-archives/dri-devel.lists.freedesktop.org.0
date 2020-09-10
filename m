Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B565F264C42
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 20:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1276E071;
	Thu, 10 Sep 2020 18:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AA66E071
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 18:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4hJRBCGR5TpTGb5Prvp3tGiqCqyQfkqGdM4FN2c6W2iV1ubcoBOU6GQ1iKvcdIiueAD2P0cgfwVBu/LANPIJ4WFPKYtTNr9D+E1heKvdA0QrfKIHWw4Eg5XpzNb757IqxFK23a/WlZhLh76BzkVe/d8NFK+2ne/d97S1IaUL5ejy2BChURlr5VjiVpLCpVqSxZ2DulpslhxU4E8WjGdQKFxDQt9Q0vfhndGkCjUkjVYrjKLlnmYykhwavYDwLl1vMCz0kL5SqXWIcTzn5Lrlp4eDUqCYk51488yK2lFB0kyrJFyglIPj2TFbNO+vwINZCrZeq6uAWpRTZ/hyDomZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS/CplOxk5A5YLI3ypl8GahvDW6WVUZ9yNdeWoJyZLE=;
 b=Wm6TcUTKoGreYbktklZbASLs/JUWDnMZOljgxVe47ya0tkZn3YWAoMX4JRKz2NiBSdFex6XiLwB3KBCdzQlslVjFmxw5iN5Cgd77It8wocqGHdExGpTM93t4UPLiPJUyt1A4GWu3u9D5p7QHHgEfTM2YnnMFyU/IkcsoHslrCa+6T45FH+U9Phgum1OAPsyIjK0ZbfQhhV2WUPfxi1co52MfCvG6uzMEvZ5/KmkLtz2BIXCkgl8tcS9Wc//YUieU7dian89p93x4/nFne5ABMSq5Pv7n4rdV0vv6oRU0bEV4ZQaTpaD43iwnRQM2OxK+eQk+B30IEzqjpl23QoN/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS/CplOxk5A5YLI3ypl8GahvDW6WVUZ9yNdeWoJyZLE=;
 b=ck45ZrVe9z0OZS8dFb1ujXA6L8JMJxp0C0gPQ0e3pbgdK90VzNVM8C7jKEK9WCrKvan6CbhdWr8wpMkDSwIGgFfjQl+u/Zv1RtfpKAkc9iZxfOcG0fFUzPTYAAXfG4z9TNGklD3SEel4wkMzm3bmbXrMSRjJVGhWnz7Y/hDYN7s=
Authentication-Results: sebastianwick.net; dkim=none (message not signed)
 header.d=none;sebastianwick.net; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (52.132.180.141) by
 MWHPR1201MB2508.namprd12.prod.outlook.com (10.172.95.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Thu, 10 Sep 2020 18:07:30 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::4057:8e1f:56f1:9e2f%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 18:07:30 +0000
Subject: Re: per-plane LUTs and CSCs?
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
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <536023f7-e5c1-d1fa-fd4f-e2378f1077e2@amd.com>
Date: Thu, 10 Sep 2020 14:07:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200910175113.GG3940@pendragon.ideasonboard.com>
Content-Language: en-US
X-ClientProxiedBy: BN0PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:408:e4::22) To MW2PR12MB2474.namprd12.prod.outlook.com
 (2603:10b6:907:9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.2.74] (165.204.84.11) by
 BN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:e4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 18:07:28 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc8443e5-31e4-4379-e826-08d855b4625f
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2508:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2508BD7A1ADCF5B59367929981270@MWHPR1201MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVNXLCBRJfkxaOe0cBA6wCnsoJzxFWUPBhPbjFfe+b0hUEJYn2R0ZeJLvVxJn27huOqPO9ZntihbwJZpQ0yS8ukBi67ybz6Xr2o3w6JnLv09a1Cj3m8l6Kc9ZU+xKcSSqyBIJflQz/L9AFTboyiFxhv8UI0x9YiVvyG7H1vnMbURNeGgkrTD3NYUMUMwyedvPTNgPJi/Jrw+Mxwvkh68yy8nB9lj+A0K8MLaf1REKairgxifTZOLxBvbvYEHmKjJIf3dJGBFA5eT0i2PvEAtw1a3L6i0dVEmR2URwCzvY/yGdi4MUNlpWiegMdgQPXVHgEIjOILowrg/VOojENhYgkffzZcUeSUFvpZOceC3bLEwwLW9Nzxy3IK+SB/AVvi6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(54906003)(316002)(66556008)(31696002)(26005)(6486002)(86362001)(66476007)(44832011)(16526019)(16576012)(83380400001)(31686004)(53546011)(33964004)(8676002)(5660300002)(66946007)(4326008)(478600001)(186003)(2616005)(956004)(6666004)(2906002)(52116002)(6916009)(36756003)(3480700007)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cBBXJXRmv8I+1b4FWReyK2thywV1+dwyoC6dTo2PRSwKHO5aAsdoh5ADEjfo/kCd66wIMqLNz5jyUM7QfVzqAmjumTuS8CfMuwJqCImNl0FitiWo+VMxOnnzKbDQkr14tkIntTE1iXT2jTTq9fQDvUI/znvNSw20d4a8nfoI1DhYo6mLl+7JVA7eP8iDHCm38nuUnvcYO3Vb3ndxtwz44hhafXeWGZp0avUxBaokxtEHE9k/QP2b8mNbhMpfeuqs/FY21eRiDRfQIh553UTxWLT2Y53aDj0qP+QxAzWza0xDrfvjH/Xy6lBe9ROYvBHCg4NPnbWD1EI2E6q/1lClqvr1kzlzAkhN0boxJ2/iVEulGRsWGg7rK7XXvBKp5FWmZ6sUY7U1lHbJR0cSkfjWYxRIWcAxsJF6ER827rWOQ5HTKfnkh73qL5PT8XWJdUw1Ct5Vc658y6YTfccq6Io+r2wW1k3BkF3D8aNl6mjZlN5UKsfIdrbNZQpE+JX2LgplZGkDqFjbhgz40i5sJybsOK3MAZF8FjXDSjcTEOyW6RL3+zIBr23IsXpiQPMF+NkSvncpFRB6RwTR3J64hBlGenbucitk+gCbibftZaf83tPx3v8srAoCpedsxIbXdveGh8QRu4NXtTMoTWoCe/dffQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8443e5-31e4-4379-e826-08d855b4625f
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 18:07:30.7451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrNCfXyEl56KFC/55kB7ctnsk+KjCIkizANjI9JcZL88we61NqM9AnrHDjNt3bdqgRaqg73jfZAE6Tue93CoKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2508
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
Content-Type: multipart/mixed; boundary="===============0881036199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0881036199==
Content-Type: multipart/alternative;
 boundary="------------EA7C305F308CD67F2AEC99B5"
Content-Language: en-US

--------------EA7C305F308CD67F2AEC99B5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-09-10 1:51 p.m., Laurent Pinchart wrote:
> Hi Vitaly,
>
> On Thu, Sep 10, 2020 at 01:09:03PM -0400, Vitaly Prosyak wrote:
>> On 2020-09-10 6:56 a.m., Laurent Pinchart wrote:
>>> On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
>>>> On Thu, 10 Sep 2020 12:30:09 +0300 Laurentiu Palcu wrote:
>>>>> On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
>>>>>> On Thu, 10 Sep 2020 09:52:26 +0200 Daniel Vetter wrote:
>>>>>>> On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
>>>>>>>> On Wed, 9 Sep 2020 13:57:28 +0300 Laurentiu Palcu wrote:
>>>>>>>>       
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> I was wondering whether you could give me an advise on how to proceed further
>>>>>>>>> with the following issue as I'm preparing to upstream the next set of patches
>>>>>>>>> for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
>>>>>>>>> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
>>>>>>>>> respectively. Then the output from those 3 pipes is blended together and then
>>>>>>>>> gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
>>>>>>>>> needed.
>>>>>> Hi,
>>>>>>
>>>>>> hmm, so FB -> CSC -> LUT -> CSC -> blending?
>>>>>>
>>>>>> Is it then
>>>>>> 	blending -> LUT -> CSC -> encoder
>>>>>> or
>>>>>> 	blending -> CSC -> LUT -> encoder?
>>>>> The DCSS pipeline topology is this:
>>>>>
>>>>> FB1->CSC_A->LUT->CSC_B-\
>>>>> FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
>>>>> FB3->CSC_A->LUT->CSC_B-/
>>>>>
>>>>> Basically, CSC_A is used to convert to a common colorspace if needed
>>>>> (YUV->RGB) as well as to perform pixel range conversions: limited->full.
>>>>> CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
>>>>> convert to the colorspace used by the output (like RGB->YUV).
>>>> I didn't realize that it would be correct to do RGB-YUV conversion in
>>>> non-linear space, but yeah, that's what most software do too I guess.
>>>>
>>>>>> Are all these LUTs per-channel 1D LUTs or something else?
>>>>> LUTs are 3D, per pixel component.
>>>> Sorry, which one?
>>>>
>>>> An example of a 3D LUT is 32x32x32 entries with each entry being a
>>>> triplet, while a 1D LUT could be 1024 entries with each entry being a
>>>> scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
>>>> you need just one for the color value triplet mapping.
>>>>
>>>> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
>>>> channel mixing that a CTM can.
>>>>
>>>> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
>>>> blocks exist...
>>> Possibly because the 3D LUT uses interpolation (it's a 17x17x17 LUT in
>>> R-Car), having a separate CSC can give more precision (as well as
>>> allowing the two problems to be decoupled, at a relatively low hardware
>>> cost).
>> If you put nonlinear signal to 3DLUT then your
>> precision would be improved.
>> How many bits each color value has in 3DLUT ?
> The whole display pipeline uses 8 bits per component.

It is pretty low , please, use always nonlinear signal in the pipe and it allows you to compress and 'win' about 2 bits.

-- 
[AMD Official Use Only - Internal Distribution Only]

--------------EA7C305F308CD67F2AEC99B5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
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
                <pre class="moz-quote-pre" wrap="">Are all these LUTs per-channel 1D LUTs or something else?
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
        <pre class="moz-quote-pre" wrap="">
If you put nonlinear signal to 3DLUT then your
precision would be improved.
How many bits each color value has in 3DLUT ?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The whole display pipeline uses 8 bits per component.
</pre>
    </blockquote>
    <pre>It is pretty low , please, use always nonlinear signal in the pipe and it allows you to compress and 'win' about 2 bits.</pre>
    <blockquote type="cite" cite="mid:20200910175113.GG3940@pendragon.ideasonboard.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      [AMD Official Use Only - Internal Distribution Only]</div>
  </body>
</html>

--------------EA7C305F308CD67F2AEC99B5--

--===============0881036199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0881036199==--
