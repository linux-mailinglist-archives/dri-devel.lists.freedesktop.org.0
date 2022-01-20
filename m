Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878C495BC2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4810E8DD;
	Fri, 21 Jan 2022 08:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF4E10E7ED;
 Thu, 20 Jan 2022 12:36:51 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K9uxx2031403; 
 Thu, 20 Jan 2022 12:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qS2ZuqrIb1gCdsCxxErCmNwEweJtQ3i9bADUJ9wSBxw=;
 b=e1WLOn3xGuQzVmT0VWQ6zZYGvqDsh4g+WY/B70L4whQ1BheO9cGJJzEpJEOnV2Pk6Wn/
 Xr3QTeoYjXYPRYsCDMA1h7BLD2nQqKtN1VQe6KGZkxm/Q4zMdFpOga3jesri9yD5zIbQ
 dsQwEFpGZzu8CV/JEy8Q5+H9U1YmmgD+pkzxqwXJXej8xu5IcgZBF8Ku2Hk/jXYc0FvD
 mfdrn9YJRSH9CJvrK1Dk9XHD76a0avzqzrPmK7s/cW6bHd7mkTNO7BwJ0mbFHAogV6zv
 8oPffCq14KyEDg+b18dGI8pqUNKIXVjgnaowKT5JNepd6JL3VHia6JLXxfUhJjIQ1OV3 EQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnbrnyxhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 12:36:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KCGwjd071856;
 Thu, 20 Jan 2022 12:36:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by aserp3030.oracle.com with ESMTP id 3dpvj21p1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 12:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4oym21EO/lr4uuSr4oJco0owBV70S5zIFFje/pUFWCiAXQfs1tQFhKbbM4o5yMnWO4XbNC8hakBqtaYjrpDpg8+HXs0/COL2NdSZWIzqWHxEjtshQIPJVkrlF2PGy/pY967bvr+O1tKScKjmG9ScmMpq9zIjLMnZrGIIV/WBz28KWU10CvelRMZt2Ct44y2+E0ExSU5ysIzESREeK8IhByTqo75I10lG5bhHKfYGzkAQ3/fQ98zig1DFTEC4+NdqQounkTr/FIk0mPIt6MktUHqupMy+1nTNWa/Rrv0rrby4zvtoWjgMhLMKM3Q8n84uaMchEbY5nkbcRnKr/JZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS2ZuqrIb1gCdsCxxErCmNwEweJtQ3i9bADUJ9wSBxw=;
 b=UFyFUy6ZJXslkRIRuNXtjdXeMhBS33m7d824thwEMSI3JmKMb7nO3JC3ZHS9MV4bqVkpXkUcKs+CJKIGP5TfLkpKDoMrCCSkVUMqVBVK78YMAY0pWI2gLLS3AzEMxrENMRll0HUQ1wR2ghnG7UE6F59L8+RJpXSJlpuoDdQMaB1ei+cveMU9MeAbtdT33jrS/cpfllZmvG/RhewrvzNKf9XqPqoialhBOtblol5Tylh+5LlQ9IhBESunS1w8gPP6ahM8G8/rvJ/du1iQE+YFN2uXVo+mqbtRt6Z5zK4CbJWk3Hu51rCh7MDqryTbVExXAhIYrLOKbL4w8bqx3beKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qS2ZuqrIb1gCdsCxxErCmNwEweJtQ3i9bADUJ9wSBxw=;
 b=Vl4wRDKh3iyW1HiCuNqYrkXoM84s8L5j45VMjbwCQqpEq1qdqEepGxRc0NMZgpC4mRbnbHPM6jH2CQalKwV34zoNytFCzUtEM8/pYJPWR/MnBPURRsmKLj8v4UfE1z6vuIBjsmZcbPOccuaV40+jmGrAXWroQ3tnGTepq6b2Su4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB2875.namprd10.prod.outlook.com (2603:10b6:5:69::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 12:36:29 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 12:36:29 +0000
Message-ID: <008b5ff4-dd53-d652-46dd-5ce771c69a0a@oracle.com>
Date: Thu, 20 Jan 2022 12:36:21 +0000
Subject: Re: [PATCH v3 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Content-Language: en-US
To: Alex Sierra <alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-4-alex.sierra@amd.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220110223201.31024-4-alex.sierra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79a1f61-50d7-465f-a7e2-08d9dc117b30
X-MS-TrafficTypeDiagnostic: DM6PR10MB2875:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2875847E8BEDB79435D56814BB5A9@DM6PR10MB2875.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4v58aLDJuoR6vrivGJXMWo+5UmQv1oDARLMy2LwZ/6R8e1dmqIrB57dUNJuZk5ee57DGJmMw8YHAlwkbsD4kZ1YykSQnnBqD3jzIc79Ff1kb6t/pua2bE6dsui52CuyVixjBFKjkxIHnNXSpzI49vlWS1Uh24QrpzVNlnTdn6T/0ZYeqH/MoMAz+MsVKRmvv6vu4QPv5v25G2DiJlOMFwP8/EQ0chGtF6LiNAzTghtsAjgvBi24peaxY3MbaiWJwbNF5BlfZ4pGJsEjuBqAFxRTDUn9ch2XP6Qgcf6h9GEh/7R6cLKdVhl1uYDYYqaxJ8p/JM+Uf1VVpvK3osBvM50jBDbNgQcX6Fdjqb5jjCzZQsInl5Rjevt/dU6R0kjJkQfgBQzcVZTE22Ouo8ZC7io730VVWljEws/E4c0xOcu0q0MJgQB19JUY6bcwB/oO1VYSDt/aac/LpA2fbCf6IgZBTUW7Sv0t0Id7sotay9pX1Hamy6PPRDXujmgQ1Vnebf4nekkJ/q8KFjkW2mEpePS4mcUQL2NRyYb6ge4eyPJeTsS9H4kyhf+OIh854VT6yiGL/aVBqtmUxnwUwvvHQ8TgTCsVPAnkEP1JpRijYKo4AjIE4BU9xzbZnalBub8Ce2fPFwidJ+Z4T2k/X7UazGKrCjOwxDOmkdBeBTX7cuJzX5AEo6VYFJloHh1S2yiWUNptAuoUbpLapnQLMHkfANtpdWw/Ek7Ek3E/cPUasGXbnnKhw6k7Nn2ggqM5wV8/NCfBEuqswPVHl/NV/Z/evBECqVXVIrLQ+OaDvrFs0IjDArkprdgZBxWerGu0xRO1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(7416002)(31696002)(2906002)(508600001)(2616005)(6486002)(26005)(5660300002)(66556008)(8936002)(38100700002)(6506007)(8676002)(316002)(6666004)(6512007)(83380400001)(6916009)(31686004)(86362001)(66476007)(36756003)(66946007)(53546011)(186003)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0E3aC9mZ2l5WUE5TnNBTkQ5VHFFc1E2VEgwdHp4YTlyRFJRa2IrUGdFYkFQ?=
 =?utf-8?B?RnhLaTkvQjljRFVrelcwU0cyeUc3UVJlUnlPZmxZWXpHc09XQUZyZElGWWpa?=
 =?utf-8?B?alNjbEZCaXRpamFJMll1WmhKUURDc1krb09DMWpGMlFZN280RjdvTXVpODVX?=
 =?utf-8?B?VVI5dTlRSEtWSmdKTlA3bnJLYWxyRi9XWXZVRTVWbjNtS3Vvbm9ub3dLeXdl?=
 =?utf-8?B?bk1xTWc5aStQamJ4NnNQOEhtQkRmZUVIa2ExY0xZZFBsU0lVUGVLOFRITWdv?=
 =?utf-8?B?YVgwRGxqNUtwVDNjQ1ZlR0pZM2VKMVFOR0k0YmRJekxFMEdUcnA1c3NtdVRq?=
 =?utf-8?B?c2RJTFhwdE9UaERweTBlK2pjVVovcCtCVUtaNUtGZUJtRjBoc0thdEVSQVZU?=
 =?utf-8?B?MnlPVGl0bThlZkVLdEVEcVJlUGpwSVJ4V2dWRTZCNDkxSjF6K21GZTJiZFdB?=
 =?utf-8?B?R2kzTVpjaUZ6bDBPTWtMNGptZXJMZTZJL3VNRW9QcVpkVG1FdHNaRzhabFZs?=
 =?utf-8?B?ako1Y2hVWmxvUHpzZUdkMTdmVjY1L1RWTmp3OXp4K3JTMGFEMmFHVW10K01G?=
 =?utf-8?B?MjlVQkRqM25VS3ZXMmoxV2k1NXdqbUJuS0RmbDYzNVZSZjE3Rm1YVjdhbm9I?=
 =?utf-8?B?azZiQVkxUjZjdlBWaGRlcjAvRVhaalJnOTVLa3liTjYrSUE3ZnQ1eEFNeS85?=
 =?utf-8?B?OGFKSHkvQXN6YVE1djJ3NzVtakV3Qm1YWXN3bzNuTkREVmk3UkF6cGVkUENV?=
 =?utf-8?B?ZGlDZjNTVnM0dTVQaGhidzJ1Z1Yzb2E4UFUxSnFyT2pDNzJrajNTWCtBWkVh?=
 =?utf-8?B?VzlZOEV4WXhCMjVqNit5dThPOUxYUUFad1F6UVcxVnMvT2FFRUFzbjR4UHU4?=
 =?utf-8?B?bzhjY0E2SHgza2JzTnVxVzVpZ0pycUlXdVJpR1VSM1plV1FCanJOWm9NRlla?=
 =?utf-8?B?VDk2QkFBYzZiVWZLaGw3d1VqWHl2UCtweU5UcnkrQ3ZSTmNMcmJ1RkJPNjFW?=
 =?utf-8?B?OFY1NlVMc1g3Y1l5ZFRwL0ZjbWljak1CL1QvWWRuZXJmekJ4SWJQQnVRZzRH?=
 =?utf-8?B?VkovUlRCNGFUZkdkM3NFNzBIRHZhU3oyWElZYnd1RmJMaG52azNEV2o0cTNl?=
 =?utf-8?B?d3cxZTZObU5LSEVEeldiWjJZVWpkUzNLL1diV1d1cHVBM29xWm5VMWhHZnJl?=
 =?utf-8?B?bkRaYmNYbXl5L0lONVY0Q2tNUGRWaXZyQ0FYMnBMd1RhME1aSUU5SG9YTGV0?=
 =?utf-8?B?Y2h5OUl5a0hLZlJweUxhSEFCbnBBWEo1ZGc0ZlBHUTFCdE5kbU1PbWJPdmp2?=
 =?utf-8?B?TjRoeXhyZFpMMlNiMGJLckZ3NzNHclBSSlM5bndHZzM4MVM1ZkVua2IrYUE4?=
 =?utf-8?B?VXNMMjlXTzJuT1dsREV0aG1odGVIQ3JSdXI1L213clNaYitMSHdZYnpzVmlV?=
 =?utf-8?B?NUtGcDAvTGFwNXd5SVNkdm1HSDJ4R01HcktEMUVIcStON042TDN5OUU1RlVU?=
 =?utf-8?B?dkNkeEs5S0JoRzk1WVQzOGJYOFRiVHhtU1hseXFwSUhDN1daM21MWmJpYmtD?=
 =?utf-8?B?dzZuNUNiQkNjc2pLWS92RHFuU0t3clR5SHlPWFkvMWVZSFEzUDlvTWtWSXBE?=
 =?utf-8?B?U09oNDdlUTliL1hTamZHWnF5ZnhBYnJxVHJoMFZOMzhVK256ZW9KaXQ3SGZv?=
 =?utf-8?B?cHI4cTd6ejJCMlJEeUNoYURNVEFPaGRFWUEwVUR1NkpXSjB5SUc0ZHovT2hN?=
 =?utf-8?B?OEVPYW5naVNjeHI5VktldG5XSGZxblBKdVBPay9ab2g0ejVBZ0NqQnNxRkZw?=
 =?utf-8?B?ekVUNlhueGcrWUswSTQxQ1R3YlhKb1R2VVVTb2dpRXR2ck9tRzB6ZXBISVhr?=
 =?utf-8?B?RS9HdlVnRDdyRWdvTVVUdmJyS2gwWEZxRUJpekFWbm9ZOWdvcE5lY2QrYXBJ?=
 =?utf-8?B?ZVNlVmFLSnA2YjZsallMY3BtanFZbVpGOUdObWZaRlBWQ2ZXdWxNRkVEWDZz?=
 =?utf-8?B?amxDT2FwTEZOQ1RjcS9xcFBNMWplSmxLcGQ5eTNqcVpwTGZBbzRNcEQrZ1Mx?=
 =?utf-8?B?RGhqQ0hrRzdGa2NGVFJGcmc1SXF4bTZpTkJhY3UrN0V0QWVyV3Z5a1Rla09Q?=
 =?utf-8?B?K3Q4VlhEc2hjRTdLdnFMSlZYNFFEcXhRemQ3aEVlZER0Mmp0RktVanMzWThM?=
 =?utf-8?B?eFppZ2RvV05wK09ad2FkbEFla0NYeDdoU1ZSdjdPV2FQVDd0YWdtWUROTk1B?=
 =?utf-8?B?YlMrOVplemc5NVNMNTRoVWV6cjh3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79a1f61-50d7-465f-a7e2-08d9dc117b30
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 12:36:29.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqQK43xXyUQX8Iqs3ZJsRNZg10A+DVOksBzE/gAdWtuxm/ZhMaZGHJngWzMWEfUcavY+STLchI3fqQoDheOC7kisFHEyKiXhtzDmE4QV4WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2875
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200064
X-Proofpoint-GUID: tHeIP4Q7TKRV0_2V9Kuc-G2WaLkrPUbF
X-Proofpoint-ORIG-GUID: tHeIP4Q7TKRV0_2V9Kuc-G2WaLkrPUbF
X-Mailman-Approved-At: Fri, 21 Jan 2022 08:20:39 +0000
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, willy@infradead.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/22 22:31, Alex Sierra wrote:
> Avoid long term pinning for Coherent device type pages. This could
> interfere with their own device memory manager. For now, we are just
> returning error for PIN_LONGTERM Coherent device type pages. Eventually,
> these type of pages will get migrated to system memory, once the device
> migration pages support is added.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  mm/gup.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 886d6148d3d0..9c8a075d862d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1720,6 +1720,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  		 * If we get a movable page, since we are going to be pinning
>  		 * these entries, try to move them out if possible.
>  		 */
> +		if (is_device_page(head)) {
> +			WARN_ON_ONCE(is_device_private_page(head));
> +			ret = -EFAULT;
> +			goto unpin_pages;
> +		}
> +

Wouldn't be more efficient for you failing earlier instead of after all the pages are pinned?

Filesystem DAX suffers from a somewhat similar issue[0] -- albeit it's more related to
blocking FOLL_LONGTERM in gup-fast while gup-slow can still do it. Coherent devmap appears
to want to block it in all gup.

On another thread Jason was suggesting about having different pgmap::flags to capture
these special cases[1] instead of selecting what different pgmap types can do in various
different places.

[0] https://lore.kernel.org/linux-mm/6a18179e-65f7-367d-89a9-d5162f10fef0@oracle.com/
[1] https://lore.kernel.org/linux-mm/20211019160136.GH3686969@ziepe.ca/
