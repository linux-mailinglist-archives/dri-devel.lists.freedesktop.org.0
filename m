Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB2ADBBDC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 23:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022F10E45B;
	Mon, 16 Jun 2025 21:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GassCnck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2594E10E459;
 Mon, 16 Jun 2025 21:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJYcTXRWFHHy0emeaFT4P5i0Vsv8I7WedUg6GaZ6Mb6fzGtbcco+hC3FwdipXYcV80Utk6A8637oVxQhuWwhyIvOlWTkqLAGRSrNm639scdQ74pR8K2qFUTZMNL1Nx2MLLVJRX4pa/3ap40GPy63SaCWoFftIgNsaja0FXC6QY9+Eot0bDIWJgqevO2O6OVdnYHxJ8Ys9tObBNT3BMDnKI3QCDsWgPkBsKUMITiUM8A9Xpwy+I2BcbULFhbPgzs27mx/nWCCWRRHhd2/bn73gTW5OoA5kXFd5ZVhoFikyltVYn+HVF+DK6WRJsSwDzLjn5xKQ0lPiawGmquL3EugRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0+I7jf3QkRusXt0zFFxpWZmxoB6JXaVjVsCQDbbU+U=;
 b=PhDVISIdrMzl4ihAeKYgCfW64LcRDY6V/zyYkD+TWVy3xiwLfK737vjGMowV1Mqd+EufP9aT0lEUSCBF3WQVvFwCcSFfTyg84DrmV53iIIiyukFV5pcBjT3cnQSyGAnOO1oxRT/1iSkWVlGp7WXYDY2qF1DlE9xf/wCbx/PBHV+x+DiCvnT+wY8XxCmaGBlW89D+WxKd8FhSJZCZ0UFZy0p1Hz9443gPdoeVkvczvbYbM1yJ9v3GWBYr0Q1OqrslnXnNtq8fen09+Mh/nOYm07/0u2qmQe+X8yx6mPS4np4S9F4Ek5ZBvtKSKld0IirjY6QpXbwzCFx28IoItAW4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0+I7jf3QkRusXt0zFFxpWZmxoB6JXaVjVsCQDbbU+U=;
 b=GassCnckSIoDm4lXTIkoHtXyyfiGOggsrx4vBtm8Z2pWz53xBtEksiG1Xn1pZwZIrtSq9eJrruKxOZzpDi9wbNIyIXBF9cMw4PwkyhlYLWeajL1swbe+9SBtVkMhC1owNGdsSPmc6ivBjoqif0GqO7Aw/KARF9f4DTRu8KG3/ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 21:22:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 21:22:12 +0000
