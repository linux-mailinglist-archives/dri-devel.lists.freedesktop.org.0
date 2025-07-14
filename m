Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE9B03AB5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C91F10E43B;
	Mon, 14 Jul 2025 09:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PZ7UaZ42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E34B10E438;
 Mon, 14 Jul 2025 09:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQnMjUo4FTnpZyMpqIMvSS8kNgQ9UI3rbPEZlgnsnb0T035RnpMcQko9HoS5pExG/Sdhn2WL1EZn1Px0E1Y4wbes+PpdPx3MHfMVX9FSb7eIjj/Mm05wp5pwArAV9oOeej+4eJrTH8XQQLTUp8fmZFnzsYTMnJEnakY/TcXrGXYNmrMT9NpgcdbFVoESxRdRKGBigyvF95GxqFXEjH8jTFQNH9H5zWEa+s9sWlsGR1kNeLKwjUxZA0465ZAfVMOfVLP35jrLTTKKjBYryh3ktKeZMECm7Hc+gqAw7DGMU2eJQozTTTUDo8Dqq+LA/jELGWSZyOrwHU9wozx4CXYdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3U1SyA6sNKiJyaopN2+zglpbqIi7VKicB+kpAk/3ZA=;
 b=P4Zwajzbklqg0XFGOpNPY1oKq/bqjo6rpz2mD2fXCo/59fOu0c5aXT16UNJPUk30YomD+W9VIQt7U6p+s00UP5Ij/dFQtDetOGXxZmuORpyCN1pcgzKUFD/doeGT1s5NeOIeBaE5lMkhpgQ/yt98OeK2b2eofgiyzd3F+uGKIzwDzhqlEpAtyUrnKVxNKKJd8ZBmIqIBbQmllLqKq9B/bxRgYpeNIxssHyE5fZBawPWB3aIGtmfLNixSEgtCe8zOCjr7tvnMHRm9NsmKhUy3s/iGWF5XJRRSACbLl46AnctU/VyLgNGPUyYfN2+aGnWW3WZsfDd7p2u2rYrhBrHKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3U1SyA6sNKiJyaopN2+zglpbqIi7VKicB+kpAk/3ZA=;
 b=PZ7UaZ42FXDodijq6iF5/J3vldfh7v7GW0CZmrK8I+CFanNtk2qEqRvzXXXWOwdeYjLQcF+VL/gUyvVViRdkzGvVQAzNEGJLLOWFJh7OR4v0OTX6ZWHLnpE9UIEvnLCGcSkpM0CEAOhnMRb6kedV3wb4FpdRib0RGcrOAIUajGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Mon, 14 Jul
 2025 09:23:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 09:23:40 +0000
