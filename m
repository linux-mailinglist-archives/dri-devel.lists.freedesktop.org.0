Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UACkM6gtd2kvdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:02:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712785B63
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A5110E3E4;
	Mon, 26 Jan 2026 09:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uQpfVklG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41210E3E4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 09:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSO/E+DBs/G7FTpGvPeP8n7UldvO3VSgA7anvk7M2w5wdBt4hGkAU+UrxlsrfGEI4b/KFGzPBbnR2FfSV6TP2SrDefvugrPDFoYpX5ZQGRuiIsOInPd5F2PEovW3CG4qzaf0lJrSFtKKf2tEYvjRT+8Gf5VezVD8ZdJUC81Nqxk7jYNhSr1buePmdUZBNJwj4SOOJszqpLt70tfG6kyDXa2hggtS4Y1YRUtgn+tJ5lG/1Ic975jMhCbbQhwu9leuaNIYbuDO2+H7afKdtsnUft71gPwHTZ6/e/qNUGCSX5NJuKxq0IBDMohnpdIxeQRJvGjPXsVRQ4DO+KZXDnKoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mABQA8CNF9MrpsfzK3oB+TdjVXOHwqd/2Rk0e6z+xgA=;
 b=CbEFidw1nBEqOcfF92QHrqGgFInE2dHzRfdU3I8Z3hm97XdDpOqIIcHKLTLZDS1bK8Xwf0WHVnYh9JSWEn8iEcciDUzqzTVrkTB5LN/DOMqn6ZGFFfcHAIIjeu6In5JAnkrmCB1SYbD/62JBQfz3ubw0E4KvPejJ+95ODXy4E3WDT2MYt8w9ggAxVKX0Y7OwXRbA705VsEh3TFDpPxX99WHceoxnj7IK+weJgkz7E6b1uksf1gwKiYffSGsA5ZUC0Pw7Lx5dsXd+fVvcdDpLWy1N/IY0uVJS04Kr5B6VcJ+cyVq/l9GTU8L2IYhnuh/ZLO1Kx0UNecmV9LKIrL3YDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mABQA8CNF9MrpsfzK3oB+TdjVXOHwqd/2Rk0e6z+xgA=;
 b=uQpfVklGGvVzLmrcHI3YpJlDq/5SCXnRbWRL5WMfTZi/F1rhDXmDE+lucVJkU9WEmpLobYHRJTPu75j7JW5VdgreD+VqFgqirpnZHUVKLwWG3MP9/49wPaqNU1y9Dpyeig4FW8phE/Kckngt5I7fDCVkiI+baeu2Yl3Bbu2r1fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 09:02:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 09:02:25 +0000
Message-ID: <9e5f8140-d197-46f2-8324-bd705a889ecf@amd.com>
Date: Mon, 26 Jan 2026 10:02:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Do not allow userspace to trigger kernel warnings
 in drm_gem_change_handle_ioctl()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Zhi Wang <wangzhi@stu.xidian.edu.cn>,
 David Francis <David.Francis@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, stable@vger.kernel.org
