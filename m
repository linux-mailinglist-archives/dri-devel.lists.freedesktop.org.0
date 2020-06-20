Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9E2024A4
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 16:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E146E2F8;
	Sat, 20 Jun 2020 14:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FBE6E2F0;
 Sat, 20 Jun 2020 14:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJfD2e0Jl/Pw8NwQHJZ8MXcQdfy3iq8UsmKhlvbuJszzLhPjB9VD5yoThXFIjpdd66t2BPTtLENpyl/fvJOUMGnN+nmBkkjITatUUEWpwPOy/lw470Jtk0LBcaj9Ua+Pnk517KQUFyfUcbPwANzT7WumGJVZ1vwkdEyBpl64MxDEU8WNceZRYzx7WWTAwJwSHkCme/d0ItUQzZFW0j+qb/yuDZiBAvhZC6EmEo4caHUgdxk7Ajxq+y/TypJcBuBZE/X7CedYAR6qg0gQUn7qJDwv9Tiz7zUwYvDh4qw2NGZPwyh9+uddy4WAyU2c/OWQ1e5UACEIijPSqQveIpSCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHbvgexWbvin/gXNw/AJ0pEvLCReK3vKDXYXyHgYsHI=;
 b=LN1/MmjRqiyl3d0SGXmHNgQFW5nBVciE379JKoC0O1FIzUM0xbFSOvZxDw46ZKTgO0uF0+CHUgh84rhonBTtP++3aZm7KL18wLN3t8bncTkdm9jcEwCmjqtUiPDjKHZruZILKHGWzUmxjDX6o9RHf1WjDRSPo3ybdC3hrnL+QEfotWRASC0uDp/erBJJh43isxTU5bY/pE7zN+A23b6cXKtYtvhxwbu9JyqJSgF8qEMWIU1W0EOqXrQF4dIdKcZoVlrQ87l00qV8Eh48f5or4ImOqcD0om8k2orakGpEmw/hc4e0P8xFKUTBK2mBXFmnB1yMtxmctUk33hrLPAN7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHbvgexWbvin/gXNw/AJ0pEvLCReK3vKDXYXyHgYsHI=;
 b=k6z4stSS+Rtt0A4e4DVo1WkTyGBe8Mijpn5vwESXWDh3PsAqLkPaZmzi2AsY3xHK87dFCN4Lxl0Uh4NY3ahl8/IkHZlrZJEzzQ8ip+9eRYcCZyi50okZrhdgufywEKCrsBc1UZNrwKIBanPAjMCIPeigYGle6LWzT8cy7LgFg+E=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sat, 20 Jun
 2020 14:56:27 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Sat, 20 Jun 2020
 14:56:27 +0000
Subject: Re: [PATCH v3] drm/amd: Fix memory leak according to error branch
To: Julia Lawall <julia.lawall@inria.fr>,
 Markus Elfring <Markus.Elfring@web.de>
References: <119b7d8c-b164-ef23-84cc-4904d34ac023@web.de>
 <alpine.DEB.2.22.394.2006201520590.2918@hadrien>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ac1afaeb-4f90-dafd-4fe4-06082edda36a@amd.com>
