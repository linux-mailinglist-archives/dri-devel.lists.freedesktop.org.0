Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCAAE0E0E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 21:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2387210E035;
	Thu, 19 Jun 2025 19:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pcjKlzf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6B610E035
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 19:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGAzaTVqqu9wxaFpRpUD+C5CRweiuYF03BAHSviQM6/K4fEV/dduL9F+OOZPWneHKfLMQCqAGAneM7l/SSkh05seYWjH3br1DdVtMopckP12nxEcJ6RZGqqdQVjhVYOoFigsrF2xAGa6pD7Q8p5o/dT/GvIi/v4aD+AnFQdomIK1nftHpWRCc7QVO0WHJeAERzzMC6K2B+ZRV6Bo/X9ezeXa2kj0MaaWuVPl8C3b5DyINyGWTQKI5Qg7bD+w2q+mW2b96U3WfCfj2esGy9646Wl+mjCCnfGRILJRwIxVRfP8CdiTCdsWtVD/pGGCVs1B87JBA/8Pot36eGN875fepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw7vDkMHLSV4Muwq6i2WY46nL88n+pa2ikQrSZ1M3iU=;
 b=uQpjocIfIMqTuGeqZIWznGwwjtQ/pvDw1wafGmG8pYbtLQAg4GEgZ7wNw56sO7EHSjfn9eiZf+Ll15VaSh2wB+TJD8CVw3gprfVr2QC45GUFeLTFkVnCxqbFWBv2AC/tNV7w28U34VwVmbjNvxmvD6hweDxMsgBP9XhuAlRNADxWoVUUoMDSGSrGL9rm+RykdESdG4RhAJfqA2+AJBLeEtc8w7Hdf1uwK5UKrzyW50P1guHIVMOdI4ncuMcIEO6judRiumk3HAMj2qfxn62EDsdjClnzW8PRgXZ7mw9Jdcv/IsL9bgko1XaAvwo662LtRSZiXuC5BB7YFueBojiZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw7vDkMHLSV4Muwq6i2WY46nL88n+pa2ikQrSZ1M3iU=;
 b=pcjKlzf12Vp75CqYiMcB0T1+a+NT1M7J2tUVOigMIKkDokAQax8bkhh4z8nnc3bL4cUtMnjD1ofr9nUd2juXOEtqTJZHJtAbbjYr0fpvClapgzlZH224GlDdTEyzikOLNZmBICH/iKuqlIVCKAV7OAG3iaRCahzRy+pRjtbRhow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 19 Jun
 2025 19:35:18 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 19:35:18 +0000
Message-ID: <b4ab3c4b-afc2-43ab-8134-87499feaba0f@amd.com>
Date: Thu, 19 Jun 2025 15:35:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>,
 "Yat Sin, David" <David.YatSin@amd.com>,
 "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dcostantino@meta.com" <dcostantino@meta.com>,
 "sruffell@meta.com" <sruffell@meta.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