References: <9bde8c39-ba4c-49c5-a0bc-4e78338f055a@amd.com>
 <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260123141540.76540-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9f252b-1bd1-43c3-12eb-08de5cb99fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHQxTHZ0UFJwVHJxakx3aXMzb05tRVFoOG9pdXZZSTZxcTVBWWhqRXVwSm41?=
 =?utf-8?B?aTdHbFBvQjcvZStGcjNJYktHK1dJZ3ExZ1BBVkRzeWduSU5pa0lqYTUvZ3Fq?=
 =?utf-8?B?QUM4WUo0aHBaWmNrZWgrOEcyV2pEbTlFWFZWU2kwQ05NTWFVNVNEQS92aXNo?=
 =?utf-8?B?NHlRdFI5M3QyY1B3MXlzcjd3UndrYWRKeFVRUXllOXdWSitrdVUwZS9CWTFD?=
 =?utf-8?B?NXNmTGFYWGJaVUIwWkhZNkdCNFFDeSs4NkszTnVLR0Job1I2aDBoNGdUdTEx?=
 =?utf-8?B?ak4vdXFBMWw2YWtIZytyazVxWFREMmRZUzUzWlFENzBNMXpRTWFEN3hkLzJY?=
 =?utf-8?B?UEgzaGsxVXdSUklHRy8wMDlqVEIySXh0V1JyejB4NVMrdDhvczdGYUlvSENx?=
 =?utf-8?B?WSs3VUtvT05uQno5MmFkUUhWYmZRZ1Q5ck8xVDNSNS9JNDcvU3hlM1gzVFk1?=
 =?utf-8?B?dEtUS2ZXVCtqbXZFYm83QTVkMVg4dVpBbDVBZmk0Z2VLdmd1dVJMZ2ZPdVgy?=
 =?utf-8?B?TUpKYmZjdXNOSWN0WEZ4VmZNQVovbEV4ckIrOVo1UmxuUkxHcGQ3TFNROFF1?=
 =?utf-8?B?clYycmpOS29mSUhEWjlaS3ZhR09sS0xBTjJraXF5SzZhTGVYbWgwUGlyazRW?=
 =?utf-8?B?eTh5RWl4OWpQZnpTNThzZUlIQUdGaFJJYldzczNURGF4NTQ3SmNXczlmdmVZ?=
 =?utf-8?B?RHI3N2tYQ0x0R2tiRVBlTVVXZm1HSnVKRVV0R2I3M083L0hWUWszVDlmaFJL?=
 =?utf-8?B?YlE2Q1VNZmwvNm43M3VWemtEWnJYYXNPSHpsQ0FGdkhLVUR5Z1ZmL2NwTHFh?=
 =?utf-8?B?TVIrMHBGb2dabHR3d0JsYURyQlZ3OUx3UzFjSk1FT05iREJPaE1UWEhMS1lE?=
 =?utf-8?B?UTZDRUR2UjJYQ0tZa2laVm51anhpeHJhcVBzd1ZoMEk4MUtybk9NbXowemE1?=
 =?utf-8?B?VXFLYTlOZjQ4UWJuNll2M0c5U3hGeXlhK0ZZaG9rODlsZEZjcnpYLzZuRG5S?=
 =?utf-8?B?MWRuVzlaUDlUVzExeUgwN0dBemkwL0RUUGNtbVplRjBWM3RERkhvdWVhNFRh?=
 =?utf-8?B?bmlJWGYxZDNZbC9kOGYyOVNqdWMyUnU3cmQwbkxzSVVHTDFqbS9rOWpUb0F3?=
 =?utf-8?B?NGRQaGZTUDhKbjBPTnRMdTh6M2pML2hIaEh1NzYzR0ZYdjgxcnFTWFdQbHBi?=
 =?utf-8?B?TGVnbFNpTkRxWi8wQXRoNXhpN2o5MkpyWWZKcDg0cFBlSU8vcndCankzR2gw?=
 =?utf-8?B?b2N0VE1FNHk4Z211NXZpVjZib2JjbFhMRmk4MEdGT2pmRUFwcXlsYTZxRTlx?=
 =?utf-8?B?ZHVvS0NKSk96ZFJML1BOVDNwUUhtQzNhYXg5NVQ2ZFUzNWthOWFCekNNSzZk?=
 =?utf-8?B?YlBObnpuTE8wakZnOXIwOUE0Yjc1a0VDbDRzejBoTERQTFRIUVd5SkRZdkZG?=
 =?utf-8?B?dTc2cE03d3Jpc3hrTlJXanlrQWFsaFNWZzlyRENLaDNNeldFZFhlcXgvWnJh?=
 =?utf-8?B?T2E3b2VxOFhVbkp2aEJBVjdiRXhLMHdPL2o3dVBZcXFNalJsTS9OUFJJTXVK?=
 =?utf-8?B?d0I5TjFESE04ajBLQ213WjhDWXRrSW55S0VQRUJmUXhZRUtMU2JKRkZ6ZjRW?=
 =?utf-8?B?RHhqNzhyN3V0cUljUzNlV0o3OTZnWThjVkkvcUdlV0l5NVk2RXN1TzRLUDJO?=
 =?utf-8?B?SUd6ZGE3R2ZpZG5UcWtvWSt0VmhYUTdXZUlNWDRUdDZ3RnQrNHg4UUxXa3dp?=
 =?utf-8?B?MEhMa0tBKytmcm9PT1dwMWYram1oZXVzYnU0My9ZMUg1ZDM4NDEyQmxGakF4?=
 =?utf-8?B?WUNCMWFqejJ0TE5sZUR0N3VSbm8vYVg4YWZXemZSa3BwelRjQTRBR0xlRXB0?=
 =?utf-8?B?VG9DalRDejA3Z1BGcnl5MFJjTm5KaHdtQmt5eC9NWTgyMEE3VXkrZFV0OWsv?=
 =?utf-8?B?WXlwQnhVUFhFbzhCTDNqUEQ4WFRpZEVOSktuL3NqTEtmN2ltdWV5Tmd5cmFp?=
 =?utf-8?B?ZXV5LzFnQzZxSGJqWEI5L29yTGIrbEQ5R3NDOVgzUEdOOFVKOWZ1OHUxdHI0?=
 =?utf-8?B?czRnOWNFbitmVG5GUTVka1lXQTN5dzJLUDJhbVBrZEtjVVo2ZEhrRndvQmdj?=
 =?utf-8?Q?H1jM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czRhWWdkQkdXcjdoSU1rOEQzKytyQnB1aVpDekI3b1NqN1ZOU2xVUHJDN2x4?=
 =?utf-8?B?MVFObjY4Nk5FdWttbHVjNEQ4NVhuMzlkTEkyVFA5WXVKaUVxSzNDOXYwZ1dD?=
 =?utf-8?B?SW5vSjV3dDNobjFQY2c5WjBPbXJJbzZScS93eloxNklTK2J5dG9IYlhVL21V?=
 =?utf-8?B?YUNpeERTM1dOaFFYVjd0TGtzYXhoVkhKbzZqRzBqUVVKaERhZE1kbXRVV2VO?=
 =?utf-8?B?bEVmaWwwRUZmSGx5OHBhVHNMZTVlQU0yeC9BNG8zYkVhT0YvSkhob084Rklu?=
 =?utf-8?B?NjM3RDBDbUUzVUtnNWc2cThZODFMaVdZVnFuZCsxOFdMSzVLTVJ6VjJRdXRr?=
 =?utf-8?B?TWZxZVk4dDFJVzJEN05QdDl2WUpPbFc5eGpFaW93dERBb2w0dHl0bG5rclcv?=
 =?utf-8?B?WXdvSkZ3cEwrY2ZnK1R6M3g1L0h4cnpyajhRTTM4Yk9aVkJSaFpuWnRZWEZl?=
 =?utf-8?B?OFZCVTBrQ3lZRnpmNHprUWhIR1ZPcXJmUzlkSXlFZEhDSjN1bUJOSFdWY2ZZ?=
 =?utf-8?B?OGF3Q01acEwxODhpTW5mbFhxWEJTM2RhZ0JlbWhnRFpYTTV6NGdRb0tpSHli?=
 =?utf-8?B?QXhMbklqUlhUK2xiaVRvdVkvYy8zdVF3QUxsZXdQNTUyNFZOWjBVRlZNblZC?=
 =?utf-8?B?SDUwTWIvNkQwZDM0dVJQM0hDTWdLS3FzUnFBOW4xd3h5VTRIMGtUWXVuSjA1?=
 =?utf-8?B?ZVRXVmtrY2ExNzdoRUFvdW0rbkhKRHhEcXNrdVNYdTFnbmlHWTZ1aWgvR3hK?=
 =?utf-8?B?RitncStyNEVOWkloSXY2NncxQXBCS29CMENQZ205Y0dUMGhnQSs4cy9md1c5?=
 =?utf-8?B?UmtCS3FEdGtTWmtOZmpTYmloUFlHbTZKYlN4aEZ4cjBVYzNYUEFSeFkvNVhJ?=
 =?utf-8?B?Uk5wbzJZRy9ieWRrcm84amRQNnZCdngxMFRnRUhTN3hRZGFML0tiT2FVSUJv?=
 =?utf-8?B?Q0FHd0lVNTRIUG4rbFB3OXl0RXRUUnVMMStzVXhValhFOGlTUnNZYzFCcjhT?=
 =?utf-8?B?M2NnNHZNa1hEODgrVHZLM054WTM2SFhZZWRWUWxxeU9hd2tSWVR0bTc1czc5?=
 =?utf-8?B?am13MXU1VkpzSHVZMGdUMEcwYWZtaFVMOVlOQzd3SDY4ZlExMC96YVhaSWpt?=
 =?utf-8?B?OHd5K1piUWd2cmRZaENNcHhPUHJvMGNrZTAvaFF6czVmRlNPdmt4RUNQbTlK?=
 =?utf-8?B?eFpYUmxBVk9ROHFuc0F6cU03dUo3TTJ4S01xZVNnRkhxYTIxdHJFc3prM3R0?=
 =?utf-8?B?alVNeEhHZStHK1VwTExjU0VRbm9LZ3gwVVp5U1BpNUd0OGI1cGtCRDlZVGlN?=
 =?utf-8?B?SlFqVmticGZlc255NjRxZk1ZOTFCK2VKVEJ3eElNNTFNZXVzalg0NUpaUHJ3?=
 =?utf-8?B?d1V0bnRyYVlxK2c3YU5NSGk5NUtpQ2cyUkx0S1lndStETm9xTVcrdFliQmVw?=
 =?utf-8?B?aElNMkJpNWdVc0ZTdmt3V0JzTlZ0L0hKMUxiSGdQRUpjZDgzcFhwNXdGazd2?=
 =?utf-8?B?OGEyN0NhbU5LRjJXNEZoK3BQMCtWWXI5elVYZkltTkNqK2twSkpJdTYrL2Zo?=
 =?utf-8?B?R2ZRUTlPR0l5eGUrZDRXVUxLcEtNQkE5Z0ZLRURXbnZjeURqd1Q2RldVMkVZ?=
 =?utf-8?B?UnpVbHBNRkx6YmFEbGFoT3lFdDVTUXhyeUMxV0pTVmxuMkJBZkFZTE1MRlMz?=
 =?utf-8?B?TUVYNjlITWZNVmJWSjk1aEJBcWQvVzFDWktiZUhrNTVTSkN6aEpjeDlLUEM2?=
 =?utf-8?B?MWZJSU1US01RWUtZaGtnOFp4NWNVcVNmeDJNMzI0QU15a01aeE43ckFEU1VO?=
 =?utf-8?B?N2NRVStLWStqNE4xYUc1VTdqUkV1V0VFVysxL0hOM29qNW5iMDRWR3c1UXdT?=
 =?utf-8?B?c0Irb3ZHM3VESWVqWjRqa2lzeHRQK1M0cVdOUkdGK2NIMi9zOFlCZ2lPMC8y?=
 =?utf-8?B?dlNYNTg2ZUgzMjA1ZWZndlVBQVFUbEtOS2krYll0QmM1S2tTb2NBQitGUy9D?=
 =?utf-8?B?emR2VlZlN1NGWEthdDRwSnI1aXdXbDFDL2EwSUZrNVJoYXdrdWlMRllNcTRj?=
 =?utf-8?B?d1NrTm4zL1c4TXNKSzJNa2ZpSmtqYkhlZ0tVMVpKN0xwYUVNQ0ZHc1BLRy8v?=
 =?utf-8?B?NGJtbEJFS3EzNXhlY3V4a3dxclU1LzdWVmNRbXhOdUZNbjIrRUdvOVVMS0JU?=
 =?utf-8?B?cXZXVksyUFl0Sm9tYTFCaGowd1BmTjVtcVRqKzd2bHo2UXhzYTBPOWpGTElh?=
 =?utf-8?B?L01QenRIVHJYdEdybGQ2MUlMeGt3WG9kdkc2Tk1IZXp4bUJMQVhOblZMdDBw?=
 =?utf-8?Q?1BuuqIAOaF/TEtiQOa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9f252b-1bd1-43c3-12eb-08de5cb99fc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 09:02:25.6042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6A/zh2u8Vd84pCioFWOjQFJT4KwAKShWFHPjIsMYpcD6xsE8aBcmtBvfIdrmFNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:wangzhi@stu.xidian.edu.cn,m:David.Francis@amd.com,m:felix.kuehling@amd.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0712785B63