Message-ID: <2818cf80-4dac-4628-9079-2dd6311b48ae@amd.com>
Date: Mon, 14 Jul 2025 11:23:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, phasta@kernel.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
 <2347cd33-5289-4e6f-8296-b34bc05eff8b@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2347cd33-5289-4e6f-8296-b34bc05eff8b@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:207:3c::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 140b17af-edb9-4c5e-67e5-08ddc2b81edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlduMHl6Q3d6akMwcXBaUmxqazVEVTh1cGwrZ04yUndySm5McHJFSjRsM29Q?=
 =?utf-8?B?TTcvSEc2UC96L29hYkpYRHdpZmw5NnA0SHlGTm1BSHhuVmtiSWhWdG1PY042?=
 =?utf-8?B?cXhEK3RGeE9BcXVxUHg1bkxnSU10S3ZaUWNKck9OVktyb0VMc216T1BvUGF6?=
 =?utf-8?B?dCtRQ0Q4WXgySzBZWGtGUnZWd2lsUjZObCtXaFppQWtGRHpxY3B6ZFgwbmlN?=
 =?utf-8?B?TVdUdUdaMEhVSlp0SUtIOGUzeUVPeUJRWm54NnlDb0VueUtyemtRWXVoeWdG?=
 =?utf-8?B?SmJsek94c0FwTllTVWY0U2lMWENEeW5nakVXeDRabWxjYTlPaUNMYTZXRWUz?=
 =?utf-8?B?NTNGUWg0K282QXByT3FIajJMRlYybGJZMFNmZmsxQ0N5RkY0ZFcyL1kwdHp0?=
 =?utf-8?B?a2trTi9zRzJNVWFaaHVQYTlmamJ3NG12cDkrMGpDY3g3aFlsT3hJQmdRNzlx?=
 =?utf-8?B?THFucnNQdTNCRWZTVFZiZUowQVpPSTdoNUlJbTBUTk5wbUdRRTZRR2FERzQ1?=
 =?utf-8?B?SmlvZmN0Yis4cER2SjhWRStzTXZIUURHRDN6c1dpeWpNZTNyazZqRGtIeldS?=
 =?utf-8?B?UWJTK1V2M0diOW9QR0cxZjBMdXhmdmxNempBWm9GS0ZDN2p4Qm9pRkJnQU16?=
 =?utf-8?B?L0wzRXEwTWNaV3g5TkNnbCswMDBMUW9aNDdGTHNWYkM1MzQrLytSYzBLYmN1?=
 =?utf-8?B?TjRqVVYxQnJUR1Q0Y3dESkZ2NWpPUnlPck1EZFNXQnorN2dwaGlzeE92QmNt?=
 =?utf-8?B?dGVkOWFHUkk1b1NSWndOVTVrbjRtSXhoNXhuU2swdDd3ZFFUTnBnZ2F4b3VQ?=
 =?utf-8?B?SEhhWDhzcUZ5bWVlc1crNi9lU3BEdGVqeGh4dFlWWFU4QmN6Y1F1dHo3USti?=
 =?utf-8?B?RHJEdTVLc2ZUcTBoZ2txNEJXa0c4WUZZVDJDRjhWYkdlamQyOGxnSlRRQ1p2?=
 =?utf-8?B?cTI2QmdPa2doMGtIYkdXVDhDdFdYNnppTnBJbXhTZVZIMWFpdDFtR0Y3eUxl?=
 =?utf-8?B?R2hOYnNLRzlGRnpyS1E3MjhCVC9scmlCcTlmb01CWEptSGpHYVlzak5HZ2xy?=
 =?utf-8?B?aGM2UktPV3J4M0xGMkt1U2pLZERTQzRtdzlmaGpTNU52aFd1ODFRSVFMb290?=
 =?utf-8?B?QmI3dkNlSzR1bVZrZVFsQVZVVllMc0ZTd3E2VFhXekxyMWFxWUtQSE50M2E0?=
 =?utf-8?B?Ym12RFdEQUxFVS9xaE55RERrZWtTUFU0UmcvZFBWUzM5VVZyaXMySWR3d0tx?=
 =?utf-8?B?MlZLUXlRUllDV1lCZ1g5b0w2MmhvNmNNREVxbHVoMGpYL2crdkpSendDbGd4?=
 =?utf-8?B?ZVRMSkRlZThXVWNyNmp4UFZCTmtSNGN6RFBOa1dDcXNlT3R5djB4d3JQdExi?=
 =?utf-8?B?N2NRVzQxREVzVmdjSWRKWTU3dlhVeWQwbUt5MUdmdVpQVFBMSjR3SmVqdjZR?=
 =?utf-8?B?ckNTUDlES3k3RGxNRG5KcCtwT1VNdWU4SnNWVUUrOTJ2Tmd2V003VEtBci92?=
 =?utf-8?B?QTUyY1IyWkZEd0p6Lzd6eHUwQzJDUHNvdldQMG1RZFh6VC80Q1hsMGcyT2Jw?=
 =?utf-8?B?L3FLb3ZEK29sTG1VYUVVZm44SEpZUFdhUmJpZ3pWUWthNGRScS9YT244YWJP?=
 =?utf-8?B?dmdzR2JyNG5qeEpMcjlEM1dzemFUQVgzQ3FYYXk1VEtmNWJVWWQ3RUtCTlhL?=
 =?utf-8?B?Mkk2eHdYL1M1bTY4bTVaQS90K1hhYXlwYnh5M01raG5ldGxKdTI3eWx6aTFT?=
 =?utf-8?B?RzJjOTBsNDRyVXIvT0tpTkRLVHIrM0dXUTlnQWozM3BYbmdDOUR0ODUyV3lt?=
 =?utf-8?B?NVlFb2wrQnFhT1FFOHdYRnNmenIwdVRsVExrbmxqWkpaOWorM1hKZUJzRWl2?=
 =?utf-8?B?VXhhRGI2Y1B4N1JmSXJEaFFrdkovQmhsU04ydVVvTmVuVlY4c0NnQS9WNkJo?=
 =?utf-8?B?ZGNIaVIwOHVoUkRoZXdteXJlamwwelVjNVZ3Z1RBU0poNllOQU0vTUtQWHhv?=
 =?utf-8?B?RWFwREFoVzhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNOR01zT01aM3ZJUm95Z1lzMlVlbEJpTDBFRzhpcnNweldnM3dFMGMvdVJn?=
 =?utf-8?B?d2UvbEswOWZrYnJtbWozZ0tDNkdacTR0M2JKZWh5L0Z2d2hZNGpJcjNLdzBQ?=
 =?utf-8?B?MVBWNjBIM2N1UHh5ZEVDcDJJeVRzUXJjNnJOTG1GOVd3aGszNnhwQlVmKzNk?=
 =?utf-8?B?V21OVmlTQjVPOGhCNUFNL21YZW5nY05ZaVFJWDN6c3pDUmd3eDBmTW45djRZ?=
 =?utf-8?B?STd3YVBlemF2b3hLR3V3aUovM2tFK0VZNUdRVy8zWGZxRVdMb0NhRUd5Vzg4?=
 =?utf-8?B?OWRtSm94TUlzS3RXZXI3OEFhZ2pJb0ZBYVp3THcvRTBvOUQvUHNwZkhhNUxo?=
 =?utf-8?B?L0F2ODJEYXlSR1o0K0NTYXdzTzFsczQxdi9XaWFrNW8vek5UNGdaY2wvcnQ2?=
 =?utf-8?B?blBLM3hyV0ZpRURoWVc2Y0kyV0I2UHREWW85M3k3ZkFZSUFtOHhtOUNicXRT?=
 =?utf-8?B?TFBtNHUrUTBsZk9XNmhMMGZBN3ZSSmpsU01DZzVGYk1WcHlPOUVDT1JrMGNq?=
 =?utf-8?B?QkRnUWJJN0h3d0o0TmFlOWdjVDlYL3dGN1ZkMXR5SlNTQ21lb0NQMWxqTFdz?=
 =?utf-8?B?NklxM3plQ1VrcXhYN0RpRUw0d3drRGlnZFlEYWpXeGFFeExyOGM2SFhwOXBN?=
 =?utf-8?B?SzJXYlg0SjZLU200TEZUdFM5ZEp3U3UybnJERGxyTFBtSDVrSFEvQXgvQ1hm?=
 =?utf-8?B?bDZKUjNWZXY2a2wvRVNsUDlkYVVram1FeHFpL0pFbm1iY1FCTWdJTGxGQXFJ?=
 =?utf-8?B?SWMxN3lyaHZHU3pZUnYzSzZmTVJMZ3hvZ2FxWWRWQ1ZrUjFGR29tMFVVbW50?=
 =?utf-8?B?dSttUEE5RkdraW04THR5UUEvRWdPRHEvYkRpNHdrdXRYTEVYd3d1VlNpaXJj?=
 =?utf-8?B?eFRyUkRQTU8rcXM5SkI0ZzFEL1V5R1RqTm9QSGRoQmsvRk43eW9DYm5oak5z?=
 =?utf-8?B?OXhQR0lCTkptdkU4MVRVYzR2YmM3SDFLdVRXZ0pJZm1IS2k4K1ZBVWlLd0RM?=
 =?utf-8?B?d0NjMnlPVm14dE96dzFPY1lOcUl1NXJQQnBxQzhBSnhFQ0NiYUlZMXhRY05r?=
 =?utf-8?B?aTRPMS9icitKRGdBT2lER2VIdThTS2FIRmtyUDBxdGVLVGE1U3o2QjlIK055?=
 =?utf-8?B?Y0FNMDE3WHllUmIvbll1dldXQjFBTlpib1loWHhnMEl5TE1pRGhmTS9JU0xR?=
 =?utf-8?B?MGhkd245K3M3alhqTWkvWUloVW1mclNvcDYvU3J2RXRLdHNjK1NvWlE5bEc2?=
 =?utf-8?B?VHhrS1FGcGFSK2NoN2FRMVBZRHlSQ1dnSmhqVUlkWCtxS1JTaHhQU3AyeWFn?=
 =?utf-8?B?dTV5VDdKcVEzWEF1UVUrV0M5NFlxSTJnU0dyZVMvd0t6Q3poZlpRQUd4WTZv?=
 =?utf-8?B?aWlzMU1ZK0NGaFZLOVkvelJWRlBCTVE5Ly9xeXV3M1RGcXIzcDVYQ2hNRStF?=
 =?utf-8?B?bERVdWVuenZlK1JQU2h3bklCeFljYlZYS3FzNi9uU3VNVkNudDJTcUo5ZU5D?=
 =?utf-8?B?VTZmUC9ORHdFREFGYkRJMzNqdjhOV0NPVnFKQWwrUEdZYlFST1p1TFZLKzBa?=
 =?utf-8?B?SitPeUhEWHFkNlZrWnQ1WjVGSXlBQUQ0TzNIM1dQY1dwVXJPcFRVYXE1cVh0?=
 =?utf-8?B?ZkNmU1ByRGpyYVNvZUlrZ2ZiVHNtU2dvbDRqNGhQTXBnMDJRMGkzdklyaTVI?=
 =?utf-8?B?b1NnTWZHMVhXcXM2NU9EcFcyRk5GRU0wUmdGb0h5VDhKUFJxRVR6R1JVWDY5?=
 =?utf-8?B?bk5wTWNGclRJSUJWdXZPV0gvSzFOaDZlMm9CRUg5dGJHWFRLcmtEZnVnZyta?=
 =?utf-8?B?S293WC9aQnFvUWx4K1YwdUMvOVVoeGV1Q293eUdLenRycjFSb1J2aHFEZUYr?=
 =?utf-8?B?RTA5SmMydU1kT1RhNk1NN3dvQ1pCZVhheFh1bVpxV29NbVRSbU9VSjlsejJ6?=
 =?utf-8?B?QWRTbEhWYVdKckVjUHp4UzdpT2V0U25sT0NGOVR6YUdHbUZqQVFIcWlhM2tn?=
 =?utf-8?B?ZWwzazBTTFo2by9adWFWOTdkT1N6cTdUeklUL3hmczNpa04wMGlneDU0VmtO?=
 =?utf-8?B?Z3UwWGJyZzZmOEh1RjF6MG1PZkpMNHhqdW5aTG5iT2thVzU0Qm9PWmgralND?=
 =?utf-8?Q?jzmymIJQzzStml8sKExNY3thu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140b17af-edb9-4c5e-67e5-08ddc2b81edf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:23:40.6693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/1CrBOAHbvqEDR+OE0EVpfNdo8dYPvk1bTASYu9eGK7U3j87cQpHzOE0ITiMffA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583
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

