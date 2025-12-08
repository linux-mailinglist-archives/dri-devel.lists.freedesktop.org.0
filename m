Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54184CACA93
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5461D10E3E5;
	Mon,  8 Dec 2025 09:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2riZ9Kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3585310E3E9;
 Mon,  8 Dec 2025 09:27:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkcwEu7TTvsrf9PhBJ+8TaY3ucDPPxrLq5mkVd7286KCu+6Q/E0+q/ilKwCe48AhQJYWbT6uY6uo1D/o7Ho3rfSMInN42hS5KXKQ8pRi7Rn3e3OeLMyAVj+cwXN6xJsGEvQvytUMnyvuf1qR8eTCOdXNheODzkdcCTLMhYB/Ej85BUJk4/IGyLCeC7XEzvijkGCidnIq6C7rsb/ky37ux9Tq0b1RnV+i/vcBmNbV0jL9S29/vt9gi4TN3iMuf0G9PDzXhmz4FkRyHNOMO/UN1golgsZ5GQVK1PtTnm/Sd/iKb5HodgTnrupwA5K0vwpdyQJieoMg5ViRxRJ+nykF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3vpdy01SDEXsfwPJKNktEppr6ge2q4Npjq9BX/SCXg=;
 b=mcMMG5EiTJyUCP4G5WcojzCjp3vnxrnGezhTfX4AOq3iSuPV9W77dWpZdZrp4QPvdvKetiFHgeNTaZmm4ppDFzPcjtk9JC9Iih52R3ccWx2EWxan1YshvQzl99eDZWS+v6kAbuPcY+hNZm3TnW+i/sdRA21Jncr0+Rm1KOlZyzNBtGYbQAh8pYth3niuvKVwTF5ufNDSUJ54kQ3vvwn3aK99EzL4mLYt0I4T4bj/fMt1FgUGNNRGZJnIVcr1FF4dECL2fX5RJtZWt6o6Wb2ZcW/F4bCY3VxurWvmZfK+xRUjuq0rv6xmmpKG4ae3oW10KnGY6cyKor94xw+IgsK2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3vpdy01SDEXsfwPJKNktEppr6ge2q4Npjq9BX/SCXg=;
 b=N2riZ9Knc1lo6cEWle1gAZOpxCHRON9h++pXKBAz2WKg0I8zXxEvI4Nt/Hd+rQsvqYafyq6NxsIJQgzxmoAbuY11Ts2sSVT3Sl4wUxDEQCG7GjNfoApHkzLSimFlfo5jDdo+IK1tVcHpx6FsUAB2YwHIL0GTZjaroboskihFipXWDKv1KoudZmclk69E4dGBZqVhmpYlL2Xqb4O5HaKN8FT4BUsz/Sz0gP8XSullhDZYYCNTPtInoPvuTqopXi7JnsTszgfh6eczFdPziDVzb1ppt0ADLM5loJKhfM9Gq2d6QgdU21vdt3cmOO7qXQZhOdR9BgFVwh8RkWjEBo5kRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:57 +0900
