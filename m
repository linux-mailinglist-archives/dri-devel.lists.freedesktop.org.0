Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B9477503
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6310FE23;
	Thu, 16 Dec 2021 14:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25310FE23;
 Thu, 16 Dec 2021 14:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFeORJXy/eWjzLaoZun8qJT5wTVK2+JEk0BLNkXkE8Vrbfpv0dJYZIxXIHdstVvuev59nsMYFvRL9FaTbPdjL3FHVRs1yirggStK3I7ERO3NjLRh3qxcPKExrMcjdc6S8Kr2jSBKtUKW09f0cqxaXEypi7DHnH2Cw5oXFP98FG4NGRi3RW/tTTi81rLTUsk5EJJYc2I8RSzliLLP+7+OaTQ12xWwsSy0GEu7OECKIpmf9fmw1QbbZwaVyia7u5lfSbxD/4V2ILlgKVbSGMR6upNwmVp/f17il71rNym1RDR2/VED+LdPi5eTYAuXheGSwbT6HZGVOtm/8ESoD+YmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1Av3BgaNSBLxRrOHj/QUjKYeUFcANNWJMrAeN9uXHg=;
 b=JpELQRhYF74ozwD04E9odXZ/pTzOk1VFeLvJbLEk+0BJOIJ3BQLuHs+UCnYE7GGPtn/T3oOnSK0T3xbHHrTTtzQmz8nU1FmSVAYGe6enNIdHa2DJNPsoIA2u4gZZSw9MiqLNMhVdDMUSDco+jCPOIaJlXNa04Y9vUkXDfWWhhY+hDUNqx/8RdilwO3oqbQqNpo75Tlt9/t3SbmB3QYGBdu1LIRxYCw7tHro+ynP6/4wN2J67wrboibcnOI4+dEcjZt6BZFm+yds8gCyCJTOu3fZ4x1j/LIhPVZPe3Hef29/iqmkDlOH3nPCl8k7C1ahBC1h+Xppb1EgJ3049DqovvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1Av3BgaNSBLxRrOHj/QUjKYeUFcANNWJMrAeN9uXHg=;
 b=HyVreOuC3aBYLwScA5MYOzmeL32hOxsjGRHAdckAG7X7bv4V2Ir4i70ULrTbMIoE/7AazBXC/oEh5FcAKV3pXm1ArsJFfTtQRbtSpH+iheBCgfEWxsXMMDTxK1RcK5Ld4zyOmddsl6IHfqzgm/CjHlwt90FYRMs/4K3Rneqe+z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM8PR12MB5415.namprd12.prod.outlook.com (2603:10b6:8:25::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Thu, 16 Dec 2021 14:52:22 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::8986:7d08:2934:80f3]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::8986:7d08:2934:80f3%5]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 14:52:22 +0000