On 13.07.25 21:03, Maíra Canal wrote:
> Hi Christian,
> 
> On 11/07/25 12:20, Christian König wrote:
>> On 11.07.25 15:37, Philipp Stanner wrote:
>>> On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
>>>>
>>>>
>>>> On 08.07.25 15:25, Maíra Canal wrote:
>>>>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>>>>> instead, a job just took unusually long (longer than the timeout) but is
>>>>> still running, and there is, thus, no reason to reset the hardware. This
>>>>> can occur in two scenarios:
>>>>>
>>>>>    1. The job is taking longer than the timeout, but the driver determined
>>>>>       through a GPU-specific mechanism that the hardware is still making
>>>>>       progress. Hence, the driver would like the scheduler to skip the
>>>>>       timeout and treat the job as still pending from then onward. This
>>>>>       happens in v3d, Etnaviv, and Xe.
>>>>>    2. Timeout has fired before the free-job worker. Consequently, the
>>>>>       scheduler calls `sched->ops->timedout_job()` for a job that isn't
>>>>>       timed out.
>>>>>
>>>>> These two scenarios are problematic because the job was removed from the
>>>>> `sched->pending_list` before calling `sched->ops->timedout_job()`, which
>>>>> means that when the job finishes, it won't be freed by the scheduler
>>>>> though `sched->ops->free_job()` - leading to a memory leak.
>>>>
>>>> Yeah, that is unfortunately intentional.
>>>>
>>>>> To solve these problems, create a new `drm_gpu_sched_stat`, called
>>>>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset. The
>>>>> new status will indicate that the job must be reinserted into
>>>>> `sched->pending_list`, and the hardware / driver will still complete that
>>>>> job.
>>>>
>>>> Well long story short we have already tried this and the whole approach doesn't work correctly in all cases. See the git history around how we used to destroy the jobs.
>>>>
>>>> The basic problem is that you can always race between timing out and Signaling/destroying the job. This is the long lasting job lifetime issue we already discussed more than once.
>>>
>>> The scheduler destroys the job, through free_job().
>>> I think we have agreed that for now the scheduler is the party
>>> responsible for the job lifetime.
>>
>> That's what I strongly disagree on. The job is just a state bag between the submission and scheduling state of a submission.
>>
>> For the scheduler the control starts when it is pushed into the entity and ends when run_job is called.
>>
>> The real representation of the submission is the scheduler fence and that object has a perfectly defined lifetime, state and error handling.
>>
>>>>
>>>> If you want to fix this I think the correct approach is to completely drop tracking jobs in the scheduler at all.
>>>
>>> I don't see how this series introduces a problem?
>>>
>>> The fact is that drivers are abusing the API by just firing jobs back
>>> into the scheduler's job list. This series legalizes the abuse by
>>> providing scheduler functionality for that.
>>>
>>> IOW, the series improves the situation but does not add a *new*
>>> problem. Even less so as driver's aren't forced to use the new status
>>> code, but can continue having job completion race with timeout
>>> handlers.
>>
>> Maybe yes, but I'm really not sure about it.
>>
>> Take a look at the git history or job destruction, we already had exactly that approach, removed it and said that leaking memory is at least better than an use after free issue.
>>
> 
> If the job was removed from the pending list in the beginning of the
> timeout and drm_sched_get_finished_job() fetches jobs from the pending
> list, how can we end up with an use-after-free issue?

By adding it back into the list after the timeout handling completed.

We had exactly that before we came up with the horrible design to add it back to the pending list in drm_sched_stop() and the free_guilty flag.

Could be that your approach now works better, but I'm really not sure about that.

Regards,
Christian.

> 
> Best Regards,
> - Maíra
> 

