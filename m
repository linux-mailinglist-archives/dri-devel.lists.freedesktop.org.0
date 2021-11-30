Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221D463C4A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E476E3E5;
	Tue, 30 Nov 2021 16:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71AE6E088;
 Tue, 30 Nov 2021 16:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE23ts+3Le9qIVxQ23ys1EYivbQjBdPCtFsIJxj1qgbOgC7/pDCK+HWwpuXVCHzKLbVpXOCqvaXwV/KS4Wl2tDAPkYXCwlqs4IAJmWcFW5oELb3Yyobo0FrgxW6sO5rWgbqSbD2mXNxyTL4egO/JVPrcTe3BxMCdA7HJUAI6NaQ0PTlp5laMZVOChJHJWKJ6XtwzrVnFpkBDeg2wcLOyETsUYMJpv7/VnKTQLm76nXoYlpqb2kh4AV0XKQIbRSjk1XmkXBYhOKJpQW9KoayWi2TBlEKGgqdjxVNy2B2Uu1CU86psJ3p55aMVyBMnQIWGze6USK24zwiWn6+AWqHL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9A9S7h78IRslHqDkjrNzhSsvbyX0BbDYdvhe+8MPXA=;
 b=Btl+IhqG7vJzHzcuvmofZ77Tfu53ZGmYEkhLYMkTdfQ+MZ6/FtLAvlA61LdsHyX2teqLXMl/KayUMWlUR7nL/3yYcLyITgwnFAE1V4VB9b+nWUWiqIXJKraAXBGTYHXPnXGynuwopphdK/9YWSd5eqO/f5xCkhKd/TRHiteADBhXhQEWsR4WKqGSNcWq3D7P8+MZxjY1maPHdta8B+nxrhXQxtsFLYj1ouIV1uHaA/w0FnKlbLDHtE1/NGPFKr2X0jJaHyv4MKYaLTMxlChIfVFHpOxJColu2+AcSVaFhXSF+YkUmyE+HTcdruACfLGERM7hsQ0DRuto9Jiv7pUtbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9A9S7h78IRslHqDkjrNzhSsvbyX0BbDYdvhe+8MPXA=;
 b=z+kWtXeCDbp6m10JH8p3s5UVxChscxtm4mUuAxosbvIn3hFWBsr4gHs0GZ0V3hVIGVsfpvzipGTydXKt+QKqgF4YSpZDNemRL3Pj4kwE0hBQgpgmGNAIIZu9PG7mycABJPIr1Dt8Mnas0dRbk0sfECQeoK9g8KwHGGuqekNy0ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 16:51:21 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::dcf7:d6ee:654f:a2cf]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::dcf7:d6ee:654f:a2cf%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:51:21 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix a wild pointer dereference in
 svm_range_add()