Subject: [PATCH 5/9] gpu: nova-core: gsp: derive `Debug` on more sequencer
 types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-5-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be20329-21f6-4646-706c-08de363c0030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXdtSi9PTWVoUDlBdlB5M09GdTYwOGg0NUhRZzFlaGh3LzRNQ0ZjU0JyZDV0?=
 =?utf-8?B?N09nZGpMV2FoNER4OC9iSFFIYjN5RzRBMi9idzByUDdiR0FSZWRBMmFEN3dD?=
 =?utf-8?B?NWFLUXBtVkJzZkswMUFUcFhKMTQwSGkzajZUQitQUGYvakh1WGlWQTFCT3dh?=
 =?utf-8?B?dGpQeFRYRWpLTlcyd2xHZDdWRnd1ZlhYWEZ5RHNsSmpwUDJIWlExUlN5UzlT?=
 =?utf-8?B?eFQ5eWRtYXZCUmpOaHQzeHIwWnhxbXkwMUZPTytrVFMxNnFZMHBRYVhGbzE2?=
 =?utf-8?B?d1NkeVhXSmhBbndZZWRybW1Nd2Z3dmlKUlN6NEtSc2JlNEFmcGRPeEdkemY0?=
 =?utf-8?B?Mzg3YThaR3NLb2NubnB5R20xUW1IMFNkU0hTaUVVZmlsdDloNGR1eVFJOWls?=
 =?utf-8?B?RUNmMm5leU82azdOS3ljclRzNGc5ZERPc2k3ek1LNTlCa2dGM2NrSTNBTmlG?=
 =?utf-8?B?SFp0Yjh5QTNITC9sZEZsN25SYUFCRnppa3FNZHlZZGtlbENZMzloK21wOW9F?=
 =?utf-8?B?OE9YeUFEcURLS0E4K3VpcStMMFZ4RjZpYkFZTU8yQVZvYVUzWWo5cGNNYXJR?=
 =?utf-8?B?bG9PMjZ4NkpRZVdQbXdWRGJncHBFZFFsSFFxVHVScThlL1Q5N09LQXo2ejNW?=
 =?utf-8?B?enN1S3B2eW1YQTlIZ0szc1crK3lwQ2FxMlVLcUg5ZElIU1QzVXJYNmQzVWcy?=
 =?utf-8?B?WTEwRjc3ZXVOZG5IUVMzRDBuOVNzZkNhYk1vb1NraWlkWER2TzFPdnhtSUt0?=
 =?utf-8?B?UG5xc2Uya0lWZDdKYlphU1IxUDJZWlBLR2ozTStwNVVrQW8rdVlmK2NGa3A1?=
 =?utf-8?B?YWUzOEkvc0UvYzAvNERTMDduK0ZvY0hMM3ZPaDdNWk9FaXc3amhKR2M0UTNl?=
 =?utf-8?B?V2VKeE93YzM4dkN6OGpXdGtSaGFRbzRzS3hKOG5BWXJtVFlRakdUTm1DSDRj?=
 =?utf-8?B?M3ZUOTVWNEplbzdld29Pc09YUWJmSHYrNElIdGxhZ1U0eGpEeG8vbjZGRnd2?=
 =?utf-8?B?RkpqQ1lmVDRCQnM0T3piSlZvNnNpWHVQODgwVFdFVzRNeStQUTNIUVk5cTZH?=
 =?utf-8?B?NFhRYzk5MWRrdnZPQlh1QU94K0FiZEswUDNJYkRZSGsrMFR1U0hLUlY1UlN1?=
 =?utf-8?B?eGhlWU5TN0pHckl1bFpNVWE0TXNwOVFEVkZxUDd6NmMzY3Bya3RWUVFLSm9j?=
 =?utf-8?B?b2RqTE9wMDF0RnJsSngxRWFpTEo1SFI0b0doTCt5UGx4TXM4MXhiQUZzdENT?=
 =?utf-8?B?UUJpZXZpNmR0d2ZwbzJYL1hwQnZzYnFrME1Da29SMk0vTk8xV3pUQkdPaGsz?=
 =?utf-8?B?dmlsc1VSS0J6bXh4T213dlRobUpjcnRwaUpyMWVzVXI0Yzk0b2s1ZkFwUXg2?=
 =?utf-8?B?WkZPUzhlSVlTcFJ2bVRvV2tKd25CV1A4TlB1QWZIMVVEek9YOFE4bUxoWjh2?=
 =?utf-8?B?akl0aUVsYm5DNU54UW1DZjRPL1NwNFpqczJPZ0xJSlJzUW96NXdKYThxS1kw?=
 =?utf-8?B?QjZTVjBUOFhGUExtZ1k3NW1GWWtpMEUxTEkxOTI0Y1hRc2dIYkFCTkExdllk?=
 =?utf-8?B?bzMwTFM2eW02Tm10NzBGSzcwL25PUHdMeFJYbFR4RzRsM2MzQW5LeDRDalN4?=
 =?utf-8?B?Tnh5MFdOM08yT05nN2R0aFNrVXB6QnZORng0UUNmOUdRanY2M2g0RUFtbDdN?=
 =?utf-8?B?Zk0yaG5BNFE3L0tTWWUrS2V4QjVVNUZGL0hycVRmZlhkNDRIaW5lNWFyVHB5?=
 =?utf-8?B?c1BvWXdrSWE4REhCb2JYbXpjcE01dHFnMzJFb1lubUlzVDVHM3d6ZFE3WEVC?=
 =?utf-8?B?b1RUaXN0dWhiZWwxVkUvck9Uemg4M2x2aFVORW55dk9HTDBEaWNtV2hNM24z?=
 =?utf-8?B?TTBUL3V4SDN3aEpqdE1QYUVYUlJHMHVta244djNGUGRVZmgzSGtEcENVNVd5?=
 =?utf-8?Q?p9tSsgIsVZulr+uW9keNn0s56C/BcWXv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBGRGlCTWR4Um94QUpjV3BsODRhMzBkbkFabERuUDJVVmhXTWNUaHlHQ1l2?=
 =?utf-8?B?cjQ1RVgvRWlSM3htY05sYWtEVWE3UytkWEMyWDBsMEVRVnpCRVdjYUNLZ2wr?=
 =?utf-8?B?RW1YTnNtaG5YQ0JVbDhyLzFmcFJUOW1Db2UvQ2tJUnAwcE5BTkVrQmJXQjJr?=
 =?utf-8?B?QWVHWWVjbjdUYkFyRW1DQVRTdml4blhOQzVuVWVWNWlraW1mV3duM3VpRHc5?=
 =?utf-8?B?RXpPZGhxRTNkSDVVKzRRV0tmVHNIQ1I4YWp0L2wyajJkUEIxdkw3aTlPWlJi?=
 =?utf-8?B?N0p2VlRSTlVLdEpyRmQ5NnVqSDNMNVE0NHRwSTB0RmtnU2h1UlFON3JidUts?=
 =?utf-8?B?SjhCVFpCbWRtS2FHckg2Qzlac2dEZHRjelZ1TXpKMVhTQ2IwOE4wWDNYZzZI?=
 =?utf-8?B?VVpJUFYzMXpsYUJENmNYajdFWTM0M21xM1I2VGNPQlA1YWRFK0k3d0VhRXFo?=
 =?utf-8?B?Nng2MjFiUnF4azJrR04ySW1TQmRZOHhIN2RWLzdQL2dGVVFTcDltT2ZLWThK?=
 =?utf-8?B?SmRNVzUvcUVTakNZb2pwNURLMUt4NGIwUVN0R3RoSmtxT3NHeHAzMjRiNGJa?=
 =?utf-8?B?RExBTlR2M3J6c01WeWlHV3JiaEpDN3kvV1Bic0t0aVN5OHJRdXc1dGo2UUxQ?=
 =?utf-8?B?YWFlNzJXdGRyRmFsL3VqWFc0c3NQbDdIalZlMVU3aHViZ3d2eENrQnlpNlRx?=
 =?utf-8?B?dmdRTGdWRitvVklMeTI3UnVXd05JNXpIL1NYVHl5d1JZRnlOOWMxMVpjZG13?=
 =?utf-8?B?NkNpOWdoOVYrRlZ2YkVZREJ0SnFmZ2d3R3hyYVpYM0cwK05JOUltMFEwYXBJ?=
 =?utf-8?B?U2hMaDBFS0xZcVVHd09lOUdQd0dybUV1NHpRbGFXV1VBaThxSVNYVzlqbGxY?=
 =?utf-8?B?YXJIR3NidzRpekp4QVQ5NXlZc3hPWTBsYjl3TE9jUU9XRGVybmUrQjVCRkhl?=
 =?utf-8?B?cnIyZjFpNzgrTlNMaVYwMGVVb2ZIb0lIcnJuNURoQWRkOEl2enJRZGF0MDVG?=
 =?utf-8?B?bkVjVTBCbHJMZmxhWHBZZWY3UDhtQTlPc0FPKzV3Z011a3dtMWtiWWl0ZDZD?=
 =?utf-8?B?QlF2aGxmd0xOdXM4cGM3eTUvVlgwSTRQOUJqSXBJdDFTczczZXZ5OWN0N2V4?=
 =?utf-8?B?eWlGcVZwTUNCSU9CU08wNS9UNUVlN0lmRHZWV2lYSDJkRmc5c3JrZjVnOFI3?=
 =?utf-8?B?K2NudTg3bEVaRUJYT2NYN1pwd1BCWlhrcVNYRFpOZE1RaUN2TnJjcTRLNENJ?=
 =?utf-8?B?SW5pQWVHNjNIT3BBZFNDZ2dhUm8xS2NnT3Q3YkhyNWpIdjlOMWE2RldCeW9E?=
 =?utf-8?B?WnAyeUFzcWYxYS9BejZ2ZGZXMGFwanU2cDF1RzFROTJSUFM4QlJ0OEsyQVcy?=
 =?utf-8?B?K1B4ZWNJcWJzK0hNU1FIVThpaGlCZlhiSVJJZ1JhdGR3YW9sNm16V2JyVTdH?=
 =?utf-8?B?NDIzNjRSR2tCOXlKTkx3ZXR4UmhQMHN1aVNVeG5NcFlZM0pEZGx1cllqN3BB?=
 =?utf-8?B?dHgrbHpIcDhZbFlGcVBtaFBNdDdsL0JadUtPd2VIbWxlb2hqZmZNazZoQjJO?=
 =?utf-8?B?OGVhRi9IL0dXazNxNTFodWtBNHd5QzJsS0JqTXdIeTFRWElFSWltVC90cVEw?=
 =?utf-8?B?WlVEbnpveGZYdzVQN0JKdkcwbHpEalhBdkc0bVduZDE0SkJ0eE5UMVFQa0Va?=
 =?utf-8?B?bnlNZSthMkZMMzR5MWtsMWd2RDl4ZkdWU2JtQ1dUTkkwaHRIcFdQSTUwSFcr?=
 =?utf-8?B?R25wOVNWdmJrZXJmL055UjMrL0pNbllXSG1obVJQMHM5U3VLbEQ2UjFRUXBh?=
 =?utf-8?B?SGxpTnNKdWtHbFJCdG1HUkdnM3JOdXlJb21PT1pQSXlBVUJDeCtVNXRwOG1x?=
 =?utf-8?B?akpETVpkMjczZCs1eEdDbWQ2KzZNWEFDY01QWE9oWHRCeGRuUk5kY3VGaGpL?=
 =?utf-8?B?eEE4Vit1cmJTR2xzUlFHQ3RiREh6WUVlMXV6eHp6YU10Tk9TdDkvQllHSlUy?=
 =?utf-8?B?TFF4U2U3YTBhaFZtS3hCMGZWcEIyMkRUaHR6T2JCNWJaU1hobm1MSkk4L3dQ?=
 =?utf-8?B?R0pySERUcCtyVERiUnFndU0rOGdaaGUySVJGa0hNckdQRk5pdTd6bzE4K1Nl?=
 =?utf-8?B?aTBuUGFJY1lqckJ6QXp4cTZOWmhjKzRHY0ZJL0NTTzR2bFdNRHEvVG96bU9B?=
 =?utf-8?Q?qMhM9N/rVTjfsAC1FZP0Np1g5XR7aZ4ynjAEs/7APvNe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be20329-21f6-4646-706c-08de363c0030
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:26.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8SxCgTZSBC8h1Gv5klkfcNvehlplBH9h6T8/omAsocxHYOgeVIAHpVjLBacGoThhIirOrIuAqWVcooxaQ6ZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

Being able to print these is useful when debugging the sequencer.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        | 10 +++++-----
 drivers/gpu/nova-core/gsp/sequencer.rs |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index d06c0fdd6154..d1fc8f111db1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
 
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
@@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
 
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
@@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
@@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
 
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
@@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 4efa048b9d93..5eead7ad4cbd 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -70,6 +70,7 @@ fn read(
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and an opcode-dependent struct.
 #[allow(clippy::enum_variant_names)]
+#[derive(Debug)]
 pub(crate) enum GspSeqCmd {
     RegWrite(fw::RegWritePayload),
     RegModify(fw::RegModifyPayload),

-- 
2.52.0

