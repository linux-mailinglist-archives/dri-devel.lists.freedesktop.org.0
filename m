Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CDAF893C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BCE10E93F;
	Fri,  4 Jul 2025 07:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZTUA9D9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC95010E93C;
 Fri,  4 Jul 2025 07:25:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7gQJM3NEoVWlUG4gUQx2Ej2swD7J6pFhHf+MrmZrDtj2qIjCVc/zT4sZ+Y+1d0Gu7Ygl0oYWO6DhGaZaEP/N4d9m529I5xUSK9JmaJlNW1a9/LNN9eGcPG3b/7Gbs/9ALOey2Wt5v3Z8rjz2YacegqgBlakUOmlB2e16/N4S79gkYvhkcCRkkOe+bruBpeBTEk4YLzRUDg9BGAPfx1BZ+Yh7kZ2af5mdZ4pICQzLEfmLWl0BYd8nEGqpUtjngXs/BvU97a0DYz7FfwAgP7OziYRmZrXhqhrnIrStDZohynUWRzYjv5OpSRl6xESV1OWyVwGnZUonAyQRiuxLNiKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQlo3CTjcV3orX5xM+Tetxx736KWT65mAp5QFkYqMB8=;
 b=SFlaD8QDWpcF9GLqf6GAVKOOzdsI6dOqbb/hsTb0uDl3chDaYkLm40kqz0CKPPuWp7T/1dHsJSL7e3wjdnAYnr+M1ktH64NFYp38k5vDf/XSpo4nJ4ZbEZuzkaJkx6FEunLkTK6T6vX0pBz1hImZCoQNwnnBdnv/h2AxxGps8p3uJbdEHF+sjAe5ouTB8cvW2UwtUjUMeGlGoz2VRk3y7xYMkyYPtNYZZ2l61tnZrLJoSsLmimMugh6NL9BUgwVf5lqqHzcN74QADYy1Y8vwNx2zM+AihBKz66s4dmgkS2QE1HdkIyCzNAjMsE0AIQuxizpGt5Qj9B9c2ISGtMcaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQlo3CTjcV3orX5xM+Tetxx736KWT65mAp5QFkYqMB8=;
 b=ZTUA9D9d+V807tRa5uXFeDngDbKhSu8KXFBy4fN3YfDf1ncSLT6KxnDwpbmCHNTB8yvWz4TpHVlaa/b+NZ26zJjpcgwVXSsHoK9j3txftovVLvKwS2bEV6Aul6znoO1l0S9ys8YHcMn/9ktD5RfzuXnaU3tavrTZAe4szYO1uvhpJ0ifXiV8VmuAFPtg8O1M8+15bLNFH8l3PUc1t7K2ait7nHMfayF2kOkjdvTcC1JoCbh/vt8S0LvmGsl1pztQkFEnRZQVZTN+L61aGH6b4tM7QLGAjDIrp5zqOkMS+1vqKz2UOgLqYAgLpMtmrI3dGjNt321qZkkmyifJzbh5hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:25:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:25:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 00/18] gpu: nova-core: register!() macro improvements
Date: Fri, 04 Jul 2025 16:25:01 +0900
Message-Id: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2BZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3bz8skTdotT0Yl0jk5SUlNQ007SkRGMloPqCotS0zAqwWdGxtbU
 Az+C2T1sAAAA=
