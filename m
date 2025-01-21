Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8878A187CD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 23:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA24610E2EC;
	Tue, 21 Jan 2025 22:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PjPB9G12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70710E255;
 Tue, 21 Jan 2025 22:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnLxkwjU6kWVWct7GyoSf6/9d+Ik4e4xHHXa5BCx+Xn33K1TC6S/jI6HCZmKbIiTZjCO9mn/IFh0mwqEagsJe0iNBibmd66av4iFJ4sZj1iBt3UHo2pUseERsBoBjllG3kqfxbIHxrWhVp0JCm07zDEYvoVT8rdvZ2MfJ4N3yvvOLCkiivS6TLEIQF93s/C+6hfSCtXfunm5Rw7gLgjHPV6ZdP4jIJmKeGF9nnUpDR85F6jJbeaqC/nN+ABBks5eOG0PQ9VPIo1n80QJFxF830CoQd88qEU9npIDFPuhaqPo1RhCDeYP4w0nTlUN/JjouBnInihNYCu2+Pq4l5n6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEAA3LN2/focx8BnOZ5QrF76sM3zXPifCz3s5WMIYqU=;
 b=VTlxa9+UrTVnIhC1+CzNLqRQVIRsQTi2gH/ZiMXRwPbhgtNF6lbzB/Qp7Jw/dpgFIuZKZeq85H4UOsnPlYPDxhLT7vr4cE/j6/W8iBjVq/30mFaoCdRZdBqfvzm5lOKdkK0aylNbmNyl3xD4E6ZAbmdtVEiCT54w/4VA7frtrtvUsFUdrg7ZmRMxN0Qe1LFYRjTRrOs+latIX+VQfrVPvsRrvSD/QxZglZ+8vCZLD3PyPAn5ZHcsytBi+waqpfqwTgcXvuY+2Ex3cGh4eFzPVISXLBMHOX56B4BTBkoPOv3KyH1C9CFXxHDUYyUq5p0CKuTxYdaEdDSZaA4gTexqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEAA3LN2/focx8BnOZ5QrF76sM3zXPifCz3s5WMIYqU=;
 b=PjPB9G12DkHXhIBiXAvMuSfe+2Q8ZPxvglXRELCYH9dBSgm69GA61jMaKZOU95PCl5qIKQEMZ89Hy2YExtPUfaM2pNJJjSJB4ufxnBOpjWZGSbTdeWQcr18uGlOVt5OCAi1vNFfKRIWm7yksOFDqmSQHapraQIbUOomOGxVCS4syS9TQdXYBpY7OahUufsxuDysk1yEPwtAw8II36MeyZNx38x4Chydxm4EqOP+9CwvFlXFdmuma1KNQCaPHK3fxkoUzgdqlXbzgHJVV9tS7V3YeZJsOvyJQqJh6NbXwqly4sRbtdRM94UQUwsoqLHTIBxXXMe4gfKI2JU0OmS6A3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 22:40:42 +0000
