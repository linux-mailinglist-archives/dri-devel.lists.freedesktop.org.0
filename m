Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035426C23F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 13:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DB56E9AD;
	Wed, 16 Sep 2020 11:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D607E6E9AD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 11:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/+FjNZiQJM0rlNJddUkQla7ZnsCWho2KNtHLhQdjll940d23sdAmzK3bbj1YqQ2UKMMWAZBtzVuiiPuKw5oPdpK4OeQq75pnn+YPmRE4I1Hl2UJGGmkCWh5S04g6gXiiLs1j/pg70iDZGpz+g0bjLFW/N4PBJMOKMl0ckOE8rNPfr9RGDyjmGPIcPe5NxxoKEN83ykZ6Lx9ZxldfvqnXL1Xxwobs5FLsfwpBGQxFHXKz+PDgjM/Z+iA3VkWGJ+1PolXV6qTD5HQM0P4x8NqFfy7uCh94FcnlARcTqym0WtZgUSgqBhU/iOrgt/aoyeIBgmRMZGBtOj7R348+ucg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD2z0U9zhqGGl+pqb8FU/UwSN/HGGEoGlL4m2hFoaHc=;
 b=UILw2P//v6+35FFx3nt0Sjev0Vjjqc16h3yFnvMKZhbj70cAiYH8gn+F2htxUMmU29n2eJt8AI5QBdBkQALudRDCWlMFMBrkNnj7hJi/uDVrvlRlA0djNbkOqLnlgJRQIvvqDH4VUnWJX/g1q1ZF/n7jdi214FrlswVx7FsT8YyEC+3539HfCxgXwtpq1C9QNF1cp9eVKpjElRNarS2qfMN66skcz+PKPW8X/dqaKT5aS2qNsD/JyqwHEvwD2xHW5uxsHXk7P3/WjQflo7WD7W3hW+IQBmYMvqV+3Sc0GlI8/0hHVVyP68YRZEc+RIvcyaqz53n2TtMuJdQ+daiYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD2z0U9zhqGGl+pqb8FU/UwSN/HGGEoGlL4m2hFoaHc=;
 b=DBlJjy6GVYiLjfklY7wT+N5m9VPABwM958fc/dxwK3c3Q8xEukWCrioLa2rqv2iKEkoxiSBHgzosicLUEHRAUWmJQk0hJkUMaD2H3L9hAhWN8fCQ7K5f5g2n2RjknN6TI9cPT+SGsnSQJe3l1sbJwV2Q/XQy+jtqEL2zwN6t3K4=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 11:45:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 11:45:48 +0000
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
 <fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com>
Message-ID: <b621db68-30b9-cc3f-c2c0-237a7fe4db09@amd.com>
Date: Wed, 16 Sep 2020 13:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.8 via Frontend Transport; Wed, 16 Sep 2020 11:45:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1e0fbf2-9772-4108-496f-08d85a360ddf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551CF0E841B7EF50CD8122783210@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tbWN+MhlQR6WeOX88/hSS2tHGQcFcCX5jB3CloJdSP+fAEQAB2L+tY02m2R9LbaFYoL+o7wFh79GCw9/Bo+JXX+N89puPrr32C8oAKX7gBlTAUbLEEdZwr4lK4XQruotDFBRyZrUywVkn7zx0m+/YEFOCNWriDubBLuabOsu+0DVbVKMa8uSb7GeyVc8QuRzYsqH4Z2/TVWjVZv1J70AdW7E8lbih4OFotqjkpRVLJE1JqFz+iAZnOac3XLIGzKh3ZgJi4QxKyiKdMvgZTqzhhaG8RJwIRTyCp8B4Ci8Q6IpIVlaQ3+7p29Ydh6Xg7hbb+bnUCKXWlT9g5c/hY4BQnTq6aMkMVBK45W3wfnUHMykP7lXAp1xvbA0nvj0ZrtqMDDCe0ICAoFoSvStyYzUzTNL9Lz+QiYlbvLsFDzJAZEKujtN5bDqkqhE40CW3BaiHIDLmVhxleKvT/9Bmjmdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(36756003)(166002)(16526019)(5660300002)(83380400001)(86362001)(6486002)(2906002)(31686004)(31696002)(8676002)(8936002)(2616005)(6666004)(316002)(66946007)(186003)(478600001)(66556008)(52116002)(33964004)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: U8FWlzKBBH75Xxb1FdkIBYMG3dRVSYtG5OKvpJYaNcdy0YUDUTSl0+/jo7NA00BBrVPQxqAn/jckFoXWjeF3xFWZlFVlI8DF339kCJYQHmcFrcyBZbvw/l6Z3qWbC/sSE4EAkUemoJZVqYVx1vAJm0ZwZfJdjQWmMt+LYGkXLNIO529YrxMiUhkNR151vhtInfLsd1Wkg04ZPoVackWSukG0QVlONDvqNY/D8kerfWjq4zlX+nQIig6O3hyTmgqJiIfuyZy2OCrgcGBh7tfbZ2fxfdlppA7H2DSsDEPcVyuOeC/9HqebaODXTcw9C+6H1DU7TR5SR7plaKeFxXLTg8Ck0lxn+59qEISziQT3qz9/L1dqUCe08szYxpIiZqRUOoHDqRUszfXRTG7YeQf44vlyac+OkHPYF6qlHo1bxcqZRH/isVF7msQ8rBI6cj2sMH5pom9djFJt0SBdVGoON759wK+9wSetOL6MFHMawwVZBSW7WVdW6toAst1Q3yzLf2SwrJ+CRQjXkX730eGOl6mQTJrvf8AREuH6Y+dJMBV6xGHEC8P9kyAJS9apJpCahD0u++90WxR9leNw3HKr8wTWwYrfj7s06Ua5h3EhdH8qdkTWklCKSgRrS29bx0KQD61NOHuKAcki13mtSJrmYzD8fFMMPmDkeRCUiZYXNiwc6+R5kTzufUlOzVpQpPkryWA86GQ7Dkc5pN3o/5Vd3A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e0fbf2-9772-4108-496f-08d85a360ddf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 11:45:48.3524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JVrwkz5BEPRRzhr+9PnAQYfBj5erpLpbHUhxwv8vlGlpszUEMRXOT+uQn4/bZCw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Content-Type: multipart/mixed; boundary="===============0253835805=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0253835805==
Content-Type: multipart/alternative;
 boundary="------------2482CD56258F6ED3C81B0494"
