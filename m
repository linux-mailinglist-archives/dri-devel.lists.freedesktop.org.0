Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82CD335EC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 17:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39E510E8D1;
	Fri, 16 Jan 2026 16:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tshF9Omu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C821E10E8D1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoIzVt3CUAl7oLteTgSO75it/wGlo77XrXywbPK+PufqIvViEKQzrRqGHnS4sA7MNGulcupYx7X1Bl4WzNi8V9SG3SNtqOPcUlJBvPQLBLv4qoe9k4ZlAXSO80q6YxqDwNGQA4kF6n5f4hqu8VNVLGXZHqb+XviMKVqlGZn1a0in9dPueGdl4swN5MOf+5tsBi4POMaQLiWyf/YSB6Np9fGJ8DhQpg/i9NqMittHKHenN4mf+88FS/FqsOdyW2WSQTelFMQaNfF/IJrV5QgT7KfpeeOuzr6QS3w6lPgrI6favVHL3gpe1KedtDh9FLunh28UQGkplulSwNQGCOF+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOYdMu8lC54wz6/um9r48n6MuZ3pAr+QCWod30J2Mik=;
 b=Su4YfacyPGocAsTjdL6TWMuqsC06TXWdjXjW6oD24k/cyIu9OrgoUJ1byitUrQJMVaGLu98WwV0dtrphid6/OHA5mPLwh7tYkc/6ODjmXcKDjHSCU12A6DuYk0HXbsn3+bUKsQTW56lmcK0omAp6YH2AofD2F0rEz/NSUK8mGTtaIYgDVS+jzRkSV4Md95K/Ih2F0KAyx60a+WJkZH+Wbdojx13tVNebl7B9j2ghQvLNgJs7SIvs1LmDcNnqo3rtjrA5S9ww8yHalKBVlisdUKGooShpExR5jRb0rEcbA2BfX4agZUenLVV6NlU1hNbtnoigZX6UNkf84njWlDn0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOYdMu8lC54wz6/um9r48n6MuZ3pAr+QCWod30J2Mik=;
 b=tshF9OmuNffztmQSy6InBDuBPl3DUmb9daJsww0AIaOHk+wDat1x4pjW+jg+zyQF7XlF7iD4UHOMy7YGW+zHAgsHvonvKNPs57MMiQXc6/hP2Z+MSiFT85E2mqnSbZUD3/S3eyCA2V6PeGoWCbv6fy1TJii+Zs5adyBWCDSSMbVSOkmB5qeJLozzzeS0lWcWoZjbGUw420reDbjCrCcNyONr9sg/0F1KpvfUcsiLjOKrdoyrlxv/G9Z5rUxHD97QXNyY02mEIKitOrdeqzyFH+hAJWgCQOkXbVdh1pGTvqY5HZ7yHh9CQ++WVosGnIClDkqRTGToZPkkFqG3ZOteHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:02:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:02:11 +0000
Date: Fri, 16 Jan 2026 12:02:10 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linus Heckemann <linus@schreibt.jetzt>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: amdxdna breaks suspend (was: Re: [PATCH v5 2/8] iommu: Remove
 IOMMU_DEV_FEAT_SVA)