To: Zhou Qingyang <zhou1615@umn.edu>
References: <20211130112644.116604-1-zhou1615@umn.edu>
From: philip yang <yangp@amd.com>
Message-ID: <b78771ca-2ca2-a369-b67f-dc479eb87d90@amd.com>
Date: Tue, 30 Nov 2021 11:51:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211130112644.116604-1-zhou1615@umn.edu>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:208:32e::26) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
Received: from [172.27.226.38] (165.204.55.251) by
 BLAPR03CA0141.namprd03.prod.outlook.com (2603:10b6:208:32e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 16:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c95ed22-22d5-4494-4a3e-08d9b421a330
X-MS-TrafficTypeDiagnostic: DM4PR12MB5391:
X-Microsoft-Antispam-PRVS: <DM4PR12MB539146E4D928FB2E22D0B6C6E6679@DM4PR12MB5391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KX4DulP9sp4c/BMo4Gt7bRdNk72UiYzjC40zZo3CLz0wPwH3XWw3xnlMRduzD2ndc/Z0ctOSR2quPtp6YT5rpe39zHi2kxNcWkuHvYXbQiqRrsZX3GrRbV5rBGNdxb/6BAMNNj6yPu4pll/NZn+RKvLa+NZCM6MPeSHJG+RS+c4xa8ABUVNpfucKhDKDA2UX05AJ8K3WgcQlIKu3TipBnCwK4r+zO9qycWthL5IOsu4fzs/b03mnES5Bj8BHrPomGyVcQmvzoPM4ocJx6kjdwb0UfanlFzlorfPh8hKKujIi2cFYchC6Gu8AKDMfpfrzMxpKvIyLudtpdC04UBmGj/JKWgcUZ7UJHIx9gWAsIbv+QMT8r9L/E7o4qntw2MnG1MjKWfvDwFWPDGz+dByO6L5Fn+KkVC7VWdVSPZr4WOEkZlYbFc/k+ZSRNZ6t+s+WwnUvQLqzMKVAxZW5LGC61jggBJ6ikbtAZxMKvkRYTcTVcWV8h3rXdLcqx/jENO+2229UF0vkij65iMWHCc8RQaWmztIQm+mqbVU9UkbGkeb+CyRDPahhvjoduV0nYXypj66f4/qkpTCSkf41TEAe0+50rgBDoqIFxi6xfXjeRSgZNmgkp+kbnVbxxBbL5hlkcE1KThcMroyk3QhHkC7AKnwjb8ZPLPKG03LPvM0U8n5qWr+PB+n8vzlibPSX+Sbhj3Hx93Kqwa4jGP7MCMGde44tsHPx9ZlK4rt7bl7kF3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(6916009)(508600001)(8936002)(66946007)(5660300002)(54906003)(4001150100001)(31696002)(316002)(2906002)(8676002)(16576012)(36756003)(66556008)(6486002)(53546011)(4326008)(38100700002)(26005)(83380400001)(956004)(186003)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nlh6d1NKL3NUeGkxaXhyRkNaRC80a3JaZ2pOSFNZMjRsQllGUks3UXNhU25M?=
 =?utf-8?B?NlpmZXVnRmFMKzJORjAvMnBjRjJLa0daZnd1TWVocFdIMjhHLy9oOVVZUm1N?=
 =?utf-8?B?N3JlaGJaeDd2L2FTaFhKbkhRV3dIUHlCVm9CNEFhL3Rlem12SjdRSFJxZWlF?=
 =?utf-8?B?dFNXV29HY0ZDa2FLZFZWcFdvSm9UVmh3bkZWc0NtWUNqVTRFSkxNV3RiK3Jw?=
 =?utf-8?B?RGxDNDJiWFhXaU5EZ3QzYThjc3RxWXVqRjFEUDhxR3pBalVQaldaWXpQemF5?=
 =?utf-8?B?cGhoalBJVGVCOWRicjlLcTdlQVo1eCtTZkRFNGFJdStxbzNZOXJ0azJCb2Jw?=
 =?utf-8?B?cVNUTHlkRW9lOUthaDdXK3hDdzg1alBVZkFDZEJuVlVTekwxeVowU0FBRUZx?=
 =?utf-8?B?UDZMUDBmR0tuejNUdjF6bFU3VU5RMlJkQjBIeXRrd0hETjNEcTZ6WTFkbDZI?=
 =?utf-8?B?b2RzOHgyZzU0TU53Rk9ybWVJVlJoSnp1U0hIU0pFWFF0SDBKTW8xcFc1WFo5?=
 =?utf-8?B?QkJOd2VQZXR0QmRHUTM3VnphZ0FRT1BaWGNRb0FoOXEvRHR3ZllyZCtZS251?=
 =?utf-8?B?YzVVWnRyWW9Yd0dXQ3JqZVJiSDI3My9SYlRGWkhjZitTY0NnSndsZDdMWStn?=
 =?utf-8?B?Ty9WR00yZHZ2S2JrYXhLaUE1RTBQWkpXc0lsbVRhRUZPWHdGbTkxRkJvRkJH?=
 =?utf-8?B?cU9wSXJqTEtHMmdpNzNiOWlNdWZrdGsyblpFSURCVDlzMHhCbEF6eGR1Mmha?=
 =?utf-8?B?UjgwNVAwTC9DQXZzWDNPZE1zN2xiYU5kS2hFZDJzNWJGcE1meEQ0V29PdFI5?=
 =?utf-8?B?N1dZQy9BdUg1YzkybkpuNUcwb2UzN2dQZm9ETkFtMEFWREp4cTVwM0ZOTFdB?=
 =?utf-8?B?ZjZPcS9UM3huN0gyQzRpNVZLQTJhVkZjYU1wbDU5bUhFVzVVNW1Icm1iYjgx?=
 =?utf-8?B?NUZQWTV3Z2oxZ1lRRXBtMGtCZW5aQUgvMU4vc3YwdjhuTkY0anZadWRsUjZQ?=
 =?utf-8?B?TGg5K1lVTUV4aGdQam0wYkhRUWtnS0J3QUV6dVVkMnYyR3d0bk01aVlzM1NW?=
 =?utf-8?B?TmFoOGw2dUpnUkJJV1ZxenRJeWNQWkcxOVVHSE9BN2ZCQWtLNlB2SFhVdCt4?=
 =?utf-8?B?aitmclhxT3d6Vi85MEZmaDI1NGJCaEFUT3NLZUc1N2dxZjJQK0ludXNnWUt2?=
 =?utf-8?B?VGJwSVhuSEpaNm5xSVBkZWFYcTNtVGFMWlB0RCtlT2FWRjNHazhlUGhXQ2RC?=
 =?utf-8?B?aGhKdlVJOW5lTXlXek5hQytQWksvRjBJNyszREtQSy9wNTRwNVk5MTdkeENs?=
 =?utf-8?B?Y1g2UVJ2VkMvU000WnhmdmRCNmt6ZStVZjJQSDBkejJvQlQwS0pNSGQyUnYy?=
 =?utf-8?B?T1VCU1RCd21KTnVXQTg1ajlUdWZvSW1ZMUxqWEF4aDBLQmdSdkR4ejlGTUlB?=
 =?utf-8?B?QVAvWDIzOVNwYXppZlIrMWFCcnQyRW00b2NVMmcxQWJNNG9vWnEyL2lFamVV?=
 =?utf-8?B?TE9nSGlmL0xpeENrNzB2akk0eEZuRS9ndlNwUFh5T2UwakFyZ0dOS05zLzJk?=
 =?utf-8?B?OFdHWUd2Nm51UGRsendmNCtxZ3VGMUFuSnFWNXN4UDJIMzh1Vk9kUmt5SUx4?=
 =?utf-8?B?SlZpdnkxUWFkSlhjWmM5ZnVuYlZwdC94NTVGcTB6SDF2bVlpVXFFZkRyckVC?=
 =?utf-8?B?RUdLVTN1YVlHNVhvLzU3TUVua05RUWE3THlocVBuNW5YYVQ3ODFHTE0yMVZ6?=
 =?utf-8?B?Slo1UHVrQStCMGZuN0RZOEdMQWIxNjZOYkdMWmNPZnoyZlY3dEZQUjlnMkhh?=
 =?utf-8?B?Qld6eGFnaE9ia01NQW1hU0QzTUY5S0E3b2gwdUdPaGlqemZaL1dwUkxQQmRQ?=
 =?utf-8?B?WngvV3BGOWp4VjhQRzBaN3B5b3d6VFRKN1VXVE9BQmhDR3ZJQUxsSGZrUzZj?=
 =?utf-8?B?RnRyem1UdFlUTk92Qyt6eGJOTnh0WjdKQVJNSnBoR3hneDcxR2FGTEd3ejJO?=
 =?utf-8?B?ZGUvWWJIZ0VxaWlpR2hkVEtaTWFtd2NEM1diSmlNb2l3a0w2Z3RTelBzOUpa?=
 =?utf-8?B?ejU0SWl3cEtGMEpiRjN2aEZLUnpVMnM2dmVmVVVwenZDTEJlUGhCektIYXhO?=
 =?utf-8?Q?P5Dw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c95ed22-22d5-4494-4a3e-08d9b421a330
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:51:21.6926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv/3DJjOBeWrtuwELQyN4Ekn3d2UfW9b3hB00Lym6WLgIcAd6B9EbvYw1SJe5jp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-11-30 6:26 a.m., Zhou Qingyang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211130112644.116604-1-zhou1615@umn.edu">
      <pre class="moz-quote-pre" wrap="">In svm_range_add(), the return value of svm_range_new() is assigned
to prange and &amp;prange-&gt;insert_list is used in list_add(). There is a
a dereference of &amp;prange-&gt;insert_list in list_add(), which could lead
to a wild pointer dereference on failure of vm_range_new() if
CONFIG_DEBUG_LIST is unset in .config file.

Fix this bug by adding a check of prange.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_AMDGPU=m, CONFIG_HSA_AMD=y, and
CONFIG_HSA_AMD_SVM=y show no new warnings, and our static analyzer no
longer warns about this code.

Fixes: 42de677f7999 (&quot;drm/amdkfd: register svm range&quot;)
Signed-off-by: Zhou Qingyang <a class="moz-txt-link-rfc2396E" href="mailto:zhou1615@umn.edu">&lt;zhou1615@umn.edu&gt;</a></pre>
    </blockquote>
    Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20211130112644.116604-1-zhou1615@umn.edu">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 58b89b53ebe6..e40c2211901d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2940,6 +2940,9 @@ svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
 
 	if (left) {
 		prange = svm_range_new(svms, last - left + 1, last);
+		if (!prange)
+			return -ENOMEM;
+
 		list_add(&amp;prange-&gt;insert_list, insert_list);
 		list_add(&amp;prange-&gt;update_list, update_list);
 	}
</pre>
    </blockquote>
  </body>
</html>