Content-Language: en-US

--------------2482CD56258F6ED3C81B0494
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

[SNIP]
> But Jason pointed me to the right piece of code. See this comment in 
> in mmap_region():
>
>> 		/* ->mmap() can change vma->vm_file, but must guarantee that
>> * vma_link() below can deny write-access if VM_DENYWRITE is set
>> * and map writably if VM_SHARED is set. This usually means the
>> * new file must not have been exposed to user-space, yet.
>> */
>> 		vma <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma>->vm_file 
>> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vm_file>  =  get_file 
>> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/get_file>(file 
>> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file>);
>> 		error  =  call_mmap 
>> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/call_mmap>(file 
>> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file>,  vma <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma>);
>
> So changing vma->vm_file is allowed at least under certain circumstances.
>
> Only the "file must not have been exposed to user-space, yet" part 
> still needs double checking. Currently working on that.

Ok, I think we can guarantee for all DMA-bufs what is required here.

While searching the code I've found that at least vgem_prime_mmap() and 
i915_gem_dmabuf_mmap() are doing the same thing of modifying vma->vm_file.

So I'm leaning towards that this works as expected and we should just 
document this properly.

Daniel and Jason what do you think?

Christian.

--------------2482CD56258F6ED3C81B0494
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    [SNIP]<br>
    <blockquote type="cite" cite="mid:fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com"> But Jason
      pointed me to the right piece of code. See this comment in in
      mmap_region():<br>
      <br>
      <blockquote type="cite">
        <pre>		<span class="cm">/* -&gt;mmap() can change vma-&gt;vm_file, but must guarantee that</span>
<span class="cm">		 * vma_link() below can deny write-access if VM_DENYWRITE is set</span>
<span class="cm">		 * and map writably if VM_SHARED is set. This usually means the</span>
<span class="cm">		 * new file must not have been exposed to user-space, yet.</span>
<span class="cm">		 */</span>
		<span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma" moz-do-not-send="true">vma</a></span><span class="o">-&gt;</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vm_file" moz-do-not-send="true">vm_file</a></span> <span class="o">=</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/get_file" moz-do-not-send="true">get_file</a></span><span class="p">(</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file" moz-do-not-send="true">file</a></span><span class="p">);</span>
		<span class="n">error</span> <span class="o">=</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/call_mmap" moz-do-not-send="true">call_mmap</a></span><span class="p">(</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file" moz-do-not-send="true">file</a></span><span class="p">,</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma" moz-do-not-send="true">vma</a></span><span class="p">);</span></pre>
      </blockquote>
      <br>
      So changing vma-&gt;vm_file is allowed at least under certain
      circumstances.<br>
      <br>
      Only the &quot;file must not have been exposed to user-space, yet&quot; part
      still needs double checking. Currently working on that.<br>
    </blockquote>
    <br>
    Ok, I think we can guarantee for all DMA-bufs what is required here.<br>
    <br>
    While searching the code I've found that at least vgem_prime_mmap()
    and i915_gem_dmabuf_mmap() are doing the same thing of modifying
    vma-&gt;vm_file.<br>
    <br>
    So I'm leaning towards that this works as expected and we should
    just document this properly.<br>
    <br>
    Daniel and Jason what do you think?<br>
    <br>
    Christian.<br>
  </body>
</html>

--------------2482CD56258F6ED3C81B0494--

--===============0253835805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0253835805==--
