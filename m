Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F38419393
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF5089FA0;
	Mon, 27 Sep 2021 11:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2789A59;
 Mon, 27 Sep 2021 11:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAQ/U5Sw3w/M9ADcJmUcv1LOW/pyiCY2ZEGgADlijAWpF8guVcR358ZUVOrE8NJKulmcdKD5EjIC6CRwlt6tEbNDYOjYJ+iW7FTplQ0tbjtuj8a3cOmyUFtHIwsqzYerV4ht9zMVIS3qllzsnYisnX0mBe60jB+OkiuqkDw2Ga0DSWvSBJJSczIv1EuJoGpOk55OuvwRxyGKLP3NXYlp8YefgiBt1EPiwa7P2r1NaOnc+eCVtcR2mDdfJbyoM7XYlB0KZ+sNH4QQKhuhJSWRl3MWnj3kJqiOZNlG3J6GK5G39Uq69Opm59m0uWuoNALVvQsAEFcWvuxiV51A94DUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=AEedBnlmQhTZkwKKSoX6vKXaC/NQE44YBgc+kM2Cqco=;
 b=jpYiAMAHOYWzgJP6bjUTwgLDyp/aq4uRSI9s3XSDLM6wl2x0mrUElFxyj/AJlGoq71Bngf52Z+had0CP884chGIpB9ehiJNk39vd5rQSrTWNKTAPe7d1ZvfGHpVYJ+Ed0yKK90hPU7VsXc5cc+UIC+HHbF92+l2+g+2dPnjrpaFneK/oxf0zsQH0Bxu9tMDXpZnZOgG9GMmAnHJPIGrkuznbXChV21hGBg0GOmS5vuIu1FDmHp7mH+U9cuqmZVeN0wn7pBPHnZuSFZMqd7CFOzxNkjkx66dlSlcECFr44hf1RYw+1Biz3BxyYATSPvxdYDB4m9qBX57U2tAm4vG6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEedBnlmQhTZkwKKSoX6vKXaC/NQE44YBgc+kM2Cqco=;
 b=au0gLMQUsRE/hGrEUumr7wchcF3Os+E8dqTy6dxhSttte25+XTPf4/0C1rupV/TeqjQbkFdNWHV/GTSwdu7ogwtalo/FuU9gfGA2HHjUzao4/+0qHc8fVzYEMluabvBCV44TK1ytRL+ie/vVXdFC1sennl8nxi/2IQxEvfoDeMk=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1344.namprd12.prod.outlook.com
 (2603:10b6:300:9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 11:47:14 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4544.021; Mon, 27 Sep
 2021 11:47:13 +0000
Subject: Re: [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in vm_access
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0ff7b4a-2433-7ff4-a998-c2c286d3c497@amd.com>
Date: Mon, 27 Sep 2021 13:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210927114114.152310-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 PR0P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.20 via Frontend Transport; Mon, 27 Sep 2021 11:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4375bab1-f77d-4254-2ed1-08d981ac8bd5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1344:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1344411CD215354D07077A4883A79@MWHPR12MB1344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7kjS4DBBrw4DMHhtgaaWTKb6aCJPYd8xP33eDbzzPa06duBy9+mj1Ccvs2+vAxr9V7h1RwbZICnhJsNTpJU+8QDDBgQE0SoAiEOIDacqBYx4B4gY3ktoIseNOp8gfVvyZdFD+vXAPbcA2NbKHgVt23E5YwU4+ZEQJgdDpHrFke0kMOomEpo4yfRMSUVu1rK/J68hK4ek8zRQ0Bio7Qh8KTMQ+Se1d7yOXrfzCIHowd+lh58k+EYXMGjzZ/H7PrCfMSF9inkrq6v/FOWEtNwQvsFUebhlQRNuQJ6/p9vSGjgqZDKrK4xDvJ6JJ8CJDyC2sixGq1XiUWuL1kwbtrL4vDKWRWz7MCJpH0b+qVQChH4TJvZ8R8/JZ0N7GlBjFCkeuRR8JsjKvKhmhCKDNjMveJKidUSxAhTDRqBc0e4sXQHe3EHqswe30tQI3xLrOwOC4tAQFs9KTkBNOGl4OqLo2XTiRehwibVCPP+Ts3gx10NgY6B4JLZ8rXOzNGWK7Xu4TSYJ5ckC1dZjofYa9rnNBClIcbwP+8On8lLO6PwD/AEVm0pbcEIShShE2TQ2BBLZfhsUoalBEHYsfzC7ThZBY+2T2dxdLFHCejytgHHnyDDaVnZUWieJMWem/L1AJk0I2pXZTDqAvS7FEzXk86nvDmlV8W/ipWbxqovkZGqvM1we/gEsw+pVXWpaqirU3VtsRGW52QCYKE88Iw7B4yNc+MXcE2yLENxaDFSEi8NRC2bn9J5w29Dke7HYwPA3etn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(16576012)(186003)(66946007)(5660300002)(316002)(4326008)(6666004)(83380400001)(508600001)(956004)(26005)(2616005)(38100700002)(66574015)(66476007)(66556008)(31696002)(8676002)(31686004)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L28yQ3BNdmpOSTV4Mm03ZnVWQlpXak40QUp2QUNXb3lLZ3l4MlFTZG50VlhL?=
 =?utf-8?B?RlNpL3hiWXI3eFo2WEtWK05ZREpSWHhGM2hkUVZaVkRaOWNETVp5Sm5Pb0Zp?=
 =?utf-8?B?K0U4MFZJYlhaYzkrNlVrMngyUUZINk9HL0tVbXY1MkxLdk1TcW9GNDdRaGpN?=
 =?utf-8?B?dXFYQzREY3ZqSlhmT3ViTGxqOFR5WVNENmpycXpVUVZXcXRjOFE1WmcwNDVk?=
 =?utf-8?B?ak1zSW0vclJzU0MzU3ZNQjMzbkFtcmhYcGhYMW9GQ1I5TWhHMDh1cGlJMEhq?=
 =?utf-8?B?MjlHT3NYZnZQZGtKcy8xRzhGazFCRDJob0lSbE1FSFY2czNnYVV2SGZWTmEx?=
 =?utf-8?B?MTg4ajU3cjJka3JFK0pRbGorbzduSzkrdW0vWGk3SHhvMjJTcy9hM3BNRmM2?=
 =?utf-8?B?L0VHUnIybVA0cHlLdXpEK3BOUjhVQVJRZU9NeXhUU1lHWmdYZUtCbW1KanJj?=
 =?utf-8?B?Ukh2anBCKzAwWk01YzRkbWxLbmlOZXdLNTRzbFBwYWRSbFJwM0hwekRiMlYz?=
 =?utf-8?B?ZXI2bFhCdEdWR2lpS2QrOEREdlAvc0FLWTRMcUNCeDU3Y2RpdGQyWHozUUdI?=
 =?utf-8?B?d09QWG5mcnBNdlp3aHJKK0NDZ01oT3JhVDlrblRBSXIrcTFHaDdYWTVYdXB1?=
 =?utf-8?B?ZmFnL2p1T3NITnd4cjZWTktnQjZhUVVqYTJqcWNpYm1ZcGZSZjFiUmsxVjZM?=
 =?utf-8?B?WFlSNDJ1eUtiSE14bXZYVThleDViQUpLdy8wVW8wdXE5YWl5WlRSUjJGMHEy?=
 =?utf-8?B?alNMVWUwRllqRDY4S1ZGbWtDVmV1d1d0WkNxNEcwbXFGYVRNNzVoRUpKU05v?=
 =?utf-8?B?SStYVWIyR3NQclRpOHhtc0lwcUlvc3J4VUxwR0ZEengxc2E2TktrbncwUFVS?=
 =?utf-8?B?KzRNSEZxNUQ2VGREbmJQcWFGdXN0eWUrd216b2toTkRkdndHOUZSN3lWdVdT?=
 =?utf-8?B?N2UzZFFJeGQyLytHL0lScFNZMWh3SEZSVUszSlJoRUFMREEzZlBxcUdMRWtm?=
 =?utf-8?B?eGthWlVDeXFJSTFJOGZSTG9JYTAyM2VQYVloQTczRHBwb3pBQ3JaNElvdkc2?=
 =?utf-8?B?Tm0xdE92cWYycTNYMld1WVdNZWFqSkFyRldpMEY5V1QyL1N6TWlCK1FHUkZX?=
 =?utf-8?B?bUNJQ0ZkUW9RaWJzTUR1bytNRVZSSXozNVJBMjJuZHo1SkQ5NTNLakU4d0Iw?=
 =?utf-8?B?UzRrWlpuQUR1RkRVS3ZIU0ZkdmE2dGF6NmlCZmhPTVZEaEVQV3BkM1hOVGE2?=
 =?utf-8?B?MTBISHk0eFphMmtKREJ0cHlFaFdZRHVRbWRncUU0dmNFTiszVkVOelE5TVd1?=
 =?utf-8?B?SGR2OSs4aTg0YS9ldXdnK0oxV3A1SEF2ZnM0dG4rSExuZHRXUjR6Z2QwY29o?=
 =?utf-8?B?ME81aFp4R1pTTWVid3FSZlJlbGpWTlYyWkJ6ajdtMjRjRkI0c2xhNm1qR0k3?=
 =?utf-8?B?by9uY1dpMDBRUEJCOTFORG1hRnlacyt6L0RRbXJvRWo0SWFYSGdZSThsTVhH?=
 =?utf-8?B?VHVXb0NGQ2tpamJpdndyMjVEb3gzK3NpMFRuKzZ4MWhzeXZkcXRtcnBjeE1n?=
 =?utf-8?B?Z1NPUnVHS0xDQTYyanE1TlFpSnB5RFo0RFhFdHNqaWVOQ1B5MW5LZDNjc05T?=
 =?utf-8?B?NjhrMmcyTDlnNjF6VCttTlNuNHc0Y2V1M2lRWDhXdDNrRU5MV1k3WjRDb1Nq?=
 =?utf-8?B?SWR6eDlMKzRCSXZPdWFOTkFOenhnYXRMMmRjcEtGSi9CM2wvVzlvUjlla012?=
 =?utf-8?Q?JgKMMo+vhRk0c8FBMGEBMiEMcsHpVOBiJIOk+Bz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4375bab1-f77d-4254-2ed1-08d981ac8bd5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 11:47:13.6565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNURQJPLG2yjPtu4OW+QHg1J3wgBMMhCU/NYP5/n47bw8Hpe41qlxggz4WN3K6Gt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1344
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Any objections that I just push patches 1-7 to drm-misc-next?

Christian.

Am 27.09.21 um 13:41 schrieb Matthew Auld:
> In commit:
>
> commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
> Author: Felix Kuehling <Felix.Kuehling@amd.com>
> Date:   Thu Jul 13 17:01:16 2017 -0400
>
>      drm/ttm: Implement vm_operations_struct.access v2
>
> we added the vm_access hook, where we also directly call tt_swapin for
> some reason. If something is swapped-out then the ttm_tt must also be
> unpopulated, and since access_kmap should also call tt_populate, if
> needed, then swapping-in will already be handled there.
>
> If anything, calling tt_swapin directly here would likely always fail
> since the tt->pages won't yet be populated, or worse since the tt->pages
> array is never actually cleared in unpopulate this might lead to a nasty
> uaf.
>
> Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..5b9b7fd01a69 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   
>   	switch (bo->resource->mem_type) {
>   	case TTM_PL_SYSTEM:
> -		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> -			ret = ttm_tt_swapin(bo->ttm);
> -			if (unlikely(ret != 0))
> -				return ret;
> -		}
>   		fallthrough;
>   	case TTM_PL_TT:
>   		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);