Message-ID: <20260116160210.GN961588@nvidia.com>
References: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
 <20250418080130.1844424-3-baolu.lu@linux.intel.com>
 <ygaqzsib7bc.fsf@localhost> <20251230011916.GB23056@nvidia.com>
 <yga3445n4wt.fsf@localhost>
 <CADnq5_NH0DiyE0M44AzaEQhmSksj13wVwEK_Y2JHj3OLEPs9Mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NH0DiyE0M44AzaEQhmSksj13wVwEK_Y2JHj3OLEPs9Mg@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0325.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bd6ca0-b8a6-4625-a9c1-08de55189ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eC9NaHRnUE5iZ1pYSzF6dVdYZzVtWGZnWG1QMWlWM0hJQ2tqbDZrV3dxVnZO?=
 =?utf-8?B?Z2pkbXowT1kyVXJpbk96T1MyRy85Z20rbVJWRjBTSnk4QUJtZFUzMWhtWkVo?=
 =?utf-8?B?K1JTZFdBSVJXbHloZFF1WE5xQlFuWm9CWjZ6emI5QjdZT2lQbXNDV1A4OW03?=
 =?utf-8?B?Zk9ETldxais5RG96RXdIRHZDVEZxRmo3aDFYRzEvSlNFdll1bEh0dHNzZk8w?=
 =?utf-8?B?NUNzQzZZRHdBSU5INHlzN2h6WkRZWi9vT0tBNVZLcitSRUVBR2M1RFJTdFdM?=
 =?utf-8?B?eHVoZ1ZkeXYrKzNKZGZESVZHN2NuY01GV2pkZFVLdWpNNjFDYmQ1bXNZcTZW?=
 =?utf-8?B?MHFleUpBOFdEeUVXMjRES1N0TVhPR3Z6bnM1S3RydXNyNEd1SXJNL3FUMkla?=
 =?utf-8?B?ZG5TWXNNbUVIdE9zSTR3WlhLUHA2VVBhOS9NWWZnVU5yQVRFSjMrVU83Q2dM?=
 =?utf-8?B?Z085djc0S2wzbjRVT3k4WkVEL0dBam9lVSsyS3kxelprVkJmL1RMV3hYVFJq?=
 =?utf-8?B?VGdJSmJZcHBOVWFhalZxZWVFOFJRYUhXRXhIdzJiTkI0Z283M0ZCczNYdEFz?=
 =?utf-8?B?dHpaL3NQVko1SmxJZU9SajZnTmVLa0w4U3Bnak9KbjFHTHVCUEZGZjRwT09u?=
 =?utf-8?B?VEhyN3ZhOU1tanNHOG9uTTJCTGEzVG5wek9wUkF4Z0lvbjl5TVBNMzFlSkNi?=
 =?utf-8?B?RDhQU0g5OUZHS0hlSTBOZDdWNUZNdG9yaHFJWjMwWFFjRlIrbVdyVmJrUzNo?=
 =?utf-8?B?bFh5TmJzSlhacThhalBZNUw0RHBSbElWSnNBTEFDd0dxbnBkSlFTM2p4UVlE?=
 =?utf-8?B?SDB2eS95QzVQSE9zK1VJNDR4SXRJZzNTZCtmNmcrQ3ZwdndnT0tXTysrcmkx?=
 =?utf-8?B?eFd5NVRJR3Y4NVVEMFcxbG9lMnJsZmZOS3BCMFR1aTJ2WFhjM25weDRUUVZo?=
 =?utf-8?B?SlJZTmltK0xReXQySWhwM2g2WGZQdzV4TzBTZGJnQmYrTEwrMTZHTUFOeVNj?=
 =?utf-8?B?MDk4U3hTcVI1MSszVk11NjhvbzJ2bjFXelM3dXUwQ3dBSUtSR0VYNDJhZXh3?=
 =?utf-8?B?YVFFSW8vQUdhYXZ1dHk3L1l6YjhTU2hGSElsemt6WmlYQUhDU3N4VkcwZjVh?=
 =?utf-8?B?ZWxYM2tUZ3RidXBFcHAvM1dwOEE3dnRpajBBa05CTDdDbitmWDZqcGxuai9m?=
 =?utf-8?B?OXBFSFNHbm1qY0FnQmpnUjVJOVlmUUF5RjZCam1xS3AxNmtpaUdDdkJlUHJx?=
 =?utf-8?B?RjlWUVhkWUtkYzNFVTZiL3RxZ29ENThlQW5xUmQyWkFidXp6VURTaDR0S3dt?=
 =?utf-8?B?Skc1cG5RcjZBR2FLR2NTYUxCTmZPQVRSTW5BUWFQd0ZQZUpkSFF6V0pJR3dk?=
 =?utf-8?B?UGYzYlhFNVlZWTk5bEg0RGgrMTNxLytmZmdNbHFOalp3bGVHOFNCdjB2MTBl?=
 =?utf-8?B?N0RaSGVMOFZLdXJraWV2SEU3WkJISDFFSXlnT01ISnZUdnk3YkpodUgzZ2hZ?=
 =?utf-8?B?TzUzckprcmg2K0R3cExGS05salJtOFZaTGZaSmVGYXV1enF5RGwxa2NDQUVW?=
 =?utf-8?B?WWhzTXVJT2p6ZTVkWkVDUFhPemI0aW5NYVpBMEo0WktCK200VDJscjR5TEZW?=
 =?utf-8?B?a05QZlZoRGQ5bHpMbHlicTVVVU5UeTlpOHA3cWZhMU84eXFZUSs1OVFaL3NM?=
 =?utf-8?B?QjFSeVJtdHpFeXdYUjRsNGV5L1NWTXVXRHQ0NzVjeC9Ic1VVYURpTzhzWVMv?=
 =?utf-8?B?cVJoMnpQUXZpVnM5NlZTc3BhYXphUmFCd3VkbU9qYXVmSi9hQ3JZTVBkQ1R6?=
 =?utf-8?B?Z0JXWXVZVE92MkFPelB6Z3YwREdFMFVOVnppRGx6M0hYR2thc0VuS3kzT1o5?=
 =?utf-8?B?U21ZT0taYkxmSVdtRVVFVnlqVDRmRWlzTXROTUZoUW5NU3JZcHp5VWp6bGYz?=
 =?utf-8?B?NEJjZnpQTkNFcEU1OVgwTU8vVmY5VWhFWEw0L3pOU3VwaXdHdEZPT3FhMzBL?=
 =?utf-8?B?eUE4UUt3eW5oK1d2dGRYRTVqWW90cUMxNGRkbFd0enpZdEJTWVVORXJVUTJh?=
 =?utf-8?B?Zk9wMkZnaUdTRWExemtBdWJ5WUtkWkQ0RGt5TzYxajBVWEo2SGp6YnVsUWM2?=
 =?utf-8?Q?Ju+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGdSTHNOOVlGa0tqRVNwRHZqUXpDS3pwVHhJbU9HclFMb2tHaGdFTUFtUmN2?=
 =?utf-8?B?cUpsYW5DNTFTenJyOWRiMXF0d0t3OExCU3V6RUpvd1BGSUF3QTVKZ0JZVXVX?=
 =?utf-8?B?K2FpS05vcVNYRy9kRGl2WHgyQ0VMUjJrOStUYW5BdjBIc1RNQnphR3ZOeGlu?=
 =?utf-8?B?djBCVEZmeTY0Z1pHcFNQNHY4UkJSRHcrSzJoNysyOGgzSUxkbldNU2NxUnhC?=
 =?utf-8?B?NWNFSXZYSzQrK2ZvcGRzQVZRSG96RWUzeWllRDJIZG1kUGtmckY4cCtva24w?=
 =?utf-8?B?SEphblBIVnV6b0JkYVBrM3pyUGowV256b3RjcDd2WncrRXBLNTM2QkpiaEtL?=
 =?utf-8?B?aWcyWkVISWc5SXhwY1RvOUZmOXN5dVNWc1pmUVVFUGFoODF4V040akFiQ3pO?=
 =?utf-8?B?clVWaG1EYklCaVo5ZHY2c29YZEZoWjlrZk9yelQ3MFRXU3J6cjgzQnFraTNQ?=
 =?utf-8?B?RnA3c1g3cGlwajE3Z2FEVUllZldXZmVHV296NUhlWWlvM3Jvb1lOQmtjVlNx?=
 =?utf-8?B?ZE82ZmZXU3l3Q2J1cytuZ0NIdVRsYkJmdlR3aTdPdFFDUStkWmgrNEZzWmhL?=
 =?utf-8?B?b0RlOTEvbkk0aFZkVDZZTVllZGNjbm4vUnNUTXZyckt0azFIYzdteUdvTlNl?=
 =?utf-8?B?UlBzdFVSYzhPdTBkbnU4TnIxZFpBbVdSTFRpcXpWOWM3aDdpY0dqdGpLMEdv?=
 =?utf-8?B?SnJJMmloWk5XZUo4VDlzZThRVFp5Y04veFBSL09Pc24wK01GTkU1dXp0QnQx?=
 =?utf-8?B?L2RTNXlWdFZhbHMyWGpEdit3RTRTWmZrNXl5L09nL2NnclNxcGJyT2ZsTTNT?=
 =?utf-8?B?c1JoNmFxVk1FcWJOdGJRbEJyZW1vTitWYlJoQzJmR0RkNEd4ZEZWYkFPYUJi?=
 =?utf-8?B?VTNmSWp1cXVhTXhDUWxWM1lwWmlXdVV3cWloZGNXSTRyVzVHVXpZYnBRRzIx?=
 =?utf-8?B?QUxwV3pwWE9ObytuTEIvN0tWN041QmtHSzdDL3JvZUM4SGlFbVRqTG5nNm9U?=
 =?utf-8?B?TGRvcjBZdHhqNmJ1YUR1Z1hIcGNBSjQ1YkhUYXpQN2lBUWNNNVRpc2JjK2Jn?=
 =?utf-8?B?Sm5KWFNSMEdBOGVDSGtENERqd1I0MVIvSFc5S2Jodmd0Y1hnRmh1UVg5eDI5?=
 =?utf-8?B?TFF3ZnhPb0JiWkYycXMxa2dWUGxjN0Jnd1JxQkZ2M1VYV2g3clZCL3J0ekVZ?=
 =?utf-8?B?cEtPRU1GVldWWHRwVHQwS2NsZ3Z2MXZaV2s4TXBVbXNoVTUrY0toZlB3Znhx?=
 =?utf-8?B?UUI2WFU5eitTSFdYczNFNHNkQ21xNnJ0aERKUzNqbVp6bS83bE9lR0MvVStL?=
 =?utf-8?B?WmJJVEtqMGw4SVlvMDJwU2ZFZmVCVVRGSXdCZUR2bWRLRmRtOUFVRlh0ZmNP?=
 =?utf-8?B?UDhtazhpTnFrRHEyRTdYbHJDTEhobEhlc0VjVCtIRVdDTE1abXJ6OWU2Vm80?=
 =?utf-8?B?SHNWcG94WmhuTi8xNlNFQlJDS2xibDBiNnNweExnVlM2ZGdCNVppSCt1L2d3?=
 =?utf-8?B?UEFBS0dsZkJWK1Ntb0JBSTdDRUpmQ3lRZmdRaVJEeEFWZGR4TENNVnV5SUln?=
 =?utf-8?B?ZkJqcUJQVTFVQU1oRGFXZTN4WjFGdUNIdFNUU2ErRWdrQkxKTXdnRlpjKzVQ?=
 =?utf-8?B?KzNxdHhKMGlEWWgvTmJ6YVluODZrQ2tCa1N4Y04zOTF4WFBSTXIwKzljZEJ0?=
 =?utf-8?B?ZFJQckNVSVJvYjErdWlRNjJ4LzF0VS8reGRqOUJ5SEFhUDQyaWF4VFlEVmhT?=
 =?utf-8?B?Rkx3akJFR21EVElSSEY4ZHp3L0VpY3J1dUJYdUpFL1JkdHhGUjU1KzlIc285?=
 =?utf-8?B?dk82QlhuMXFUY2lJODAzWmcwZTRZeTFTUU9YMC9INTJGcVZiajVrb0FZdDNQ?=
 =?utf-8?B?bmFwMEl6MEk4TnFDSUg3ZGZrTHhrTUcvUGNTU2JpbzE5UVFjR210dVFaYm5Y?=
 =?utf-8?B?K3pJTE1wV0crZHRsalhrc3RKcUVtNlRRVklZTE1ZQTJQNEhYd0doYys1eGc2?=
 =?utf-8?B?MVlla0pYU0xZWnQ4UmRtM3VQLzZtZHVrWFhtc2QrRE9CMkQ1aE9rbkY4T0VP?=
 =?utf-8?B?UWphRUJkZXFiWXlGbWZobWdHOVhOWlpsT2JUWTMwVWp6YzBrbDhPYXphSkJI?=
 =?utf-8?B?ZFhJeVozQkZFbHE5VXE1WDUyS3lGbXgzMTM3WWpEeWYrTjFvMHdXRnlHNnhN?=
 =?utf-8?B?VW1Bc2dDTzhBNFVqOUZkRnR4RWtpUG0vYlJEUlk5dGlJdWxrckpRRzZBYkVX?=
 =?utf-8?B?c0pRMHZzSkJ0SUdkeG9Sbjg3M0VhVXZzYnRlYkNNYlRQMTNpZEJKQmlaUjRD?=
 =?utf-8?B?QXFRTDViQU94NksvblZHMHh5VnQyUTcrbGRZamxCVGw4dkpLMDc3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bd6ca0-b8a6-4625-a9c1-08de55189ba0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:02:11.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSD3I0cWdthHscB0qZBgQwrORbq24+RgOji43uc5hpQpmTE9gYPFiFTa8UxXOtYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057
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