Subject: Re: [PATCH] drm/amdkfd: use max() and min() to make code cleaner
To: cgel.zte@gmail.com, Felix.Kuehling@amd.com
References: <20211215085226.444116-1-deng.changcheng@zte.com.cn>
From: philip yang <yangp@amd.com>
Message-ID: <2496fa81-e229-30eb-d5e9-5952d6471c96@amd.com>
Date: Thu, 16 Dec 2021 09:52:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211215085226.444116-1-deng.changcheng@zte.com.cn>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:610:e7::9) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af20765-c9c7-431f-14db-08d9c0a3aa57
X-MS-TrafficTypeDiagnostic: DM8PR12MB5415:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB5415738F1B946D1C2F5BED1FE6779@DM8PR12MB5415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WKGhV6Spl7nvyfDobi++rkBwFR9/qO2RDZMSKlHTLN9eN1Vo9CbI23xag9kgi64Dga0O24l4tKPFhLfZlP8v3mHu02l5cTcUjYntI4Q6m1Xa242uoyr/5e0y5pwP3YmVFrkFKdJmdkEYtAfQrf+c9B8EDia5wN0WB/mkZ8JankDxpsoxgy+WyjOdX7MEinFMslpn0R/gR2VO1x6Ek2NWOpEVFLI8+VYTVAJcA96JYbxOI7Xvk6+CHsKtDrfutHddw1P2qPjTdOB9XLWfIFeZcDx/fqBz494O2rZnkuQ8YcnjhL0YJRIFvHX7Xmf0lttdiMtKHcEvXl1mx4Hqni/+dQ1/+raB5+YIl3lFDZNd8i76G8gRpZQI9TV3jZjn+JxUCChAkBz2aKrZ7gmGkhHCEPzIjrn7BZWTlt591dEc5U/U/84hFcpNedRqY+8pcUFYBkk221f0zE/34PIr8OWfiHmAoaSnqjEkPICZV8npJW3iU3Agste8+mNXhV5p0211jBwCujlz1yUCnkUpwLJXVqDEDm5W4eTKWaVQiicrvS/mfq/HAbecj7Hb0Nym+wNRL3yLMddPr83TmD0O8M+sas2rg5uxV3SJyxWHSpAqT9snn8LBU1eknVnemaSftUetiU2GF6xsDI5JqDZeVpzr11aOHDXtej3zMUNaGWzCP7MdfDaRiDVx/SgHYbtze031NfLI+waDGFd98gyj73Biz+jsInV53pIAjKdv5Pl2ywk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(2616005)(186003)(4326008)(4001150100001)(6666004)(31696002)(38100700002)(26005)(6506007)(31686004)(508600001)(2906002)(6512007)(6486002)(8676002)(66946007)(83380400001)(53546011)(54906003)(5660300002)(8936002)(36756003)(6636002)(66476007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGptbTVMckk4ZFNhRHl5SmZyUmduOTNNOTRDZkZtNkFnWEdjbWp5SzMydzJW?=
 =?utf-8?B?NHQzWTh6d3o0dXc1VndtZlE2N0p5Z0Jxa0VMRUZHZVhIeEp1VnZDM05PR2ZN?=
 =?utf-8?B?aHRwNTZUNlNYdXdjaCt2V1d6eWVoQXVXcG12UDV1dUwrRURWNm5HYWhhc1la?=
 =?utf-8?B?dHpHaWRLS1ZhT1ppVy9lbWRQeHpMN3cxRU5VZFlhenlIb0VNcUdLa1lBYUFR?=
 =?utf-8?B?ZkFaZGM4Yk1KYnFkV0pYcGNrZlVDcGUyWFpRUkhNV041OVVCS2JrV3FyQXdr?=
 =?utf-8?B?NnpCT3dzT0luaWVHMWVGSm91aDluSHV5blRGanZUYnJIaVM3d2k3M1ptWisx?=
 =?utf-8?B?RzZPdnBpUlVzcnI1M3JKZDVxUTBsVGZqcXFWbHVtdHpDd25VcytsNE0rSlVF?=
 =?utf-8?B?VGN3M2VicExJSmlYL0s5aDVFNGFMZDZub1NHUHREZWYrcVBIdFpLeHhleGp4?=
 =?utf-8?B?M1Q0RzhUZEs5NGRBd1VTaVdQanMxN0NLNzQ2dHJLMGJibWRYUlQxTFFBcms5?=
 =?utf-8?B?d0hXVkN4dHBNcFdvSjZTQ0QxMDFUbmE0QXNKUktDUFB5WlloZXJGakFwOTFI?=
 =?utf-8?B?THpuWVNJeXFZK1UwUG02akVseXc2RUdMUVdBdUx2Q2ZpRmRWR1lMcFI3Vmhk?=
 =?utf-8?B?RWh6S0c0RUQ0aDdMSXZzQ2VnUUhKMy9QQzY2ekdmWGxaQjJPOGY3QjlySWZh?=
 =?utf-8?B?WDJONG5SWXFPSmlCcWlGRCtWVkRJTXgyMHlXWmtpR3AycFJMRm9jNU1RRDF3?=
 =?utf-8?B?b05mVkpONTJBZC9BeE5VS2JEK3J6anppVnJYZkZhQ2RKZWZoSjI3Ri9PbGxS?=
 =?utf-8?B?OW9kVjBoUDdIK2VZaE9rc0RRQUptMGdMd1lpVzhYd2NMTjBvTFUrdUlLOVNF?=
 =?utf-8?B?MHc5bU5GMXVhWkFPWjk5Yi9SWlNtZTlpQXdvUWJSNytzcWJYazlYcFltc1ZW?=
 =?utf-8?B?VmozTVRWN2hzNXdpaFZXYjBLNjF5dnhudVZjYXpuQkFGbUQ4UC9VUFl0VzVo?=
 =?utf-8?B?L2dnenNNTTM0M1BrUGd5TnVhV3Yzc3lkWW5RT1ZpVVJKcEcwTFcrZjAxQ0N0?=
 =?utf-8?B?K3dtOC9oVTFVc3FhMnVUNFA2OTNhaStQMS9USE84RVMzOUNqSXhadTZrWVh2?=
 =?utf-8?B?TDdUL0hJS1VBZXVYa2xtVzgrSHhSK0ZnYUlBWHhGdXE0T2tVeS9XYzNpTkE3?=
 =?utf-8?B?UjBJSm9FODFWNXV6VUZkYnFPZi92YmM0M0RMdGxIQ0FCd0lsVmZLeXUvM3R0?=
 =?utf-8?B?dG9lb215T050UTFUY2xlVkZlRnZOTGZFaDc0cmpzVmhtQmlycWNqbmJaVmQ3?=
 =?utf-8?B?MS9UWXFwLzNlamlmUE5jUGI3QWw4eUxGMExwR09USjV0QVB5aHpEaUc4NVpP?=
 =?utf-8?B?V1R2NTZYQWdsMUxZQW5LZEQ2cWFrOG9KYTNNMlZseEVveHVOL1BHUWp3WVhO?=
 =?utf-8?B?amtOanJzWG1SVXN4NHg4a2p6SGJ2QnZlcTgyc213dTQ4cUpGZ0NMTENGeDZs?=
 =?utf-8?B?UytpV1ZGdzdsR1RFK3hHSTc4VnFMaTc5d3lzazYwOTRkZDJvME5MVkZKRFUw?=
 =?utf-8?B?SnkyekdvYjVVNTZib1puVUsxRnRKNHFMSWV3a0lleGdnUjhlUjZVU2NrN2RK?=
 =?utf-8?B?RmhGSUlsaGpLZ1BzUDgzTWF0RUZNbEJQQlNKd1VERG9adGhJd2R3Yi9KUUZn?=
 =?utf-8?B?akFTaGplUGw0RzFKZ0RvdGRjbXpBWGZULzk4TFo5MDQ5QXpZdnRsRGFOcHZp?=
 =?utf-8?B?cGNZMkJFSFVpY3Q2Vy9UREZqMjI4RUVRZXJwR1dLL2NSS2w1NjRFdXMvMy91?=
 =?utf-8?B?aWVPUkRtUXhvc2hYK1R4ZFV0dllDaHlSV3l3enFRQXBrMGozWXdTTHZVYVl4?=
 =?utf-8?B?cURYRkdpT3QvZlk5cDBFck02UjFNRHIvRHhOMERKdlZCTUxqek03UzI3aDh6?=
 =?utf-8?B?YUJ4bk5qMjZHNTdxb1Awb2hYUURTbWtpcHV6aTJiWTZIUFNtQU56RGZ3dnJz?=
 =?utf-8?B?NnQ1dWVXdWd0dE9BWDUrdS85N0w4SUFxbTFRUytvUEttSUNmdDNPa0JVUU4x?=
 =?utf-8?B?b3BBeW9tSXVZU2g1N1RleFNPYVFwTm45OG9nM0ttTVRKT1FlTDgvMzM1UWlI?=
 =?utf-8?Q?G048=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af20765-c9c7-431f-14db-08d9c0a3aa57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 14:52:22.1702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kx7KZ4Ma2dQ/Wf1jRuM8hnFu6oobaqZIr94hErlAjxc1aGgUokQcVyfZnPSXrlOS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5415
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-15 3:52 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:cgel.zte@gmail.com">cgel.zte@gmail.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211215085226.444116-1-deng.changcheng@zte.com.cn">
      <pre class="moz-quote-pre" wrap="">From: Changcheng Deng <a class="moz-txt-link-rfc2396E" href="mailto:deng.changcheng@zte.com.cn">&lt;deng.changcheng@zte.com.cn&gt;</a>

Use max() and min() in order to make code cleaner.

Reported-by: Zeal Robot <a class="moz-txt-link-rfc2396E" href="mailto:zealci@zte.com.cn">&lt;zealci@zte.com.cn&gt;</a>
Signed-off-by: Changcheng Deng <a class="moz-txt-link-rfc2396E" href="mailto:deng.changcheng@zte.com.cn">&lt;deng.changcheng@zte.com.cn&gt;</a></pre>
    </blockquote>
    <p>Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a></p>
    <p>Applied, thanks.<br>
    </p>
    <blockquote type="cite" cite="mid:20211215085226.444116-1-deng.changcheng@zte.com.cn">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7e92dcea4ce8..c6d3555b5be6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2254,8 +2254,8 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 	start = mni-&gt;interval_tree.start;
 	last = mni-&gt;interval_tree.last;
-	start = (start &gt; range-&gt;start ? start : range-&gt;start) &gt;&gt; PAGE_SHIFT;
-	last = (last &lt; (range-&gt;end - 1) ? last : range-&gt;end - 1) &gt;&gt; PAGE_SHIFT;
+	start = max(start, range-&gt;start) &gt;&gt; PAGE_SHIFT;
+	last = min(last, range-&gt;end - 1) &gt;&gt; PAGE_SHIFT;
 	pr_debug(&quot;[0x%lx 0x%lx] range[0x%lx 0x%lx] notifier[0x%lx 0x%lx] %d\n&quot;,
 		 start, last, range-&gt;start &gt;&gt; PAGE_SHIFT,
 		 (range-&gt;end - 1) &gt;&gt; PAGE_SHIFT,
</pre>
    </blockquote>
  </body>
</html>