X-Change-ID: 20250703-nova-regs-24dddef5fba3
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6b8fc1-8dc9-4668-5db4-08ddbacbefbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlFHeTNGNHhWM0pMTTJjYnI4QXQ4K1Rvbjh5eXlBQ2lmOHhjVDcweURUVWpB?=
 =?utf-8?B?M2xLV092TDZpb09ieFFScHNQM0RXcU9RRG1VQmJyKzluUXJ3OThBTGUxUldI?=
 =?utf-8?B?d01zMGx5RytwdktVVFgxOHI0YWRmdlhaYUw1SDR6ekxvak5qZnllMjBaTGlF?=
 =?utf-8?B?MWJ4dENLbERiVTJhWXJqZ1JLNnkvazQrYXVFK0dMazVqSkJhdThicWZXdFlj?=
 =?utf-8?B?UEVEUHpoUVdUdXo0d2pxZDZlK1NFTE03OWluWkF4QWxpd2d5Q3diZ1I0b05h?=
 =?utf-8?B?M0N2SEhPdW5vcG4xUjVRQ2Z1UzlSVHRxOGVPVENLVS9lblUzZ3hLQlppWktM?=
 =?utf-8?B?WHJ6ZVNPSENOeUwxSTU1U3JuRUp4YmUwZ0xxSlkzamxMbzJ4WXk5TXF4UEZw?=
 =?utf-8?B?WkFjNlhNcDR3QXdJeXA3VGhJdGQzWnppdzV5V0gxbjRPclNwQXJUTTJWeSs2?=
 =?utf-8?B?bThRWHYxNWpUeWxnNm1UUmlEQW5uMFVUKzgrVjdLcEVWdEcrb2NLZ2xpYnBX?=
 =?utf-8?B?RXVxaHBaRy92QkgwQ3hDelEranBZeXEvb29DWkwrWUhVVzdzci9QNzk4NlBn?=
 =?utf-8?B?ampFMnpyZmZrc3ZBemxDWDMzSHJLYlRJOGcvUWZqWTFSSnpxdEFzWGVuc0hT?=
 =?utf-8?B?VGs0Rkgva1JRbjYzNmo1OTVKekVMQm5HemtZY1JLdmNTbjVSSmR3dmlWQmhH?=
 =?utf-8?B?WjlIc0VKYVZVdjc5WWdvdU9uSmFPdFFRcTI0RGFQVWJZQ0swZ3kzR1RIL2dr?=
 =?utf-8?B?aG5IWU80aklCQTJjUm1PMFk2M0w3cUU3VTV6QUFYT0JodjJxNklWWDdlWjFW?=
 =?utf-8?B?Y2xPQTVOMzBhNkIxOFRMWk1EZlhGUStKWG53MnNMVTNpSGdRK3hVZGc1Q01m?=
 =?utf-8?B?SExrSXRwNUEzT0d3Q2gwMnc2NkpKeTZRZGVMUlJCS0F5S2xuOHNFTTZIWktx?=
 =?utf-8?B?NEhEd2s4YUNyYkViT0NUS0JGZlE3NzBJSEFWd1FMZU9MYUl2V1JzZ0RGK1BS?=
 =?utf-8?B?Zm1uQXFJZUpjMVd4MjBVUVhjd2VxQlNDQzFYb3FTUVcyZ1lORkY0ZFdkc2lh?=
 =?utf-8?B?SzJUWmh5cldaUlhNSkk1ZVZNQzM5ZTBTNFE4dFJqWlpsenlaSmRpN2VMaVFJ?=
 =?utf-8?B?Q2tObFRFcHNSa3ZFUFBTMVFUZi9ackJLY1lLMTBwUVhqTldQNEZBUjA0Vjg3?=
 =?utf-8?B?d0ZkbzZETjhpcnppWDlJWThCUVFiSFlCQ1FDUjBsVFlnOFhmeGloYm1iYVVT?=
 =?utf-8?B?SkFWYWFnUEdBcm4vWUFPYXAvKzJXUUxVaXd1YTVzQ1MvQUI1Q3JQcE5XYyt4?=
 =?utf-8?B?b05VU3dhdHczZFpLZnFwMnduOTEvYkZ0QjFyVmhpRGdjVlRRWUk2K2FwQ0Yx?=
 =?utf-8?B?M0dUQlhGNGVDeDFMbGRUYlc1a2FRLzZDMGkzZmFPbnY4M3pBKzdBNlFUYkk0?=
 =?utf-8?B?KzBucmt5TkJ4Wk1KUDB3UWNaNzI3dkVSaTJXNmFOcVNXRFg0emw1QlVWRVhQ?=
 =?utf-8?B?TmJCS2JHTHM3VVpDY3YvVDJLN1NpREt2RFEwSUpYcCtUN0xVWERRZlNCTTdK?=
 =?utf-8?B?VVVsUHZpdkpnb1Z3czZielNKMURieUhLTmgrakV5UG10b0dTQlViRXBINVhl?=
 =?utf-8?B?VXRoTFdvc1U0bFRGbVNQZU5GTmxGNUoyNDZVZHBkZjBtYVBPeU9sLzJlbUN5?=
 =?utf-8?B?aWlwazV2clJJY0VVZG5qNjlMM3RaYndWaDRINi9wdGxITVhRSTBma3dRVjNG?=
 =?utf-8?B?MytoK2N3SnpMT2Q4c3lEUCsvWTZacVBSNzR2TkQ0V1Y2N3lLMWorWWZVOU5Q?=
 =?utf-8?B?aGo4SUYvb3NsVFFZQTFNaFFRRDRtcHFsTGNrZXJVOVFISTF3dWpRdHZlZ0xa?=
 =?utf-8?B?dXFpUlBCYURPVUp5bHRkZWJtZXRac2NrQ2xFTTFsMXBWQ0RxU2hsOFJUb3dm?=
 =?utf-8?Q?Y7xLwSg36O0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1HVmcrSzlvSmhUVEl3MzArazJJQ1B5cnZabFFpSjlaZ2hmbDRXZFE2TFlH?=
 =?utf-8?B?dXdmVnNqYjdrL1Q5YlFqTVhDVVIzbFljT01kV21aYzd6TDFjN3A0bld4MmxB?=
 =?utf-8?B?N25vVzBIWGU2dW9QcHVwRXc5ZVhOeFRzWlFuelZpblhUbmN5V1RrOUs3N2Ix?=
 =?utf-8?B?Sjh2MmhjTmRHR1ZsbVV5ZERNbWJNY1pxdFdlVGlrNWdWU0FUWFZnWXByWVFS?=
 =?utf-8?B?b0wyTjV3VjhwSk5sTmNDMmtVVEhOeVRtSkdFUGt2YngvSkFzM29hRXUvQjND?=
 =?utf-8?B?MXpzb05rMFF2aUdwRmRPYVNvWTVudWRnVHZNakd4SHhuekNiVDMxNWNkTWYw?=
 =?utf-8?B?ZXdiRjY1TTJ5SGh4L3lLOWNlai95Mlh4emhKM1BSZ2NiK0QzbGVsa081Y05X?=
 =?utf-8?B?TXBNQkVsMjdhL1drMDYwbkVVYUtNOHhTdHF3Mk9XSTZFdnc3RHY4Y1RuN3A3?=
 =?utf-8?B?S3o1TGZ6UFhueU9CSVR1Sng4UHhKWmhhWE5taVIxQTZCNVNCZkd2U3A4ZU9J?=
 =?utf-8?B?ems2dkJHL0JuWDl3STBHVy9KTlB0SEpOeGQvMnAvbkdESjhRbUsyY3puRFJU?=
 =?utf-8?B?a0NqVHBBQmFjKys4UU9TUDFDZTFxVHBLbEk2bFpxd1Y5V2Y0SFAvUkVVMzBi?=
 =?utf-8?B?M01GMUxkUjZZenNmeEpLRTU3SUpWKzFoc1UwSjNKeDZ5WnErMTM5TDFmSmwr?=
 =?utf-8?B?aXF6dUV2NkI3OWtTQ2hobE1aZjBtNWZtUDQ2d2J6UUdvcWVxMkt1a01wVjhU?=
 =?utf-8?B?TGhFWmpvVUtzMFEyZzRqd2NkQnZwQm9PNGkrL3hLc2RwWE5IWEN6MjIzS0RG?=
 =?utf-8?B?OWlMK2NlUWtCWDVmQjdFN3ZrQkw3Z2t0WS9aTGYxQTVCUmpBNXp6aXl1Ym1x?=
 =?utf-8?B?Q2N3U0dKSUdkd2NRU0Z5UEVyN0w0QUdQSVBXNFZTMUxOMUo3UEY1eUVVdUNI?=
 =?utf-8?B?VTNMRno1TFhuOGJmOUhRelk4aGhtcDBncTlvVTg4R2FMV3dQYWllUTUrQXdz?=
 =?utf-8?B?UGcxd1JXTTF2Yy9KOU53RmlnNW9tUVAxL05zVytDSFpJZ3JlcDEwUXhGdU5H?=
 =?utf-8?B?ZVNxdzZZM2hvOTNjdU9FTkhsQndIWXdmWHJoVS9PaHFsVHBsTnM1TDRXSzln?=
 =?utf-8?B?ZU41UVZpb1ZHa3hCa05FcERUR2ZXbWNYTFloMGRqM1F4bFVPWi9LTU9EVUNL?=
 =?utf-8?B?OWQyaklUM2MyZ3hXNDFFTHFEcE9jWS9yVDJaUlZLNDFoczE4YVJKTDFodzh1?=
 =?utf-8?B?Vkxmbk5Tb0FvT1NXZWt6N2tMVTlwRFloSHJJdlZ0YnVYb1FNWkhodGNHOUo5?=
 =?utf-8?B?L0E3UjU1K0x6bUp1d0JIbEdaT1NKS1lrNG8vS1dEbldTMXQ2NjFqUndlNllv?=
 =?utf-8?B?dnd3SmMxV1VDM3FYSm1ZQW13VldreWdyYmxobTFuSU1oMG1vUS9kWlJjckx3?=
 =?utf-8?B?ZmdiNEFLVno0OHF4VllUNUt6aVVzemExZC8vc0oyK3lQTmJaVWtSWk42aFR3?=
 =?utf-8?B?Tzh0VWtFNFo1MUlMckZVWTZvcmg5eTMyMTYxK1hFVUM0Ry9xN0lMaWc1MXB2?=
 =?utf-8?B?MUhJelVTQkNYVGJNWUpacDJ2amlSK1lLZlRWOVBiVjJKZEJsUURqZ3lrOSs4?=
 =?utf-8?B?ZFRTYU5FRGJRNlJDNXlNTFJsVG83MnpEWFZkamZYZnhWOUY3Z0ZlTWhSTHVk?=
 =?utf-8?B?dHZOUW1EUDhuK3NRTHpsRFVib2Z0VUxsRjYydkMvbWVQVDByUEFtQy9lTWRo?=
 =?utf-8?B?RTFGcU1NUlNEK3hTY1RaNTFvSUs3bGR3VTN6TlIzdGh1NFhUK2F0eXlzZlAx?=
 =?utf-8?B?QnlKdDlINlFzU0lqRCtwUWxBdC9JRzh1V2hnZk9lbG1abFNnRkdjRzFZc1Fa?=
 =?utf-8?B?eXIycUg5MnlFUDBVVXRYeGV4ck9mSURPbWhDM2pWOUdGTk54UWxXZytXNVJ3?=
 =?utf-8?B?aCsvTXJaN2F5Tjh5cWVIWld0MDRhNjhMdWtDWTYzTFhlbWJobEg1SDRtdlBa?=
 =?utf-8?B?Y3EvTGphbm9idG5paGdJbm1WR1dzV3NMeEVXTEUySDdwVUhCMUlPNW9RTmRu?=
 =?utf-8?B?MTdzTXlHSjdIR2x3TStrOG9VU2ZLUnVwdXY0eXltR2pCZ1c2akM3QU5KU2g4?=
 =?utf-8?B?TEpBSlZoMUd6MGhwQUQxbjhuMnBZbWlXaHFyc08wR29FTSsxZm5Dem9Ycm4z?=
 =?utf-8?Q?gCzT2jrJIB8KCKVCNFXBhfMReiGQwRK5SQveud/lvhm4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b8fc1-8dc9-4668-5db4-08ddbacbefbb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:25:22.6042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLMJAkMPff9S5f9Z5PUg7viFKhlxcV6W+Qn+GqU+pfhsRva/yBMHSKEWNIqg9G4nBnrurl2YzxLOwSiXWHSPDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