Date: Sat, 20 Jun 2020 10:56:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <alpine.DEB.2.22.394.2006201520590.2918@hadrien>
Content-Language: en-US
X-ClientProxiedBy: YQBPR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::31) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YQBPR01CA0095.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Sat, 20 Jun 2020 14:56:25 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1c3eeb8-1b9d-40ed-881a-08d8152a1b9b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB244564956EDE08A79DA902CB92990@SN1PR12MB2445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0440AC9990
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIohs6K2tJo83tx4FK2xQgHzCcoL42hHEbhcmK4sgeuyEeoWjPw/+Q+o1iUP2aLtxI/aPSU3A2E6ro1o06bIpBpwjIr7B4WRIm0FzBDd5iMIfwKiSP5a6I+03+iB5RKM5c5MzgGqPYKHIihi4RxyPNFpgdQHrjil5xesCSWY6q6rK/ONGOyZ2+UykqQpYf7Zk3LWhC7gOIHuMCNtNGjSCtPg9YFzzHJmhRR+0RRhVNH728k0Yf51m0sOUCDHAzUuDs2bW1yFBXDT1J+HkJXF+mxcCmFq8H4DiWXmCtLx2eFmZ4EtnEEL4AsoPe0jE8LTvpIqB+eix+dvhJAlQgfe8wVD+5R8GoWjV/LdhzCbzx1tWfpXGMp7/v6KaNypfxvsRVLhE7AHZjEbE9+0YOqeHzSTYnhh16CwXS1ShiCaBcoZXN3JRG1/XlQHeRrQAkZlZL1k3GWJs2jZRR1pyUl9yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(8676002)(4326008)(2906002)(31686004)(186003)(26005)(16526019)(36756003)(956004)(44832011)(54906003)(8936002)(966005)(166002)(2616005)(110136005)(66946007)(478600001)(83380400001)(33964004)(31696002)(52116002)(6486002)(66476007)(86362001)(316002)(66556008)(5660300002)(7416002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: fep/SOMFGHUFhLyMBi1Y4uLcsOKwoGl2i0iyh6YeZptZkRiYnkJjscBtqFgTuN+CmFZ0YIGpP2P8B+mylzOhwS7J/LKZVLUtgI3gRkcxmzAQL0ChVPrKLk2ELcqjgfHsaDx+nFU9Uuh3uSuM995q3TT7RKO9mVVx7W8YY0SCSSccUPhrWE2FVkYN9RKkGt/wDJPnQW4j3N1/n1ZY4wesc+ECeoLoSB2jwmookhLeNCK1IOE1w4G/YUzX9WRP8rgTNClrRSEgvDjgn9IVTW2ID4Pn4fQtyblPnLabTF0C4ExtFzETlYA+hOFPD2crzU/2ED25U8mXPL1RSmCHQfUSmBDk8mNRQcUr4vZJiIICFaYUG5xmeJ2UR+JOYekSRSMNnUSbS+t0qk1q9544pOs6fqtVZ932R5HvWlDuc2ckth7Ghrxf/enyIWlpS7NUE4BPOoe0ZSHfxVFAZuEyd4XRKq+3/ZwBDmwe8uLbDXNPvz+yovkrWDSuatpqtkYWrsd6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c3eeb8-1b9d-40ed-881a-08d8152a1b9b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2020 14:56:27.0981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2UHs6AI/6yym/HJaQ1go0MVWPiZTr4RjUOwTEIxEpCSREUrP0MWF79EU8klk1rCzRydJW3JH5avmBdBztwkNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2445
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1606250404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1606250404==
Content-Type: multipart/alternative;
 boundary="------------B906595336E135E1729D6FB7"
Content-Language: en-US

--------------B906595336E135E1729D6FB7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


Am 2020-06-20 um 9:21 a.m. schrieb Julia Lawall:
>
> On Sat, 20 Jun 2020, Markus Elfring wrote:
>
>>> The function kobject_init_and_add alloc memory like:
>>> kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
>>> ->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
>>> ->kmalloc_slab, in err branch this memory not free. If use
>>> kmemleak, this path maybe catched.
>>> These changes are to add kobject_put in kobject_init_and_add
>>> failed branch, fix potential memleak.
>> …
>>> Changes since V2:
>>> *remove duplicate kobject_put in kfd_procfs_init.
>> Under which circumstances are going to improve this change description accordingly?
> Bernard, please update the log message as well.  The mail you sent was
> much more clear, but mail just gets lost over time.  The log message
> itself should be improved.

Hi all,

The behaviour of kobject_init_and_add is documented in the kernel
source: https://elixir.bootlin.com/linux/v5.7.2/source/lib/kobject.c#L459:

* If this function returns an error, kobject_put() must be called to
* properly clean up the memory associated with the object. This is the
* same type of error handling after a call to kobject_add() and kobject
* lifetime rules are the same here.

No need to have a complicated explanation with a call stack in the
change description. Just point to the kernel documentation.

Regards,
  Felix


>
> julia
>
>> Would you like to add the tag “Fixes” to the commit message?
>>
>> Regards,
>> Markus
> >

--------------B906595336E135E1729D6FB7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 2020-06-20 um 9:21 a.m. schrieb
      Julia Lawall:<br>
    </div>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2006201520590.2918@hadrien">
      <pre class="moz-quote-pre" wrap="">

On Sat, 20 Jun 2020, Markus Elfring wrote:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The function kobject_init_and_add alloc memory like:
kobject_init_and_add-&gt;kobject_add_varg-&gt;kobject_set_name_vargs
-&gt;kvasprintf_const-&gt;kstrdup_const-&gt;kstrdup-&gt;kmalloc_track_caller
-&gt;kmalloc_slab, in err branch this memory not free. If use
kmemleak, this path maybe catched.
These changes are to add kobject_put in kobject_init_and_add
failed branch, fix potential memleak.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">…
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Changes since V2:
*remove duplicate kobject_put in kfd_procfs_init.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Under which circumstances are going to improve this change description accordingly?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Bernard, please update the log message as well.  The mail you sent was
much more clear, but mail just gets lost over time.  The log message
itself should be improved.</pre>
    </blockquote>
    <p>Hi all,</p>
    <p>The behaviour of kobject_init_and_add is documented in the kernel
      source:
      <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v5.7.2/source/lib/kobject.c#L459">https://elixir.bootlin.com/linux/v5.7.2/source/lib/kobject.c#L459</a>:</p>
    <pre><span class="cm"> * If this function returns an error, kobject_put() must be called to</span>
<span class="cm"> * properly clean up the memory associated with the object.  This is the</span>
<span class="cm"> * same type of error handling after a call to kobject_add() and kobject</span>
<span class="cm"> * lifetime rules are the same here.</span></pre>
    <p>No need to have a complicated explanation with a call stack in
      the change description. Just point to the kernel documentation.</p>
    <p>Regards,<br>
      &nbsp; Felix<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:alpine.DEB.2.22.394.2006201520590.2918@hadrien">
      <pre class="moz-quote-pre" wrap="">

julia

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">&gt;</pre>
    </blockquote>
  </body>
</html>

--------------B906595336E135E1729D6FB7--

--===============1606250404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1606250404==--