Received: from CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04]) by CH3PR12MB9146.namprd12.prod.outlook.com
 ([fe80::a638:d48c:2c10:9b04%7]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 22:40:42 +0000
Message-ID: <62cff8e9-3e5e-41f3-ae4c-d15fadda3d6a@nvidia.com>
Date: Tue, 21 Jan 2025 14:40:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <20250120220011.GJ9249@pendragon.ideasonboard.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <20250120220011.GJ9249@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::19) To CH3PR12MB9146.namprd12.prod.outlook.com
 (2603:10b6:610:19c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9146:EE_|CH3PR12MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: eda70c4f-48b1-4dfd-ee82-08dd3a6ca300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlhYOUQ0d01PM1hjanlPaTdQaEY4NzU3eDJrbEJHTCs0b1N3MHZQbFZESmw3?=
 =?utf-8?B?UHVPQ1JHRnlYbnBIQkUzMUJraUMyamlGTUpIdC94b2RpQUFVQktTMHgzRVdV?=
 =?utf-8?B?cW9zMmJuOGU0N1JVWXVZUkttZlZhd1V2cStHQmh2YUl3TGY5Z3VCK2cwM3Y5?=
 =?utf-8?B?STRwcENRMHVXODM1U3NxQjYrQ3RzTEozSU5HUENzQTU4K1VHdmo1Y3B1UmQx?=
 =?utf-8?B?MU9sMnFGckFxeGZQZmlDM1JWbGlQY285OVFSclU1R0lZcUVObk9QYUR6L3lO?=
 =?utf-8?B?azJKNkthUUdqRmNOR1BXZUdLSmRYamNxQ0pSTktHYTU4WU1tZUlDVU9qdzhQ?=
 =?utf-8?B?bUllazAxd012bGc0azhYMVZBUmRtZDc1OSsxVEx1eEJjckJodjZ4ZG5ZSUd0?=
 =?utf-8?B?RVBqWlZPd3g3aXZMSDRYUVRVN0pOWVBnMWVCdjBadVF5a2xQdXNLdWY5TzdF?=
 =?utf-8?B?SWVTb3NrNjYyMVYxVVZ2N2p5SHBEUzFvUTMrV2VObWQ4b3hMM0JGV1Zla0Mw?=
 =?utf-8?B?cWU4VWU3TGxIT2JXcDRKem5KSTBaNlNYVHIrWWlZWEttVHhEb3Iza3p2QTlp?=
 =?utf-8?B?bFArMG5HRk01b0R3WVI5bW4wN1pyR2U4TVhFRkZGckovV2RyQ05uZWo5OHQw?=
 =?utf-8?B?aG1vZHVUOVh4b2dlZzIrRVBVNTdWcjBjTzA2RVVqemlCZUYzN2lJVVppVytj?=
 =?utf-8?B?eml5cDhPb0x3YkdVaENDMjQzak1id2RhVTVZeGlzZDh0TklIZWdjbVczK0du?=
 =?utf-8?B?REFGRVV4U3lTZ0dBaG83T2dJSHhPUTdsRXNVQ1cvQmhWWXFRNUFMVHUrSkUw?=
 =?utf-8?B?ODhmL2pWYVVGQ2RoUjhHbVNabkErN2gwbTUyRmFFMjQ0UHJXcGZJZkNYMnRx?=
 =?utf-8?B?b0VkVEk3QUF5MUN6TVNabzVmY1JzcFBMeWllSGV4VWJ1Tk1RUkdXb1diRnY3?=
 =?utf-8?B?Yno0TTNxL0FWdEVORUk4a0FHeVY2ZXltMjJscFFIVk4xSnFtVmZCRlJIQUJq?=
 =?utf-8?B?ekNPWGhlaCtnaERHQlJEdmdvenFzbUkwU2tEeXlGTEJ1MFg5TzlMaUpwZ0tl?=
 =?utf-8?B?ZnFXd0I4OWtVSTNQRW9yOUlMMm9qRWpvUWp1OVUwL0tuNnNFYjdPNXpSOVh1?=
 =?utf-8?B?RDZ2ZWk3bFd5Z1pnSEl2bWlVRFJ0ZnUwb21NcFhYTEExQUFEK3JkemZSRCsr?=
 =?utf-8?B?K2l1QUJONDM5a2xYUTVET2ZmOEtQVHZIQmdxNmkrcGcrMC9SaCt2UTUxRnZN?=
 =?utf-8?B?TVp0NFluRkFTbmRPYzlNeGZYSThZMjV5aFgvVDNDbEgwNjgwcnBhYTJ5dXVi?=
 =?utf-8?B?U0NKc2toUDVxU3AxamlvQTFVQzlzL214NEdPdkZ2WS9JZjJUdGJOY2JDV0tt?=
 =?utf-8?B?SGRUTCtaMi9RVngxdHhualZsZVpoWHlBWjFRMWdIa3pnVzM5ZlFXa0NrYzdy?=
 =?utf-8?B?MFFNTjUwTkVxR0RJL2dRMHNDb1E4NnYzV05LRUlCek11dWhxUFlTU3dqSU5L?=
 =?utf-8?B?bXkzZlNZWTAzUExxVDNQSlI2dXViNkRJRXNDTCthaHJRWlh0UThRUHFNVHh1?=
 =?utf-8?B?TGZrNGhUOUpBMytLU05LanBUUEpPUVFLRjVVOTYzdVV0cGVCWHBUS1pvdDJr?=
 =?utf-8?B?S2NMUWQyemZ0WWU5WC9sdzYvT3d0d2J3bjhmNWFqWDdaQU5mdFl2WFFZQnBr?=
 =?utf-8?B?K0FPcDdBOGRub1h1TTFiR0dCRHdEZ3daajlXWWl1WGF3NnV6NW5SbVZjd21z?=
 =?utf-8?B?U1hHYnZwOEZhZnBGYTdwWnBpWU1mb2hyckY3K2xheTFlNGlqZytTSjVwM1V2?=
 =?utf-8?B?SWNJS29lbjBBeHhYN04wWDlhV04xeUdjSnoyMGg1WkhvanI1RXFRaFFjdkFD?=
 =?utf-8?Q?l0JGc4e7BKO1C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRzbWpUR1ZWSGJMckpjUXZpMmFzZGJsRkRmb082N2NsdlRFQThVMVlKVU1i?=
 =?utf-8?B?WFNiMDRvbHp0VGQ3bkRlZWJld2lVY041NWJ3TUttaG95QmpDYmQ2YmtSeGtF?=
 =?utf-8?B?RG9ONG5zVU10cXZkMUU4c1A0Q3JLaTFOS1BkWEJiRThwZ29FRytxckQ5V0VR?=
 =?utf-8?B?eVEvQTJEL2VvMHFwMmg2TlhvcjdpdWt4KzFhQUUzV2RQWFdSNnYvS1BDVGVS?=
 =?utf-8?B?WlErbi9NWFgzU1J3QUc0dGtOd0RkSzZrWnk3bEd3VFBYTTZMM04zYU02S1NS?=
 =?utf-8?B?ZjJqL3RxSmJzZU1vYkxSU2phSC85K0FRV3JmUUtUcnQyWU9uQkV4d2hhaytj?=
 =?utf-8?B?bmJjV3JhN3JROTdLZWwwUzdiZzJrN1BnS0l6SWJyU3ZrOEpyMDBZU2g0cW96?=
 =?utf-8?B?R2ZHVW9pU3g4ZWhwN25WTU81Nk5xT1VNUFVvZ0NBQ1RsWVVkUEoyMk1Md1Br?=
 =?utf-8?B?Zk9PQ2p3T2loNUxSSjM0U01TSjNzenBHdDZnYkhZMlY2eG1aclpXZTFUdmhj?=
 =?utf-8?B?SEFlT1VVNFpxejcxWUo5d0I1UGtyaWt6RHFoQVhTTXlKSHNSdWd2dVdFWnd5?=
 =?utf-8?B?bXZpQXVPc05XSnE1SEwwZ2hmNzgwQzQ1SjVuamROQVNNWDBYNUFTeHQ0anZ6?=
 =?utf-8?B?UW9NdWt6WnBWNEhWZGlpWUgwY25wSkNxU0pncGZKOWYxMmRwSVUySDlYQ0RK?=
 =?utf-8?B?ZmdFdWRzUDJqSlhqN2hXQUphRi8yaHVMU1piUk96Y2lyM0FXTGJmTTh4TVZz?=
 =?utf-8?B?S2x3c2FxOHIyeWY0dTN6U0VLN1BmblRURmVmTWdtRW1ma1FpeElpa0xxdngr?=
 =?utf-8?B?b3BxdWV5Mm16YmFIeFlicEtiQ0MwTzhvOGRZUFRtYUFRYUQ0enlYeVRvMmJH?=
 =?utf-8?B?Y0xaNEZBeW1hcGlMdWEyRGFldU95SzVMWkQxOWFDdFpqZFFkTlZ2TmxFTzRY?=
 =?utf-8?B?SnFuTEhmczAwT2hFdEtXbk1lYkZ3RHdva0ZJaUNzSXdDcGRMSjNxR0pGaCtL?=
 =?utf-8?B?M1JwYVpIWVcyQUpGNVFjbG5pd1p5RVplZEdTeEtHc0xhM29oTFhpblJQNjRa?=
 =?utf-8?B?VUVaSExPc2prWmlRN2kvNG5jV3FRS3ZOTmdLcGRSTlFMc0hIK1Yva0NUbU9N?=
 =?utf-8?B?Y200cVZBSkNzczQ4V2Myb21sajBleUJuQ0FQTE1TWlJCR2NBK1NYY29GcnBL?=
 =?utf-8?B?TlBrRXBrbjNFRVg2STl3VDR2ZUNhY3h2a0JwQ2h5amJEeVp6MEZYZ1BIZCth?=
 =?utf-8?B?YzNnN2xaLzhQZSszOWh6aXpyaGFnTmN3bGtGS2tJNmVzVXkycUgvSnJvV1lq?=
 =?utf-8?B?TmQ3MkZzMU9scmFnMG1PY1RxcjdHUndtb0pldnk2bGtvWDVkRnVYS2pVS2JZ?=
 =?utf-8?B?MG5xcWFyQVZGS2pPbXNzSHM4REJ5aG1BZUFhWWxjSzduZWQ3ZitGbktqRlhD?=
 =?utf-8?B?dTM2TVhmbGxjTGUyc2ZSTk42TUgwVmZya291YkZkWDh3dDNwdkg4aUVodkNP?=
 =?utf-8?B?WTI4VDVSS040bVF1UlpOYW1DdjVpNU94QTJLSzRDbFF5dnpjQzVjRkhEUG9w?=
 =?utf-8?B?dGpKcjJMVWtlVnJlVjlKOHAwa1FhYVgrN3M1T0tYMDFBWWtXODlNYmRvS1Jk?=
 =?utf-8?B?M1d2NlJwbnNYaDVqeU1oeDVsR3FlQUFmaFpVakd4cXVKS0xtTytyTGxoNy94?=
 =?utf-8?B?RzV4ZWYwS2RmRkN0dyt2U3BLcGViRlpscld4S2g5M3U1d3ZoOGRyeDJzaVhk?=
 =?utf-8?B?VWk3Z3pqSkpaVHN1UlFsaFdITVM0dTlUT0dYaEN4M0FQZmhJM3ErN3hReEIw?=
 =?utf-8?B?Z1FMQWVwQlFBdlVUQW56MW9kVVBkUk9FTkxZbjlMMnFEZ21LL3NxOGwzTlh0?=
 =?utf-8?B?UnVlVFYxb2FyZVUwYlBGWWtrU1pKUTZwdTNRK0loYldUcGwzbTRITnpJN1A5?=
 =?utf-8?B?Mkx2WDBUazBIWVZLY1VVZG1Bai8xb0c3M3FPMVVHaFY1NWpjMEZvNGh2Y3ln?=
 =?utf-8?B?aDhQY0FoR0JpN1VEeGRTM3c0RWNFbXF5cVBxbENXYlVtcndYbXJ1RmFQQktp?=
 =?utf-8?B?QnoxQWRXSkZnbm81UFFLQUNxWjZZaU1WR09wQ2dJNUlDVHM2Z2ZqTnRWdnVh?=
 =?utf-8?Q?0f3/UET4UeOGy2hue23elVTMw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda70c4f-48b1-4dfd-ee82-08dd3a6ca300
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 22:40:42.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLNvtGFTr/G9z0nzwXygJTFVcuXm2dQGO+Mlf5jRMh/sI3mgBr6BeTj6d2aJjxfxzRSsO18T2LtLPo0EjrhsPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077
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

On 1/20/25 14:00, Laurent Pinchart wrote:
> On Fri, Jan 10, 2025 at 01:23:40PM -0800, James Jones wrote:
>> On 12/19/24 10:03, Simona Vetter wrote:
>>> On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
>>>> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
>>>>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
>>>>>> For that reason I think linear modifiers with explicit pitch/size
>>>>>> alignment constraints is a sound concept and fits into how modifiers work
>>>>>> overall.
>>>>>
>>>>> Could we make it (more) clear that pitch alignment is a "special"
>>>>> constraint (in that it's really a description of the buffer layout),
>>>>> and that constraints in-general shouldn't be exposed via modifiers?
>>>>
>>>> It's still worryingly common to see requirements for contiguous
>>>> allocation, if for no other reason than we'll all be stuck with
>>>> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
>>>> for expressing constraints via modifiers as well, and if so, should we
>>>> be trying to use feature bits to express this?
>>>>
>>>> How this would be used in practice is also way too underdocumented. We
>>>> need to document that exact-round-up 64b is more restrictive than
>>>> any-multiple-of 64b is more restrictive than 'classic' linear. We need
>>>> to document what people should advertise - if we were starting from
>>>> scratch, the clear answer would be that anything which doesn't care
>>>> should advertise all three, anything advertising any-multiple-of
>>>> should also advertise exact-round-up, etc.
>>>>
>>>> But we're not starting from scratch, and since linear is 'special',
>>>> userspace already has explicit knowledge of it. So AMD is going to
>>>> have to advertise LINEAR forever, because media frameworks know about
>>>> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
>>>> that the buffer is linear. That and not breaking older userspace
>>>> running in containers or as part of a bisect or whatever.
>>>>
>>>> There's also the question of what e.g. gbm_bo_get_modifier() should
>>>> return. Again, if we were starting from scratch, most restrictive
>>>> would make sense. But we're not, so I think it has to return LINEAR
>>>> for maximum compatibility (because modifiers can't be morphed into
>>>> other ones for fun), which further cements that we're not removing
>>>> LINEAR.
>>>>
>>>> And how should allocators determine what to go for? Given that, I
>>>> think the only sensible semantics are, when only LINEAR has been
>>>> passed, to pick the most restrictive set possible; when LINEAR
>>>> variants have been passed as well as LINEAR, to act as if LINEAR were
>>>> not passed at all.
>>>
>>> Yeah I think this makes sense, and we'd need to add that to the kerneldoc
>>> about how drivers/apps/frameworks need to work with variants of LINEAR.
>>>
>>> Just deprecating LINEAR does indeed not work. The same way it was really
>>> hard slow crawl (and we're still not there everywhere, if you include
>>> stuff like bare metal Xorg) trying to retire the implied modifier. Maybe,
>>> in an extremely bright future were all relevant drivers advertise a full
>>> set of LINEAR variants, and all frameworks understand them, we'll get
>>> there. But if AMD is the one special case that really needs this I don't
>>> think it's realistic to plan for that, and what Daniel describe above
>>> looks like the future we're stuck to.
>>> -Sima
>>
>> I spent some time thinking about this over the break, because on a venn
>> diagram it does overlap a sliver of the work we've done to define the
>> differences between the concepts of constraints Vs. capabilities in the
>> smorgasbord of unified memory allocator talks/workshops/prototypes/etc.
>> over the years. I'm not that worried about some overlap being
>> introduced, because every reasonable rule deserves an exception here and
>> there, but I have concerns similar to Daniel's and Brian's.
>>
>> Once you start adding more than one special modifier, some things in the
>> existing usage start to break down. Right now you can naively pass
>> around modifiers, then somewhere either before or just after allocation
>> depending on your usage, check if LINEAR is available and take your
>> special "I can parse this thing" path, for whatever that means in your
>> special use case. Modifying all those paths to include one variant of
>> linear is probably OK-but-not-great. Modifying all those paths to
>> include <N> variants of linear is probably unrealistic, and I do worry
>> about slippery slopes here.
>>
>> ---
>>
>> What got me more interested though was this led to another thought. At
>> first I didn't notice that this was an exact-match constraint and
>> thought it meant the usual alignment constraint of >=, and I was
>> concerned about how future variants would interact poorly. It could
>> still be a concern if things progress down this route, and we have
>> vendor A requiring >= 32B alignment and vendor B requiring == 64B
>> alignment. They're compatible, but modifiers expressing this would
>> naively cancel each-other out unless vendor A proactively advertised ==
>> 64B linear modifiers too. This isn't a huge deal at that scale, but it
>> could get worse, and it got me thinking about a way to solve the problem
>> of a less naive way to merge modifier lists.
>>
>> As a background, the two hard problems left with implementing a
>> constraint system to sit alongside the format modifier system are:
>>
>> 1) A way to name special heaps (E.g., local vidmem on device A) in the
>> constraints in a way that spans process boundaries using some sort of
>> identifier. There are various ways to solve this. Lately the thinking is
>> something around dma heaps, but no one's fleshed it out yet that I'm aware.
>>
>> 2) A transport that doesn't require us to revise every userspace API,
>> kernel API, and protocol that got revised to support DRM format
>> modifiers, and every API/protocol introduced since.
>>
>> I haven't seen any great ideas for the latter problem yet, but what if
>> we did this:
>>
>> - Introduced a new DRM format modifier vendor that was actually
>> vendor-agnostic, but implied the format modifier was a constraint
>> definition fragment instead of an actual modifier.
>>
>> - Constraint-aware code could tack on its constraints (The ones it
>> requires and/or the ones it can support allocating) as a series of
>> additional modifiers using this vendor code. A given constraint might be
>> fragmented into multiple modifiers, but their definition and
>> serialization/deserialization mechanism could be defined in drm_fourcc.h
>> as macros all the clients could use.
>>
>> - Existing non-constraint-aware code in a modifier usage chain might
>> filter these modifiers out using the existing strict intersection logic.
>> Hence, any link in the chain not aware of constraints would likely block
>> their use, but that's OK. We're muddling along without them now. It
>> wouldn't make those situations any worse.
>>
>> - New code would be required to use some minimal library (Header-only
>> perhaps, as Simon and I proposed a few years ago) to intersect format
>> modifier lists instead, and this code would parse out the constraint
>> modifiers from each input list and use the envisioned per-constraint
>> logic to merge them. It would result in yet another merged
>> modifier+constraint list encoded as a list of modifiers that could be
>> passed along through any format-modifier-aware API.
>>
>> - One consideration that would be sort of tricky is that constraints are
>> supposed to be advertised per-modifier, so you'd have to have a way to
>> associate constraint modifiers in a given set with real modifiers in
>> that set or in general. This is easily solved though. Some bits of the
>> constraint modifiers would already need to be used to associate and
>> order constraint fragments during deserialization, since modifier lists
>> aren't strictly ordered.
>>
>> This effectively allows you to use format modifiers to encode
>> arbitrarily complex constraint mechanisms by piggybacking on the
>> existing format modifier definition and transport mechanisms without
>> breaking backwards compatibility. It's a little dirty, because modifiers
>> are being abused to implement a raw bitstream, but modifiers and
>> constraints are related concepts, so it's not a complete hack. It still
>> requires modifying all the implementations in the system to fully make
>> use of constraints, but doesn't require e.g. revising X11 DRI3 protocol
>> again to tunnel them through Xwayland, and in situations where the
>> constraint-aware thing sits downstream of the non-constraint-aware thing
>> in the allocation pipeline, you could get some benefit even when all the
>> upstream things aren't updated yet, because it could still merge in its
>> local constraints before allocating or passing the modifier list down
>> the chain.
>>
>> Does this seem like something worth pursuing to others? I've been trying
>> to decide how to best move the allocation constraints efforts forward,
>> so it's potentially something I could put some time into this year.
> 
> It's a fairly interesting idea I hadn't thought of.
> 
> My limited experience with all the graphics protocols and their history
> means I have had limited exposure to the pain that communicating
> modifiers everywhere has generated. As a result, I would have (perhaps
> naively) tried to design a new mechanism. Using modifiers as a transport
> mechanism is clearly a hack, but it may be a clever one. It seems worth
> experimenting with it at least.
> 
> After reading the whole thread, I however wonder if this will be
> backward compatible. If two devices expose a constraint that ends up
> being encoded in the same binary form in a modifier (let's say for
> instance the same pitch alignment), isn't there a risk that an
> application not aware of this new scheme will pick that common modifier
> when intersecting the modifiers list as done today, without realizing
> it's not a real modifier ?

Yes, but they can't do anything with it besides feed it into an 
allocator in that case. In theory, the outcome would then be the same as 
before. The allocator would be:

-constraint-modifier unaware, and unaware of this modifier as a result: 
Allocation fails

-consotraint-modifier aware, and it received a modifier list with no 
actual modifiers: Allocation fails.

And without these modifiers, the intersection of modifier lists would 
have been empty, and hence allocation would trivially fail. 
Alternatively, perhaps the app passes in the empty list, and that 
triggers to allocator to use implicit modifier selection. That case may 
indeed be problematic. There could be apps misbehaving or using special 
knowledge to hand-pick modifiers that break the concept, but there are 
always bugs, and those apps are already at risk of breaking by not using 
modifiers properly.

The single explicit modifier workflow, where an app is importing an 
existing buffer, is something I haven't fully thought through though. At 
least in Vulkan, things like pitch/stride alignment wouldn't be relevant 
here because the app would also be communicating an explicit 
pitch/stride along with the explicit modifier, and things like locality 
are supposed to be discoverable via introspection on the buffer being 
imported (They're not mapping properties, but properties of the memory 
itself), but sometimes you get weird interactions (e.g., 
location-dependent alignment requirements) that might not be accounted for.

Thanks,
-James