On Fri, Jan 16, 2026 at 10:27:56AM -0500, Alex Deucher wrote:
> On Fri, Jan 16, 2026 at 10:12 AM Linus Heckemann <linus@schreibt.jetzt> wrote:
> >
> > Jason Gunthorpe <jgg@nvidia.com> writes:
> >
> > > On Thu, Dec 25, 2025 at 10:05:59PM +0100, Linus Heckemann wrote:
> > >> It appears the code removed here was not in fact entirely dead; my 2024
> > >> gpd win mini ("G1617-01", with a Ryzen 8840U) fails to suspend
> > >> correctly, and I bisected the issue to this commit.
> > >
> > > The only behavior change this patch had that could be relavent to a
> > > Ryzen was in drivers/accel/amdxdna/aie2_pci.c - are you using this
> > > driver?
> > >
> > > Prior to this patch amdxdna would have failed to load in configs
> > > without an iommu as iommu_dev_enable_feature() would have
> > > failed. After this patch it will load successfully.
> > >
> > > If so then that driver presmuably doesn't have working power
> > > management in your system.
> >
> > You're right, blacklisting the amdxdna driver fixes suspend, thanks for
> > the pointer!
> >
> > @Min Ma, Lizhi Hou, dri-devel: do you have any insight into why this
> > might be happening?
> 
> The xdna driver requires SVA and the IOMMU.

It should probably call device_iommu_mapped() during probe then

Jason