This patch series introduces a number of improvements to nova-core's
register!() macro in order to make it more useful to Nova itself, and to
bring it closer to graduation into the wider kernel crate.

The first half is trivial fixes and code reorganization to let the
following patches apply more cleanly.

The interesting stuff begins with the introduction of proper `Debug` and
`Default` implementations leveraging the field information that is made
available by the first half of the patchset. `Debug` now displays the
interpreted values of all the fields on top of the hexadecimal
representation of the register; and `Default` now initializes all the
fields to their declared default value instead of just zeroes.

Then goes a complete redesign of the way relative registers work. The
previous way was very unsafe as it accepted any literal value as the
base. Now, valid bases can (and must) be explicitly defined for specific
group of relative registers. All these bases are belong to us, and thus
can be validated at build-time.

Next come arrays of registers, a useful feature to represent contiguous
groups of registers that are interpreted identically. For these we have
both build-time and runtime checked accessors. We immediately make use
of them to clean up the FUSE registers code, which was a bit unsightly
due to the lack of this feature.

Finally, combining the two features: arrays of relative registers, which
we don't really need at the moment, but will become needed for GSP
booting.

There are still features that need to be implemented before this macro
can be considered ready for other drivers:

- Make I/O accessors optional,
- Support other sizes than `u32`,
- Allow visibility control for registers and individual fields,
- Convert the range syntax to inclusive slices instead of NVIDIA's
  OpenRM format,