Message-ID: <ba89d859-f132-4e7d-ba29-47331e02152a@amd.com>
Date: Mon, 16 Jun 2025 15:22:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
To: Markus Elfring <Markus.Elfring@web.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
 cocci@inria.fr, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: f91f6eb8-3e97-4f22-08ac-08ddad1bdbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXBjYVBWczIxRTF3bTJsRklpUlZjUmlXRjRDTXhDK3NacTRqNjEwWG5nd0xI?=
 =?utf-8?B?blkrWHNWNmNsOThSVUZ2ZDU4R3R3VjA4UUZDajNxRkFLb3ZaRWFXMlN1SUVG?=
 =?utf-8?B?Q3JoNTN4a25iZHUrQ214cUJpVzljNGk5eXJKZ3VNS0t2ZWdLT0o1SUFmT3I3?=
 =?utf-8?B?TWhpU3BWbG9pR3A5d1NoNnhZZThCdXc1VHdQMWUrUXNxU3U3b2NwZDJVZ1Rj?=
 =?utf-8?B?Nmd6cEo4bWpUMGtjbVdFcVQ5c1RyMEh5QXZ4VkdxamhIdkNvRERET2pQWVQw?=
 =?utf-8?B?Umh1N25TY3plSitRRVRNcU16OGFQRU1HRUlMRWlsWTNzbGJnUCtmVFRDOVA0?=
 =?utf-8?B?Y3J5elJ6MFowOFZoSlFpQnhmOFF0Q3ZpTlRDUnIwRW1WM3BTR28zODJ0L3dH?=
 =?utf-8?B?TVhRc0gvZFVWWEFMeVMxazB2cjJHcDhMcGhFVGhKbWt4Z0N0RTVPSzhXZFp0?=
 =?utf-8?B?RkV2RzdWM2J5SHRicU9kaWlwTFE3K3pMQi83TDVOcDJoZWpmcmNURnlQbEU4?=
 =?utf-8?B?cFBPK2RjS3lmZGltaWkxSEpDOGdGR1psSzRwcDYvak1KMHBFT2p5Z2xHR1lT?=
 =?utf-8?B?dmZBc1pBT0dLWGU0ZVpyOHpNNlpnOXNjSHhGMUM0VFhBUUR3NVpYLy9xU0VD?=
 =?utf-8?B?amhJcG84OFlueEdTejlOS05VczV0MDBTSjlBcWhMZ2FabGtjZGJoYWNpUDBi?=
 =?utf-8?B?NGRqWHlHaFRmWFBMdy90WEJvZ2Yyd1lYKzFDVzVYVTZIRkFTRUVkRmk5NzJr?=
 =?utf-8?B?RExLeUdobFkvNnI2cmlJZXJCM2dCVXM2RjNsQ0QvVkVwWXpiQnRGbFhMYmV1?=
 =?utf-8?B?NXkrMGQxMERMY3BQaTdKMElNOG0vbnhBb0FFK001U09xNVBxdytHbWZUMCtx?=
 =?utf-8?B?Rmh2TUQ3ZllWa3JoZE1hVVFNRUd1Z3kzd2ZlcUZMOVRmNDdGTjlxL3l0WDdH?=
 =?utf-8?B?UkZnVXdWNTE4S3VHdExDOEZ6VE8ydlYxUnl3NERPdFBwQ2poaXRGWGFucHIz?=
 =?utf-8?B?QlJJdXBWTVhBSVZnR3dzUUYzKzg1U21sSEFOTGUvcktaUHVnMlRxaU1ad29K?=
 =?utf-8?B?SHNQSG82NWVJTXp3bWZOS0YvM1RnUU93SHN2VEJzWTk1MlJHSlMzTEROZmNR?=
 =?utf-8?B?TkZLU1dOdyttdEdXUUp2bkkyN3JUMnJQNWJxSjl4Nm95RTVGWkxTYmFiOVpO?=
 =?utf-8?B?NjVQdnVwODk1WjNWdmdNaTZkZ2dLNFV4MXgrRkgxUHhGaTV4aVFQQjZVTFM4?=
 =?utf-8?B?SjVrZ08yckI1dWp1ajFmUzAyVi9mWlhmdGxRQ3RCSXoybmZrbFhlWXR3b1dv?=
 =?utf-8?B?QTN5bTQrbU5pc2NlVHk3b3g0N1RyMkgrWHFnYlhHWlJwamtoRW16azIyYk00?=
 =?utf-8?B?bUFOdldUWCtkTWdNNlV0MExoWWMyK2ovaENpR0FjYVBJYzM3Nlc5QjhhMm5N?=
 =?utf-8?B?YkZQN0puSjF6WTUvdnViVjA3Y0lJeGxhb2RJNXRkQWY0WnIwQ0FoOXgvL2Vw?=
 =?utf-8?B?b0lHNzdrTnRTcFBrclYzeVdBVVlMU2VINFJmZVZVY0RodGZOb28vVStsMkl2?=
 =?utf-8?B?aU1QSCtKdkpnUnRIVDFENElqenZwU0tqeFRNV0VLL0ZJaFFDYnhHMm9CcGs2?=
 =?utf-8?B?dEFRdktybFliMUVwRTB3bk1iSU1wUzNJNGx1bGFKWlpJMDlkS2J4OHlybXNW?=
 =?utf-8?B?NmRpQ21WcnJZa2pEMjA5MHlzaSt0WlFYL2RsVzFvUXF6NXQ4c2lySlc4N2RJ?=
 =?utf-8?B?Nnl2QmRvRURTT25Na3ptaEVFNDdqVDFWNDE0ZSt2Lzg2MEVKc3FNSDFoMjFB?=
 =?utf-8?B?TVZDaWtCU3liV3cyRGJVTmpKamYra1NxbG1jOThuK1Z6RXFuTVpnazhtd1hv?=
 =?utf-8?B?dDRmL2tDdkRQczZIUTdEejM0YnM1RTdHOTNhQWNCRFR5bUZWaVh0VU9KbWtt?=
 =?utf-8?B?N2dsQTQ0STZNQTU2U3JZKzdGeElRTkVteFNoRGQ1OFV3Q1M3UFlDbGNoRy8x?=
 =?utf-8?B?c2h3TmxVOFNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRXTnJ6VEVRSG14cXJyMXhZd1M3WTZjazVaTzFaZElvcU1abmNzdzFiMGha?=
 =?utf-8?B?L2pOUXE3dUhSblM0WWowcXNnZFdwRUxia2tRMW92MHpwUG5hU28wZi9UdHNO?=
 =?utf-8?B?eUNzSHoxZXlVOFJNallLNHp0VzN3TmQrOVdFZDl0QzhxRXBJTlY4cDkxc2Vz?=
 =?utf-8?B?R0drdjZvODVHbjUvSkhRcFdxc2Rsb2twQThORUl2c05kZllVOGhrV3FXRElL?=
 =?utf-8?B?UHpzdXM1d01SVTVMc1BSZ0NHNTNYMU1qNC9yTHJFMVV5OGhLNTlQT2xSa0ZH?=
 =?utf-8?B?YjJVY0lOY1ZuZVYvOVd3VmpMek1sbENUUlhCT0VNTnR2dFBKb1VxYlk2Zjgz?=
 =?utf-8?B?eE1GNWU3Z3BMRmNTVG5JTTUxcTNzUGtQL3JERlZvUkRVTUVNVjhDWEFnZ2lO?=
 =?utf-8?B?MHBEK3FoV2hzdVQ3aFlON0FVY2dZRW9KYityYlJoMzFBVVVEVC9UdjAzMjdi?=
 =?utf-8?B?dXA0eUZPaldqWUczSzRQaVJMUmcwMzRtNS9mZ2V2Ri9ralpzeTl1M283NnVZ?=
 =?utf-8?B?d0MrbWZTTVBHR3BlVEFzdG9Oa0x5ZGxZMU83RWhMUWpvMjVqV2h3ZGVmcnQ3?=
 =?utf-8?B?Y1lINWJlVzd4YUFnTHZqV0pTZmk3UXhPckFtck5ydW05VExUSG9ITVd2dG8v?=
 =?utf-8?B?eG9pYi9MNTZLaE5aWHprUEcwakxCQkgvK1NvRjVlbENPSlp0akRWQjVZaktz?=
 =?utf-8?B?WjJyUWVDdzVqci8vUkRYdGxKRGRjaVhJWmhucFBSTXQ0WXovOUR2b0pOSWFH?=
 =?utf-8?B?VE1nK2V0R3NUK2ZEcUUxYmwybitBbDdqQVpKa3Fsb3lIN2lVbSsxdUlEd0hI?=
 =?utf-8?B?SEFETkhHWFE1RnRJdGhFT25vYlZpUFZJUXJKeng0WmVkM0R4cWx2NjlkUmM3?=
 =?utf-8?B?a3VxTVdkSndFRFpEdVNtMm83b1ljSjdFRjlaM3VrdTZ5VHlvbkp3YVA2cGps?=
 =?utf-8?B?NlVwRDFLZFFPcEpncklCbzNjLzBjN0VFY2wrTElUTXlUVnc5Ui85MEZtRWpz?=
 =?utf-8?B?d0hNQ04zN1NwRkc2aEJ1ZURrWERjQlNUcGtLN3NoWWVaMVlZSXBialJOdlVy?=
 =?utf-8?B?bTNIMVE1QnE4dUx3NW0rUDRLU01pNkE0UWIrdm1OUHJOV1BjL3Qxdm5ySnZH?=
 =?utf-8?B?VEFvSUtXNTJCTHFVV2xsRGhNSTZEQ3h0WUFJYlhsWWZ5NGRRZ2h5eXlwa0g2?=
 =?utf-8?B?UCtlTnhVY3V4M1laTElaaGloL3FWR1ZxNUZlNVBudStncENhdTMrVGxCdlE0?=
 =?utf-8?B?dXRMT0hUdkFMVUhDMS9XakFEVmhuclFkaUlUc2Qya0ZSLzdZRzdpNFNraWsr?=
 =?utf-8?B?RUdrakliMjBheDd1cTQrVGJEdnlqS1M0ZURBVzFwdElHVXJWZ21GdlBSZnho?=
 =?utf-8?B?NjlYcThnNlcrUnpOUzlqUXZHa1A0N0YyTld2azJIRFVpNElVeWhtUG5LWGoy?=
 =?utf-8?B?dnd6dmJ1SGIxOEtQZGRCZlJ5Skp4Z0pJbXlvNlN3dTNqN2pQZFJhdDlPZWpM?=
 =?utf-8?B?eGM4TGh1ekJ2bmNEUmFlYWg3OThMWFBBT3ErU0RBRHNpeHlhU1B1Z3ViMEgx?=
 =?utf-8?B?aExnUW1BUDRRQU1pS1ZaL3lZaDdaSUFLU1BpN1VFQ0ttaW1zaGMyYS9tSGl3?=
 =?utf-8?B?dE40NDdQU0NoSHA1WVRUcSs5MWZsQkRrMVVwRWlaeklRSHpGTVltRDFzdHps?=
 =?utf-8?B?QzNaM29uRkhES0tGN25nQWsxbjhTQTNVZVN0K1JZZTltcUNGcDhUazhYc3Rn?=
 =?utf-8?B?NEhSd1VuSnNwR1BNdmduWUMzMm0vamlEYlA5N1JnT0dCa0ZxOWtCbVRqVzVa?=
 =?utf-8?B?TlRJSVMwejFaY0xFb3RqNmxqVzlHcUtZb1dZdGpmcEczV2ZGbmEyWVR6T3pE?=
 =?utf-8?B?TmVsanZqbEhHRFlvS0thRThJdFZLc0tKajZWYzc1eDI3MzU4ZHNJWDE3MmhO?=
 =?utf-8?B?YUZ3cmVLL082cHVybmF2Q0dXZU1SWlkyeC9lTmZ3aVhuNXhUTVR2aFJZclRi?=
 =?utf-8?B?Wk5CTGxzbU1Cek5ldk9nOVd2ZHgxbktQcnM3R2pZazRLaXREQ1J1QVhCV2ZY?=
 =?utf-8?B?WkVnT0p6MHA4TlE1Qlh6ZHIvZkRKU2JyNlVDYzdWbFdlQUhGWEhDT1A2UDFN?=
 =?utf-8?Q?od+ykZKz9Qex0ORcWuyQNQFJ1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91f6eb8-3e97-4f22-08ac-08ddad1bdbba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 21:22:12.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3J63Nl9YFLxiaLTiWt3ROc7QennhjzmBYIbVfAQFkSdrpcvht92nZbtQM8zPm8qQzc29gQYQ00APIKTEGFmUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
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