References: <20250617194536.538681-1-David.Francis@amd.com>
 <20250617194536.538681-3-David.Francis@amd.com>
 <787e56b9-baa5-41fd-ba37-e0c7af1f3dee@amd.com>
 <SA1PR12MB8144AF805DEC7C6378D55467EF7DA@SA1PR12MB8144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <SA1PR12MB8144AF805DEC7C6378D55467EF7DA@SA1PR12MB8144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SN7PR04CA0189.namprd04.prod.outlook.com
 (2603:10b6:806:126::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e500b74-d815-4129-faeb-08ddaf686c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjkrM1FmWGdnWHdiL09NOE93NnE0M2Q2NlcxdGlhckw0RUMwdUFTOEZWLytE?=
 =?utf-8?B?RU9JTE9NV0tJVk9oTXhzZDVHVTZMK2RtSHE4NXFhdTc4WUhEcHJ2dlFFVEcx?=
 =?utf-8?B?dy85bDdTWjhRemkxMXpUZFN1RmNoVWpleTVvMm5GOEk3dXptcG9mcVUwOENy?=
 =?utf-8?B?ei80a2xOaHZjR0JKV0prcTFGTko4Mmt5aDUzSjRsQjZGVjQ4WkloS1l6OGVK?=
 =?utf-8?B?TjZ4Tm9tNSt6Rk5zcXZzZFhOM0FDVStXYktKbEtwSjBjRjBIa0NHQXF0M0lp?=
 =?utf-8?B?TC9QSzRvellUdk0zWUoyeGpFcXdRUG12UVhkYWJwU3lWTzEvVk44Y29qS2hW?=
 =?utf-8?B?dEltVUlHaFpzSzZjZVFreFlGVW9uWlAyUEtwZ0poWWFOeHRaMUhXSEJ5b0FF?=
 =?utf-8?B?MHRYaGxiTEpkQmI2ZjdBTHJpaWljVFlGL2t2SkdOeEtUZ3hOUGpON3NmcmtW?=
 =?utf-8?B?VVFkcTc3TEF5U3RTYnRJckFYVldWOXQyaU5wTGEvOUdFTE5FUkZVMUovRFJP?=
 =?utf-8?B?TWpVUmgvYjlnaE01cDgrdzBSYTFaa0JzNlRMaFF2K1BBQk5pUFMxVG1sQndZ?=
 =?utf-8?B?NThPMGdPdXU2bHY5c1FIbDJPdzA0c0ZrVFRha1BYUXFzckUyMC8xWmNzRWZo?=
 =?utf-8?B?NlhoVFBBVWRrVndoMzhQM2xuN1l6Y0xpNGlLZ2hWRDEwR0JaV3VmMjdSNVZF?=
 =?utf-8?B?cEtWQUVjZk1wa2lsNUNQeDFydDlxMy9kSllKSEVJSnVvTSt0VjVEU1drVmdv?=
 =?utf-8?B?N2htNENrUXBKK1FyOVlnZFNZT0Fzc3JTSEVPZU1nNVhScG9ibkxIQnkwa1FT?=
 =?utf-8?B?NXljcWk0eVN3M3RKNmRFRlRxeUV3Qlp6bEErVFFvSXY4OFA2Yk1UYkZpVldw?=
 =?utf-8?B?RTRpZjZIU1k3cW02OU9FaGJkTHh3RUdJR3htWUJrMXhnSFBXQ0wxWVF1QlBk?=
 =?utf-8?B?d0tXWnFaU0l6dEUwUkl6UFU2RDl0NVgraDYwZ2JCSDNQYy95cEM1OENXVlRj?=
 =?utf-8?B?TGhXUFFBRk5xNHFML0lEeFE2RXRLSFZUZmVRWVhOM0h6R3hQdzliOE85WldJ?=
 =?utf-8?B?OFQ5Q0JrRVpFWEFXVXkvYmNpUjgvc1pOeXBjaVJFNlJmOTE2bUd0RjNWbEF5?=
 =?utf-8?B?TnFDZU1pcnFjMGRWMkxGQzBDQWUvYUJIVE5taWcrNWdjS1RCRWR1RThvZkxD?=
 =?utf-8?B?RzlCMGxtRDF1RnpPcmJGMGYxQlltVlh3SFRxUWo3VTNZemZBOEhUQ0M5SlB3?=
 =?utf-8?B?MFBxR0Mvd1lNWVpGWFRDYStGaHl3dHkvSTkxa25Gek5lVStvdElXNnphR2RI?=
 =?utf-8?B?N25yZURTdVFhTmh1em1SRlhnOWdscmZjamdDY2VRTkt3bnVDcWhVOTRNSXRv?=
 =?utf-8?B?bm5ucVZONG52Y3F5SnhKV1VjYmFucGpjR05XZ1hXencxdmlVMXNHeVZtdUVl?=
 =?utf-8?B?eW4vT1ZQMHp5SDFiQ3VoSXlyLzJYdXVKaFRDL1pXY0FySzQ0eDI0UnFuTXUx?=
 =?utf-8?B?Ukd6dVpjaENKYXV1YWNRQzltYXdlK216T2VKQzZWNjBEMllsMGZxdU42bjRF?=
 =?utf-8?B?SnQ0NWw2S3lyQUJvNzNDTzJWQmg0Q0IveksrVzVKeTFpUmlvZ0ZxRzRiWWJ6?=
 =?utf-8?B?U04zU20wYjF0M2d1QU1XK1VSOXBrK0RyQVMwcFJKNFJSalNSemFSQ2M0ZG9D?=
 =?utf-8?B?SFpzY1dxMkRMVldRWDgwb1R6dktIaGtrTi83L0Zualo1cFVkMEZscDJ4bllY?=
 =?utf-8?B?L092TnJSRjQzOXRCSnA0Sy9HcGtPcVZkSVZ3dGNqSGpMOG5zR3c5dHhnOXpl?=
 =?utf-8?B?SFpBalRHaDlPRlZrb05zWXZMUHFaMzVoRVJYWUp0V3MrRWloRGRZVUtra1k1?=
 =?utf-8?B?ZnJDYmpybm1VKzc5M243dGZxSVFWRWhGY0w4VkpwV251Q1RqbllaWmJPRlRD?=
 =?utf-8?Q?53ueK/N6ctA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1FjSWZxWFkyNjMvWU1xK2RpTlNRd0NRb3R4ZElVdGJmbnVCQWtoak91Y3BF?=
 =?utf-8?B?aFNjOXgwZUVLZTAxYmk0NkQ2VHdjM0V6MVRvM1pyYVY5VS80WUhzMUF5SVQx?=
 =?utf-8?B?eGV5Z1pRNnhvM3FZWWRwZ3l3ZXZPOHdIVjdVcjZSdTFMU3RjWGZKbmpvT2dx?=
 =?utf-8?B?QXlxV1pvL3FOeU4rb09sSkRJak5XSXFaQTZRazhPR2VpZWRya2lXV0dsWjYv?=
 =?utf-8?B?T1FVa3YxR1FjVmZ3U1V1d2h1UmI2VnovTlFrOWxia2VLbjE5Y054TG10L2tS?=
 =?utf-8?B?N044dFVBS2lCRFRpM3B0M3VZVGN5Z3hjeTA3L041eXl5NDV2cllDTVN2T292?=
 =?utf-8?B?QWRFbldMTUZjNnVUSHlSL3RuSm1UNWUvRVIxRWlaZkM3Y0dKT0YxSk1xd3Jz?=
 =?utf-8?B?WE1yQlhrck4yUUNKTVZRNlh4S3BJMUlaRlBRc1RBUG5IWlFFUkZBdnl5dVFF?=
 =?utf-8?B?UVB6MGJoOFJySExYVEtRZExTdmRHY0M5RGh2OEtrbTFsbWs3TjdERC8xeTZ3?=
 =?utf-8?B?QmZ6bGJrQSt1V1FhRjQ0RTNwVklEUG5WS1lCSXJzUDl6MUt1ckJpMHcyRlNy?=
 =?utf-8?B?Ry9FUkFhSGxXSVdrU29UMU1MbVdkQlRkdGZObnkyMTY1VkNzMnlzVFpZc1Zo?=
 =?utf-8?B?bVRWc1hVLzhiMSs5Vm92bWZqZVJnVk9aaXhTdXVpcWUyM2lEM0xVUWgyWU1k?=
 =?utf-8?B?a2dLUW54a3UxTmk0c2tMOVZLaXI1TTFkZHVoLzVQb0tVYURhNnlHVm9XL1hr?=
 =?utf-8?B?enBkQ3E4T3JNbEFaZjBIbmVJaE5OOWIyQnIvMGtBY2txSEY4UFF3WmxKbndI?=
 =?utf-8?B?V2NaMW40MTc2Q09qcDZScVpJcGhwM0dqejl5eE9YUEYwVk1CTlBRY0VlSFp4?=
 =?utf-8?B?bnJzVzF6clNIc1ZLYnJxK1c0ZlBiWTV4T0NoQ1A0UEpxRmo0QjI4Z3lPUzUz?=
 =?utf-8?B?RFdrTkNuYVNpa3VKUnd4Y0FEaVRsWVY5NWw4NjJwRlhMM3BvY05RV1JqZmpG?=
 =?utf-8?B?N1dsY1RLM0RFNjdkbktGV0JYRDkxc1F0MGhTeVRzOG5XT3dKSXhEUE8reEpL?=
 =?utf-8?B?ejhjSUNhMFFLOHNPajMraG13QjZIY3R2d1l5dDRqOGRjcnR0UDlOVlEwOHVv?=
 =?utf-8?B?UXFCZnZUNnFPMHB0YStESVpwQWtoZVNnWGpjL1BSTU0zd0pTYmFaLzZpRk5U?=
 =?utf-8?B?anpETU9sYVJ3N28xcXdNOElYSzBobTRPUWRPL05DWk0wamtmMVdEOTVKbFY4?=
 =?utf-8?B?NXQyZEwzY29qdDAyaDJBWjlqYlpHMTBXQ1Y3NTlBTVVxM0tUSkhrV0RlZFdZ?=
 =?utf-8?B?UTRRTVVwWjVLWVZmMFZOZnBJRlp2M1l6WThhZTU2Q1ZtN05PbUtGK3E2TmRy?=
 =?utf-8?B?NFg0NEVSQ3pQcVk2SXNmRWIrUlhMbGRVT05lVXR4RlhZell4Q0oyZDlXZFZS?=
 =?utf-8?B?c1hkNFBlQndRdk1lTldSeTlDVC9DYzhWNmo1WSs2Q1VHWlF4QkVpeE5xaXZY?=
 =?utf-8?B?MHRPdXAvM3JnTzJJelNhY0U0M29ZVlNHd3FFbklYYTFtcXBWSTRnYlh5OTkr?=
 =?utf-8?B?OUU2UjV3a0dnR3NJQi9KaDl0OGpiTE93QnVBN3daejFGejJLWE9kdmdFTFhn?=
 =?utf-8?B?SFpHRThvVllMR0hMWWRsbndMM000VTk2cFVUamduSXV4b0pqZjU1NXRUZS94?=
 =?utf-8?B?NnI3RnJDMVdpQ1ZmSGtVb1JBR0Y2b1RCb3JBbllQS3ZlRDhndU4zalYvZTBj?=
 =?utf-8?B?WDN4Q25MeTRCOG9tZm5kUmRHUXhjUzJ2U252ajJLL0x5OHJOTlFDbHVtK1Fo?=
 =?utf-8?B?eDVvWnMyNW9XRklCR1hLM1RxWU1aWFBUWFpCRCticVJ2UE9TN3Q0ek5JdHVQ?=
 =?utf-8?B?dmFwQ2RWRVJmWFU2UW1naVFMRnRpdmd2Z2x6UzZ2Ty8rSkV1elZmSzNCVGx0?=
 =?utf-8?B?MGhINVg4RUJHRkplWW52OFJEcm9QbWswZGhsMmRiaDhBUVh5WFlSKzh2R0pX?=
 =?utf-8?B?L3ZIajluT1VRQU83ZnF6VVhvT2FHMktCTHFDNFpGZTJ6MXVMSnFWWmx4NkR5?=
 =?utf-8?B?SXA3TXZPc0diZDlhZnpEQnhhUmNVUHJ2NVN4QjVPMURHZHo5cmMySVAzY2hy?=
 =?utf-8?Q?PD41vGbRrZEfKLIqJKXpI0SR/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e500b74-d815-4129-faeb-08ddaf686c3b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 19:35:18.5652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j38EQ2q0iPbNqNVaYhvKejNSlETYkICK96USSAsF/0C/2QIuMg4y87XMdawAhDewFq7Iuv46SskJfKi5oE0VeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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

On 2025-06-19 14:37, Francis, David wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
> > > + =C2=A0 =C2=A0 spin_lock(&filp->table_lock);
> > > + =C2=A0 =C2=A0 idr_for_each_entry(&filp->object_idr, gobj, id)
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_bos +=3D 1;
> > > + =C2=A0 =C2=A0 spin_unlock(&filp->table_lock);
> > > +
> > > + =C2=A0 =C2=A0 if (args->num_bos < num_bos) {
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args->num_bos =3D num_bos=
;
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;
> >=C2=A0
> > Since this path doesn't require any cleanup, you could just return. But=
 maybe this should return an error code to let user mode know that it shoul=
d retry with a bigger bucket allocation. -ENOSPC?
> >=C2=A0
>
> I wasn't sure if sending back information from an ioctl in the structs wh=
ile also returning an error value was acceptable. If it is, I'll make that =
change.
>
> > > + =C2=A0 =C2=A0 idr_for_each_entry(&filp->object_idr, gobj, id) {
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_bo *bo =3D =
gem_to_amdgpu_bo(gobj);
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_amdgpu_criu_bo=
_bucket *bo_bucket;
> > > +
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo_bucket =3D &bo_buckets=
[bo_index];
> > > +
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo_bucket->size =3D amdgp=
u_bo_size(bo);
> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo_bucket->alloc_flags =
=3D bo->flags & (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
> >=C2=A0
> > I'm not sure why you're removing this flag. I think we always set it im=
plicitly when creating a new BO (and presumably during restore), but there =
should be no harm in leaving this flag set anyway.
> >=C2=A0
>
> The driver doesn't like this flag being set on requests to create bo. Sin=
ce this is meant to be sending to the user the flags userspace will need to=
 recreate the bo, I thought to leave it off.


OK.


>
> >
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > >
> > > +#include "amdgpu_criu.h"
> > > +
> >=C2=A0
> > Why is this header file needed here? None of the new ioctls will be imp=
lemented in kfd_chardev.c.
>
> amdgpu_drv.c needs the header with the ioctl declarations for its ioctl d=
efinitions. Not sure if there's another way I should be including them.

Sorry. I put my comment in the wrong place. Yes, you need this header in am=
dgpu_drv.c. You were also including it in kfd_chardev.c. I don't think you =
need it there.


Regards,
=C2=A0 Felix


> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------
> *From:* Kuehling, Felix <Felix.Kuehling@amd.com>
> *Sent:* Wednesday, June 18, 2025 5:05 PM
> *To:* Francis, David <David.Francis@amd.com>; dri-devel@lists.freedesktop=
.org <dri-devel@lists.freedesktop.org>
> *Cc:* tvrtko.ursulin@igalia.com <tvrtko.ursulin@igalia.com>; Yat Sin, Dav=
id <David.YatSin@amd.com>; Freehill, Chris <Chris.Freehill@amd.com>; Koenig=
, Christian <Christian.Koenig@amd.com>; dcostantino@meta.com <dcostantino@m=
eta.com>; sruffell@meta.com <sruffell@meta.com>; simona@ffwll.ch <simona@ff=
wll.ch>; mripard@kernel.org <mripard@kernel.org>; tzimmermann@suse.de <tzim=
mermann@suse.de>
> *Subject:* Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
> =C2=A0
>
> On 2025-06-17 15:45, David Francis wrote:
> > Add new ioctl DRM_IOCTL_AMDGPU_CRIU_BO_INFO.
> >
> > This ioctl returns a list of bos with their handles, sizes,
> > and flags and domains.
> >
> > This ioctl is meant to be used during CRIU checkpoint and
> > provide information needed to reconstruct the bos
> > in CRIU restore.
> >
> > Signed-off-by: David Francis <David.Francis@amd.com>
> > ---
> >=C2=A0 drivers/gpu/drm/amd/amdgpu/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +-
> >=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 144 ++++++++++++++++++=
+++++
> >=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |=C2=A0 32 +++++
> >=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0 |=C2=A0=C2=A0 2 +
> >=C2=A0 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |=C2=A0=C2=A0 2 +
> >=C2=A0 include/uapi/drm/amdgpu_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +++++
> >=C2=A0 6 files changed, 209 insertions(+), 1 deletion(-)
> >=C2=A0 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> >=C2=A0 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/=
amdgpu/Makefile
> > index 87080c06e5fc..0863edcdd03f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> > +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> > @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o a=
mdgpu_kms.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_xgmi.o amdgpu_csa.o am=
dgpu_ras.o amdgpu_vm_cpu.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_vm_sdma.o amdgpu_disco=
very.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_umc.o smu_v11_0_i2c.o =
amdgpu_fru_eeprom.o amdgpu_rap.o \
> > -=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_fw_attestation.o amdgpu_securedisplay.=
o \
> > +=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_fw_attestation.o amdgpu_securedisplay.=
o amdgpu_criu.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_eeprom.o amdgpu_mca.o =
amdgpu_psp_ta.o amdgpu_lsdma.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_ring_mux.o amdgpu_xcp.=
o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_cper.o amdgpu_userq_fe=
nce.o amdgpu_eviction_fence.o
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_criu.c
> > new file mode 100644
> > index 000000000000..34a0358946b6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> > @@ -0,0 +1,144 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > +* Copyright 2025 Advanced Micro Devices, Inc.
> > +*
> > +* Permission is hereby granted, free of charge, to any person obtainin=
g a
> > +* copy of this software and associated documentation files (the "Softw=
are"),
> > +* to deal in the Software without restriction, including without limit=
ation
> > +* the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> > +* and/or sell copies of the Software, and to permit persons to whom th=
e
> > +* Software is furnished to do so, subject to the following conditions:
> > +*
> > +* The above copyright notice and this permission notice shall be inclu=
ded in
> > +* all copies or substantial portions of the Software.
> > +*
> > +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> > +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> > +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO EV=
ENT SHALL
> > +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGE=
S OR
> > +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
,
> > +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
> > +* OTHER DEALINGS IN THE SOFTWARE.
> > +*/
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/random.h>
> > +
> > +#include <drm/amdgpu_drm.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_file.h>
> > +
> > +#include "amdgpu_criu.h"
> > +
> > +#include <drm/amdgpu_drm.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_exec.h>
> > +#include <drm/drm_gem_ttm_helper.h>
> > +#include <drm/ttm/ttm_tt.h>
> > +#include <linux/interval_tree_generic.h>
> > +
> > +#include "amdgpu.h"
> > +#include "amdgpu_display.h"
> > +#include "amdgpu_dma_buf.h"
> > +#include "amdgpu_hmm.h"
> > +#include "amdgpu_xgmi.h"
>
> That's a lot of header files. Do you really need them all?
>
>
> > +
> > +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *ade=
v, uint64_t pte_flags)
>
> This function is never called.
>
>
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t gem_flags =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 //This function will be replaced by the mappi=
ng flags rework
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gem_flags |=3D AMDGPU_VM_PAGE_EXECUTABLE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_flags & AMDGPU_PTE_READABLE)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gem_flags |=3D AMDGPU_VM_PAGE_READABLE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_flags & AMDGPU_PTE_WRITEABLE)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gem_flags |=3D AMDGPU_VM_PAGE_WRITEABLE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gem_flags |=3D AMDGPU_VM_PAGE_PRT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (pte_flags & AMDGPU_PTE_NOALLOC)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gem_flags |=3D AMDGPU_VM_PAGE_NOALLOC;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 return gem_flags;
> > +}
> > +
> > +
> > +/**
> > + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer=
 objects
> > + *
> > + * @dev: drm device pointer
> > + * @data: drm_amdgpu_criu_bo_info_args
> > + * @filp: drm file pointer
> > + *
> > + * num_bos is set as an input to the size of the bo_buckets array.
> > + * num_bos is sent back as output as the number of bos in the process.
> > + * If that number is larger than the size of the array, the ioctl must
> > + * be retried.
> > + *
> > + * Returns:
> > + * 0 for success, -errno for errors.
> > + */
> > +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct drm_file *filp)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgpu_criu_bo_info_args *args =3D=
 data;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *gobj;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 int id, ret =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 int bo_index =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 int num_bos =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&filp->table_lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 idr_for_each_entry(&filp->object_idr, gobj, i=
d)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 num_bos +=3D 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&filp->table_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (args->num_bos < num_bos) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 args->num_bos =3D num_bos;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto exit;
>
> Since this path doesn't require any cleanup, you could just return. But m=
aybe this should return an error code to let user mode know that it should =
retry with a bigger bucket allocation. -ENOSPC?
>
>
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0 args->num_bos =3D num_bos;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (num_bos =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto exit;
>
> Just return. 0 (success) seems fine here.
>
>
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_=
buckets), GFP_KERNEL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (!bo_buckets) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D -ENOMEM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto free_buckets;
>
> Just return -ENOMEM.
>
>
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&filp->table_lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 idr_for_each_entry(&filp->object_idr, gobj, i=
d) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_bucket =3D &bo_buckets[bo_index];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_bucket->size =3D amdgpu_bo_size(bo);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_bucket->alloc_flags =3D bo->flags & (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON=
_RELEASE);
>
> I'm not sure why you're removing this flag. I think we always set it impl=
icitly when creating a new BO (and presumably during restore), but there sh=
ould be no harm in leaving this flag set anyway.
>
>
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_bucket->preferred_domains =3D bo->preferred_domains;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_bucket->gem_handle =3D id;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (bo->tbo.base.import_attach)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo_bucket->flags |=3D A=
MDGPU_CRIU_BO_FLAG_IS_IMPORT;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bo_index +=3D 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&filp->table_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D copy_to_user((void __user *)args->bo_=
buckets, bo_buckets, num_bos * sizeof(*bo_buckets));
> > +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pr_debug("Failed to copy BO information to user\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D -EFAULT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +free_buckets:
> > +=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(bo_buckets);
> > +exit:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > +}
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_criu.h
> > new file mode 100644
> > index 000000000000..1b18ffee6587
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > +* Copyright 2025 Advanced Micro Devices, Inc.
> > +*
> > +* Permission is hereby granted, free of charge, to any person obtainin=
g a
> > +* copy of this software and associated documentation files (the "Softw=
are"),
> > +* to deal in the Software without restriction, including without limit=
ation
> > +* the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> > +* and/or sell copies of the Software, and to permit persons to whom th=
e
> > +* Software is furnished to do so, subject to the following conditions:
> > +*
> > +* The above copyright notice and this permission notice shall be inclu=
ded in
> > +* all copies or substantial portions of the Software.
> > +*
> > +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> > +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> > +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO EV=
ENT SHALL
> > +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGE=
S OR
> > +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
,
> > +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
> > +* OTHER DEALINGS IN THE SOFTWARE.
> > +*/
> > +
> > +#ifndef __AMDGPU_CRIU_H__
> > +#define __AMDGPU_CRIU_H__
> > +
> > +#include <drm/amdgpu_drm.h>
>
> Why is this needed here? You're not using any uapi definitions below.
>
>
> > +
> > +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 struct drm_file *filp);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index 4db92e0a60da..bf33567bb166 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -53,6 +53,7 @@
> >=C2=A0 #include "amdgpu_xgmi.h"
> >=C2=A0 #include "amdgpu_userq.h"
> >=C2=A0 #include "amdgpu_userq_fence.h"
> > +#include "amdgpu_criu.h"
> >=C2=A0 #include "../amdxcp/amdgpu_xcp_drv.h"
> >=C2=A0
> >=C2=A0 /*
> > @@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =
=3D {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF_DRV(AMDGPU_USER=
Q, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF_DRV(AMDGPU_USER=
Q_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF_DRV(AMDGPU_USER=
Q_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> > +=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu=
_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> >=C2=A0 };
> >=C2=A0
> >=C2=A0 static const struct drm_driver amdgpu_kms_driver =3D {
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_chardev.c
> > index a2149afa5803..a8cf2d4580cc 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -45,6 +45,8 @@
> >=C2=A0 #include "amdgpu_dma_buf.h"
> >=C2=A0 #include "kfd_debug.h"
> >=C2=A0
> > +#include "amdgpu_criu.h"
> > +
>
> Why is this header file needed here? None of the new ioctls will be imple=
mented in kfd_chardev.c.
>
> Regards,
> =C2=A0 Felix
>
>
> >=C2=A0 static long kfd_ioctl(struct file *, unsigned int, unsigned long)=
;
> >=C2=A0 static int kfd_open(struct inode *, struct file *);
> >=C2=A0 static int kfd_release(struct inode *, struct file *);
> > diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_dr=
m.h
> > index 45c4fa13499c..1508c55ff92a 100644
> > --- a/include/uapi/drm/amdgpu_drm.h
> > +++ b/include/uapi/drm/amdgpu_drm.h
> > @@ -57,6 +57,7 @@ extern "C" {
> >=C2=A0 #define DRM_AMDGPU_USERQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x16
> >=C2=A0 #define DRM_AMDGPU_USERQ_SIGNAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x17
> >=C2=A0 #define DRM_AMDGPU_USERQ_WAIT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x18
> > +#define DRM_AMDGPU_CRIU_BO_INFO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x19
> >=C2=A0
> >=C2=A0 #define DRM_IOCTL_AMDGPU_GEM_CREATE=C2=A0 DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
> >=C2=A0 #define DRM_IOCTL_AMDGPU_GEM_MMAP=C2=A0=C2=A0=C2=A0 DRM_IOWR(DRM_=
COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> > @@ -77,6 +78,7 @@ extern "C" {
> >=C2=A0 #define DRM_IOCTL_AMDGPU_USERQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
> >=C2=A0 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct=
 drm_amdgpu_userq_signal)
> >=C2=A0 #define DRM_IOCTL_AMDGPU_USERQ_WAIT=C2=A0 DRM_IOWR(DRM_COMMAND_BA=
SE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> > +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_a=
mdgpu_criu_bo_info_args)
> >=C2=A0
> >=C2=A0 /**
> >=C2=A0=C2=A0 * DOC: memory domains
> > @@ -1626,6 +1628,32 @@ struct drm_color_ctm_3x4 {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 matrix[12];
> >=C2=A0 };
> >=C2=A0
> > +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (1 << 0)
> > +
> > +struct drm_amdgpu_criu_bo_info_args {
> > +=C2=A0=C2=A0=C2=A0 /* IN: Size of bo_buckets buffer. OUT: Number of bo=
s in process (if larger than size of buffer, must retry) */
> > +=C2=A0=C2=A0=C2=A0 __u32=C2=A0=C2=A0 num_bos;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* User pointer to array of drm_amdgpu_criu_bo_buck=
et */
> > +=C2=A0=C2=A0=C2=A0 __u64=C2=A0=C2=A0 bo_buckets;
> > +};
> > +
> > +struct drm_amdgpu_criu_bo_bucket {
> > +=C2=A0=C2=A0=C2=A0 /* Size of bo */
> > +=C2=A0=C2=A0=C2=A0 __u64 size;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* GEM_CREATE flags for re-creation of buffer */
> > +=C2=A0=C2=A0=C2=A0 __u64 alloc_flags;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Pending how to handle this; provides information=
 needed to remake the buffer on restore */
> > +=C2=A0=C2=A0=C2=A0 __u32 preferred_domains;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Currently just one flag: IS_IMPORT */
> > +=C2=A0=C2=A0=C2=A0 __u32 flags;
> > +
> > +=C2=A0=C2=A0=C2=A0 __u32 gem_handle;
> > +};
> > +
> >=C2=A0 #if defined(__cplusplus)
> >=C2=A0 }
> >=C2=A0 #endif