- ... and proper suitability assessment by other driver contributors.

These should be trivial compared to the work that is done in this
series.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (17):
      gpu: nova-core: register: fix typo
      gpu: nova-core: register: fix alias documentation
      gpu: nova-core: register: simplify @leaf_accessor rule
      gpu: nova-core: register: remove `try_` accessors for relative registers
      gpu: nova-core: register: move OFFSET declaration to I/O impl block
      gpu: nova-core: register: fix documentation and indentation
      gpu: nova-core: register: add missing doccomments for fixed registers I/O accessors
      gpu: nova-core: register: add fields dispatcher internal rule
      gpu: nova-core: register: improve `Debug` implementation
      gpu: nova-core: register: generate correct `Default` implementation
      gpu: nova-core: register: split @io rule into fixed and relative versions
      gpu: nova-core: register: use #[inline(always)] for all methods
      gpu: nova-core: register: redesign relative registers
      gpu: nova-core: falcon: add distinct base address for PFALCON2
      gpu: nova-core: register: add support for register arrays
      gpu: nova-core: falcon: use register arrays for FUSE registers
      gpu: nova-core: registers: add support for relative array registers

John Hubbard (1):
      gpu: nova-core: register: minor grammar and spelling fixes

 Documentation/gpu/nova/core/todo.rst      |   2 -
 drivers/gpu/nova-core/falcon.rs           |  72 +--
 drivers/gpu/nova-core/falcon/gsp.rs       |  16 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |  13 +-
 drivers/gpu/nova-core/gpu.rs              |   2 +-
 drivers/gpu/nova-core/regs.rs             |  79 ++--
 drivers/gpu/nova-core/regs/macros.rs      | 736 +++++++++++++++++++++++++-----
 8 files changed, 749 insertions(+), 218 deletions(-)
---
base-commit: 4092e1b41202ff39aad75a40a03ac1d318443670
change-id: 20250703-nova-regs-24dddef5fba3

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