On 6/10/25 00:10, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 10 Jun 2025 07:42:40 +0200
> 
> The label “cleanup” was used to jump to another pointer check despite of
> the detail in the implementation of the function “dm_validate_stream_and_context”
> that it was determined already that corresponding variables contained
> still null pointers.
> 
> 1. Thus return directly if
>     * a null pointer was passed for the function parameter “stream”
>       or
>     * a call of the function “dc_create_plane_state” failed.
> 
> 2. Use a more appropriate label instead.
> 
> 3. Delete two questionable checks.
> 
> 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
>     which became unnecessary with this refactoring.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@intel.com/
> Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> 
> V3:
> * Another function call was renamed.
> 
> * Recipient lists were adjusted once more.
> 
> V2:
> * The change suggestion was rebased on source files of
>    the software “Linux next-20250606”.
> 
> * Recipient lists were adjusted accordingly.
> 
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 78816712afbb..7dc80b2fbd30 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7473,19 +7473,19 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>   						struct dc_stream_state *stream)
>   {
>   	enum dc_status dc_result = DC_ERROR_UNEXPECTED;
> -	struct dc_plane_state *dc_plane_state = NULL;
> -	struct dc_state *dc_state = NULL;
> +	struct dc_plane_state *dc_plane_state;
> +	struct dc_state *dc_state;
>   
>   	if (!stream)
> -		goto cleanup;
> +		return dc_result;
>   
>   	dc_plane_state = dc_create_plane_state(dc);
>   	if (!dc_plane_state)
> -		goto cleanup;
> +		return dc_result;

I think the two early returns look fine, but the rest of the changes 
reduces the readability and reusability.

>   
>   	dc_state = dc_state_create(dc, NULL);
>   	if (!dc_state)
> -		goto cleanup;
> +		goto release_plane_state;
>   
>   	/* populate stream to plane */
>   	dc_plane_state->src_rect.height  = stream->src.height;
> @@ -7522,13 +7522,9 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
>   	if (dc_result == DC_OK)
>   		dc_result = dc_validate_global_state(dc, dc_state, DC_VALIDATE_MODE_ONLY);
>   
> -cleanup:
> -	if (dc_state)
> -		dc_state_release(dc_state);
> -
> -	if (dc_plane_state)
> -		dc_plane_state_release(dc_plane_state);
> -
> +	dc_state_release(dc_state);
> +release_plane_state:
> +	dc_plane_state_release(dc_plane_state);

This clean was intended to be reused for now and for future changes, and 
the changes here remove the reusability. Also "cleanup" is commonly used 
already.

>   	return dc_result;
>   }
>   

I guess the intention was to reduce goto statements. If that's the case, 
it would be better to eliminate all goto and then to remove cleanup + 
two checks.

On the other hand, I don't see anything wrong with goto/cleanup approach 
either. Multiple exits in a function do not hurt if managed correctly.