X-Rspamd-Action: no action



On 1/23/26 15:15, Tvrtko Ursulin wrote:
> Since GEM bo handles are u32 in the uapi and the internal implementation
> uses idr_alloc() which uses int ranges, passing a new handle larger than
> INT_MAX trivially triggers a kernel warning:
> 
> idr_alloc():
> ...
> 	if (WARN_ON_ONCE(start < 0))
> 		return -EINVAL;
> ...
> 
> Fix it by rejecting new handles above INT_MAX and at the same time make
> the end limit calculation more obvious by moving into int domain.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reported-by: Zhi Wang <wangzhi@stu.xidian.edu.cn>
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Cc: David Francis <David.Francis@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org> # v6.18+

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v2:
>  * Rename local variable, re-position comment, drop the else block. (Christian)
>  * Use local at more places.
> ---
>  drivers/gpu/drm/drm_gem.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7ff6b7bbeb73..ffa7852c8f6c 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1001,16 +1001,21 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_gem_change_handle *args = data;
>  	struct drm_gem_object *obj;
> -	int ret;
> +	int handle, ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>  		return -EOPNOTSUPP;
>  
> +	/* idr_alloc() limitation. */
> +	if (args->new_handle > INT_MAX)
> +		return -EINVAL;
> +	handle = args->new_handle;
> +
>  	obj = drm_gem_object_lookup(file_priv, args->handle);
>  	if (!obj)
>  		return -ENOENT;
>  
> -	if (args->handle == args->new_handle) {
> +	if (args->handle == handle) {
>  		ret = 0;
>  		goto out;
>  	}
> @@ -1018,18 +1023,19 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  	mutex_lock(&file_priv->prime.lock);
>  
>  	spin_lock(&file_priv->table_lock);
> -	ret = idr_alloc(&file_priv->object_idr, obj,
> -		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> +			GFP_NOWAIT);
>  	spin_unlock(&file_priv->table_lock);
>  
>  	if (ret < 0)
>  		goto out_unlock;
>  
>  	if (obj->dma_buf) {
> -		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
> +		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf,
> +					       handle);
>  		if (ret < 0) {
>  			spin_lock(&file_priv->table_lock);
> -			idr_remove(&file_priv->object_idr, args->new_handle);
> +			idr_remove(&file_priv->object_idr, handle);
>  			spin_unlock(&file_priv->table_lock);
>  			goto out_unlock;
>  		}

