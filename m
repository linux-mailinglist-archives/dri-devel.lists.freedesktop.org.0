Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D712914398
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A682210E388;
	Mon, 24 Jun 2024 07:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="YWTR11jg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2093.outbound.protection.outlook.com [40.107.237.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB8A10E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3yrpWsSe67AFnd61MPQMN+PSoJG+8d2x1BCof1R2zTSJOGiXTzhWZ5gpzrPgfa7AePMNYleRdxDp/6gAvbCun1okGgzn1/YDM+h6P6Ph0iQbr2QOT8KIqEk4/Naj/NAMaMZm5IyWecFUtTBghAFjYZDh697tMznfJwS+NHaIb8jScrbl+YLVs7qcgtGGc8RSmS3SEkPqIxyqT0Wuni6p8L91ORR20nc/O9/hvdLnXVq6G36aVWzN8Xo8sVtZHA6iVU9ux/QneWkHESOjKu6PNWpUUAB+I/rLHHHNHxaLmFPXjc/dUKUAtYLpFy5XaaEjHrJH8OWm0CHNpBlq0s6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqRhWxs1wW8N3JeAaUzbhnYoPdQEVTtyEJhNFGBjDk8=;
 b=fASkQstEdRo8eFSZoG/6olOVXrkyq0x60JTXkMARvnYaeeMOM0KxGjD36opfpd9JPs0jm+vf1twzJycpqIfRvx/3duz+TZtyvf+cZmKG1m7XP6jHyWWcu069BSVtbTrPY5wB0KQyaAtCoWr4T4dh8TSE+c3FfMZ+0Ct9aKA13mf7fO7wsDhEkzhzdtWY6KnXauV2Cn1QZDYFdTGCK6zsqgieYSLg8JtIlW5gXFXo2apYhRnW73COqdCAN5VKcP1Y+vuhCKEuUdSYNBEpzgQWqV1iSBSTUlKPii7Ul3YRTJCaWUwPSVt0pFJoXLB1N4YamSuhFfm1j6vi0y8tOein+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqRhWxs1wW8N3JeAaUzbhnYoPdQEVTtyEJhNFGBjDk8=;
 b=YWTR11jgf9E4+5vZp9b6UOps0uMeIg+7ielqG0RefoKAM1/RnZv2ZslB0SFcXpfP9uqx1HjcKAwavbk0R8A2Q74lwB3sSosb8u+O7n38u4VGIvPRjUxXr4iMWGQjhVXmTvVjpnF/qkvNMazxyArqBujQ3p6h8Oe4IoscZcN7g2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:11:17 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:11:17 +0000
From: lukasz.spintzyk@synaptics.com
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Haixia Shi <hshi@chromium.org>,
 Ross Zwisler <zwisler@google.com>, Guenter Roeck <groeck@chromium.org>,
 =?UTF-8?q?=C5=81ukasz=20Spintzyk?= <Lukasz.Spintzyk@synaptics.com>
Subject: [PATCH 1/4] drm/udl: Port CrOS cursor blending on primary plane in
 usb transfer
Date: Mon, 24 Jun 2024 09:10:38 +0200
Message-Id: <20240624071041.5087-2-lukasz.spintzyk@synaptics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|BY5PR03MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: d645fe1b-47e3-4d85-d605-08dc941cd732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|52116011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1JZdURRaERHWlRFeVpjUE5VdDJXd3ZuRnN5ZEVTTzNnQmp0S2UvaGU2K2FO?=
 =?utf-8?B?TUxKdzkyZm41MUR1alBPS0d0VXV1bDJTd2NZWG12bXJ1NHpUbFZVYWx3bFJn?=
 =?utf-8?B?SU1KL2puNG55RlpqdVpLQ1lYUkhiQnVMSGZhN2JmM3p0MFN4Q0FCL1MraURS?=
 =?utf-8?B?MEVZYkluOExqVTZmanMwNlphRzVQMVI3WXlOMFlSZHd5YUg5aVVhamRwU1Zy?=
 =?utf-8?B?U3U2MUNrWUd1OFNkUWRoM3FwYUt0T08wcStmMit4UGlHaDhtdzhVZTFCYXFG?=
 =?utf-8?B?Sk5Gdm1DM2JpQTB5WU1jOUF4VW4yallMTUlzM0dSVFR3cFh1V2xmcGYzcUJx?=
 =?utf-8?B?QkJnQnhKcksrdEZZbTAvdFFUSTlsSCtVWDZtWkY1dW1odUphV0tpWnU2L0Na?=
 =?utf-8?B?NEZScUZkY1BKSEtJUHE1N21ZZEl5aVl6V29acWQxVU83a05YSnFDT2dvRmdi?=
 =?utf-8?B?VUY5OVZSUkc0d2k2eHlENVQrbXNaK056Wk5UMFd6c3NZOStJVGlvVkdUbHZF?=
 =?utf-8?B?WXJqM0crQ0RmTE5YOFlIaVNyejJiUkxzcm5ncks5aGhNY2hmaVFCRlZhSkp5?=
 =?utf-8?B?ek9GSjF2M0M3WkhweFJ6VTJCeFhwb21IdHh0N0NGamhvYzVnRlNYeFMyRXJr?=
 =?utf-8?B?b2NzbkxEQjV5ZmpLY1FhbXFsdHE5cXdaN20wWFhlbGxzZzQ4WVhxbEltVzVs?=
 =?utf-8?B?bjVhSWVtTE9UY0pSeHcwaUd6TEtQZkFIR3pDMThSQ3BEQjJyU2FHV1hnanJu?=
 =?utf-8?B?NlRDV2dNb09tQTYyRnhaSFIzSC8vYnN5UmozY0lSVEhKZ21UekNhbEpVaHY4?=
 =?utf-8?B?Z05NUmJLeXFXaVFxQUorY2pVSFdSWmpTM2Z1NW9temY3cnpoQ0dHMzVyb2Zr?=
 =?utf-8?B?a3VMQVZycXpabXkwczVrNnFiOXJjUWRSOTNZWlk3MXdXUldyMHdzN3hlQ0xK?=
 =?utf-8?B?MVQwMXlFWW1Qbi9ZSzlCYlVBL1duVlFUVUc2SVJJbmRxM1hpakhRTUlyWTZM?=
 =?utf-8?B?TzR6M3RmMmV3SDl6dWZubk84ZFZQNXQxTTdOYWtDNmlYUkNwZ256dk1nc3JG?=
 =?utf-8?B?YVBDZE5LYmNFMWVlMTQweWtjamh4Qy95YWdmQTNLWlptQnJmcVAzUDJRblRk?=
 =?utf-8?B?VXQvd1JXK2g0YmJoYU85eXBJKzBXeThGWUZ0Q0JCUDRtVUo1WVFlSHdrb2Fm?=
 =?utf-8?B?bDJXY1NyZ1VwNTY5RmFBN0RoRmxTWmJlTGdQZmZCaXc5Qkk2aXVQdkp5Wk9Q?=
 =?utf-8?B?NzRKQmplRDBKSi82TzRQK3dxT1N2ZXBVOHpEUmUrSU9RWksrOU5EZFN6Qjdp?=
 =?utf-8?B?N2NnRDNIV1BhWjBsUmdNSnhRanFheThSVW1nY21VMzErRU0zQktSSVNZbVNy?=
 =?utf-8?B?WlZzNmZMdWJ3L2RDQmcrVUU0VzhjQ05ZajQxRDZ1bHM5OE8ydmJYTEFtOXZG?=
 =?utf-8?B?TDVpUlNEQUwwVC9uYmk4dnYyRjZRL2VrQzZFWFI4QVBjYWhFSmJ3R21rNkxI?=
 =?utf-8?B?VWFDYS9QckY5QW1HYjExcmRXNVZxd3F1V0xodWRRRWVtc2E5U3JNVmpNajRv?=
 =?utf-8?B?UngxVTRNaDU2a0swNUpGTG5LTXh5cVdLeXNMV1J2QXE3bERLaDA5VGg1S1JL?=
 =?utf-8?B?WWllSExwNFNKbjFZcUl5bzZhTS9BdWFzVWZnWVVEWUlHTDNGeHgzOCtFVmlK?=
 =?utf-8?B?VDB3WGZwVVZWSzN2RXB5NVp1WW8rcXFBK3AzRGVvUDdidWtnQzhGd2FKdk10?=
 =?utf-8?Q?wpd61ul14nmSZI3CaMt8nvfCt3XXH6vQqM1CJOx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(52116011)(366013)(38350700011); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFBtODlaK1U5K2pqbVozYXg4aHlRREhNVFdSNmhpS2VsZUtreFVaVEdDOGwv?=
 =?utf-8?B?Vzk4WWQ0UWNYUkxkNk91SVBXbWVINzZpTzQwRkU5WFVDWU1kNElvMmZGZ1Jo?=
 =?utf-8?B?VVppOGE3RWFvRlBIRjhuTGRqQll0aStyUHVDSzJKRFVyczFORkJFTW9TWnov?=
 =?utf-8?B?NnlGRmU5cVFNSm5KYmtOa3VnUWhHZzdydVloNnROQzZLbm5OdzIreUUyTWUy?=
 =?utf-8?B?Qis4YTdiM20wU1ZVR1l4ZGdHRlIvak5LN3Vnc05VdFlTK3RDQm5yVzg2N2lz?=
 =?utf-8?B?dWhBRGpodnJHYkdaTjBPNGlvWFNzbkRhdk9aVFZsakY3OGxLdkxBcDF2ZUd5?=
 =?utf-8?B?bmNaZGIvRkNJaU9sa29aNFREc3Q3YVg2N2xkaVRnL0hDY0o0REkwSXJRYWlW?=
 =?utf-8?B?eVBUWlNyY1dhOHVxazlJamhUaTFldlpuUzZxQlpPS3dVajVGcEhiNU4yb3RQ?=
 =?utf-8?B?KysrbjZtUHZlT2hqakp3S3JENGx0MmtIRDlCR1hFZ2dSV3RoRDQyV3oxVzBO?=
 =?utf-8?B?WEN1bFcwL1ovcWNHa3p3R29YSVVIVEdTU1paRHF6bDhnRXFJWmwxejZUVHA2?=
 =?utf-8?B?WkNQc0UzKzhJbFVEcVY5S09XUkNlTGtMbHQ3MGp0QzBtUVdrS1hDZGxiT21F?=
 =?utf-8?B?MnZTZU9Ia3p4QW9VVmQrRXNvVDI5VjhoQUdJRURsTDdPN0tGSjJ2djI5ZDh5?=
 =?utf-8?B?bDJIbFJ4Q2t0bmdIK2ZPWW1ta1NaUjVZQnZLTE1sZk9YOW8xZUpvYWM4ZDZi?=
 =?utf-8?B?amtFR0xjVU5PV0x6QnZRM1FTaE9LZ0pkc2dSR1FiZUtadXZNYzEyVkZQdzZM?=
 =?utf-8?B?Sm16N0lUK2xDbTEzc3lXVk93L0I0N1Qva0lmeEZzMW9ML1JZdXVzTXJlM2FX?=
 =?utf-8?B?ajVGZnBDOU9mVUZ4ZjZiZG1hVW0vZUd6a3VVdk1XV1NaR2Izdk0rcG5ITXBQ?=
 =?utf-8?B?K1I3bGNFUklIZUE5TjNnd2ducWhwVVBnTElKWEFpUXYweTVXZWZlL05GQWlx?=
 =?utf-8?B?YTJ6c2hpa1BDVEF6eklmdENROG5ROWUyU24vRHQyUVAzWGZad011dTU4TnZE?=
 =?utf-8?B?WTVHZm5zSFdUKzB3VHRjQ0hoeGhEY1Eva1RhVDFQRXc3WXlvMG5KZzUxS3J2?=
 =?utf-8?B?Unp1SkxyMC81b0NGYlhqSmh3M1VjRHZYU0l6SGZjWFVOMy9ndGNrYXdJOUp0?=
 =?utf-8?B?QnEwSWlTQWN3am9VTTBQanluQllSWGpBQTJiQ2c2NmtPU21GMnZ0dERWTlNh?=
 =?utf-8?B?djVpZk82ZkNoZGhTY1BSQXkxMHBzNG83NXBuTUVXd01QZ3g0OWdGTEJLQm5a?=
 =?utf-8?B?R2RwTXV6S1orUXI4bHJhblpmWDMxVzFvaU5pTktGY0t4bHpDR0N2UVp2WXRq?=
 =?utf-8?B?NE5oWklkUkdIWXJsd1loeUdMR3B4Wkd4S0ZsR1B2WkxyRGQ3Y1NYSUk2MlVr?=
 =?utf-8?B?TElpelJ3VEFoQ3dCWGk1UUlacTNkZ1hXQ1UzLzZuc0EzUzh2MXNkWUFGTnd2?=
 =?utf-8?B?Zm56RFVNaTlEVXhHalJjUCsvZWVVY2RrMzVEeHBULzJwOUJNMFo3TTFodkxr?=
 =?utf-8?B?Z0gyQ2VOS1lMbmp0c1RiTnVGZmlBdmxnVDdONUlWMG1BQ2Rsci9tSGxGV3FF?=
 =?utf-8?B?TDlhcmgrWUYwRSttaWlXT2d0SDlOYzJ6MXBiNlB5WFpnL2RSVncrVEFxNEpK?=
 =?utf-8?B?ODhKdjhxMmk4TEtHWFB5bVB3Qk14VEtaNkNPU2pmRklJZFF4OGFUUndabkdp?=
 =?utf-8?B?WHQzQTJ2L0FIWVJ1MXIzR1NoT1FPZG0zbjNJdk1iR2MyVktUL2RWWWkwZ2Fk?=
 =?utf-8?B?NVhRSU50ZWRLSDJoTzhPUTk2S0NpOEpGK0RiNDZNU0pGd2ZsZWwyVDV6bVNB?=
 =?utf-8?B?QVBIK0dmcWRYM1B3VFBycjRuYTU3V3ZOUWRUcmhlOUxpT282R2tBMDRtTHY4?=
 =?utf-8?B?Rm5JVThCOGxWZGVTblBIOTVuWWp0TjBTUzdQUVNyRkVuYkhMbU9BZzVLNFA3?=
 =?utf-8?B?SGw5azJ0dWREOW01eGNIUm9nSHkzM2ZoUDBnSkR0R0R3anlLUFZnUUhQcjRj?=
 =?utf-8?B?aUxneDltZElzMVY1ZU5adVgrOWt5WnEvWVcwQWRYTWJDVkJxSjNuU2lRekZ4?=
 =?utf-8?Q?pfTb1/apoOdpvNYWQlXiufSO8?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d645fe1b-47e3-4d85-d605-08dc941cd732
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:11:17.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKGN90jz+wS4LMReHuetAu5Ms484alQDa9EAO+2Lm3oEx95bV4qoJ5gfRMgO8Sl0cFxktQZIP1kJBJINdiY6+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

From: Douglas Anderson <dianders@chromium.org>

Port applicable parts of CrOS udl cursor implementation from 5.4 CrOS kernel fork.
 - removed legacy non-atomic udl_cursor_move, udl_cursor_set ioctl's implementation
 - modified udl_cursor_download to copy cursor content to the buffer from iosys_map
 - removed unnecessary cursor copy in udl_handle_damage
 - simplify code by making struct udl_cursor public

Cursor was tested on ChromeOS and Ubuntu 22.04 with gnome-wayland.

(cherry picked from commit efb4c23afa3e1de185a1a4f8ff5b7ec412aec0fe)
ChromiumOS fork at https://chromium.googlesource.com/chromiumos/third_party/kernel)

Signed-off-by: Haixia Shi <hshi@chromium.org>
Signed-off-by: Ross Zwisler <zwisler@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Łukasz Spintzyk <Lukasz.Spintzyk@synaptics.com>
---
 drivers/gpu/drm/udl/Makefile       |  2 +-
 drivers/gpu/drm/udl/udl_cursor.c   | 78 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/udl/udl_cursor.h   | 47 ++++++++++++++++++
 drivers/gpu/drm/udl/udl_drv.h      |  6 ++-
 drivers/gpu/drm/udl/udl_modeset.c  |  9 +++-
 drivers/gpu/drm/udl/udl_transfer.c | 36 +++++++++++++-
 6 files changed, 173 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/udl/udl_cursor.c
 create mode 100644 drivers/gpu/drm/udl/udl_cursor.h

diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
index 3f6db179455d..0abd04b0e829 100644
--- a/drivers/gpu/drm/udl/Makefile
+++ b/drivers/gpu/drm/udl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-udl-y := udl_drv.o udl_modeset.o udl_main.o udl_transfer.o
+udl-y := udl_drv.o udl_modeset.o udl_main.o udl_transfer.o udl_cursor.o
 
 obj-$(CONFIG_DRM_UDL) := udl.o
diff --git a/drivers/gpu/drm/udl/udl_cursor.c b/drivers/gpu/drm/udl/udl_cursor.c
new file mode 100644
index 000000000000..594bb3b6b056
--- /dev/null
+++ b/drivers/gpu/drm/udl/udl_cursor.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * udl_cursor.c
+ *
+ * Copyright (c) 2015 The Chromium OS Authors
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/iosys-map.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "udl_cursor.h"
+#include "udl_drv.h"
+
+void udl_cursor_get_hline(struct udl_cursor *cursor, int x, int y,
+		struct udl_cursor_hline *hline)
+{
+	if (!cursor || !cursor->enabled ||
+		x >= cursor->x + UDL_CURSOR_W ||
+		y < cursor->y || y >= cursor->y + UDL_CURSOR_H) {
+		hline->buffer = NULL;
+		return;
+	}
+
+	hline->buffer = &cursor->buffer[UDL_CURSOR_W * (y - cursor->y)];
+	hline->width = UDL_CURSOR_W;
+	hline->offset = x - cursor->x;
+}
+
+/*
+ * Return pre-computed cursor blend value defined as:
+ * R: 5 bits (bit 0:4)
+ * G: 6 bits (bit 5:10)
+ * B: 5 bits (bit 11:15)
+ * A: 7 bits (bit 16:22)
+ */
+static uint32_t cursor_blend_val32(uint32_t pix)
+{
+	/* range of alpha_scaled is 0..64 */
+	uint32_t alpha_scaled = ((pix >> 24) * 65) >> 8;
+
+	return ((pix >> 3) & 0x1f) |
+		((pix >> 5) & 0x7e0) |
+		((pix >> 8) & 0xf800) |
+		(alpha_scaled << 16);
+}
+
+int udl_cursor_download(struct udl_cursor *cursor,
+		const struct iosys_map *map)
+{
+	uint32_t *src_ptr, *dst_ptr;
+	size_t i;
+
+	src_ptr = map->vaddr;
+	dst_ptr = cursor->buffer;
+	for (i = 0; i < UDL_CURSOR_BUF; ++i)
+		dst_ptr[i] = cursor_blend_val32(le32_to_cpu(src_ptr[i]));
+	return 0;
+}
+
+
+int udl_cursor_move(struct udl_cursor *cursor, int x, int y)
+{
+	cursor->x = x;
+	cursor->y = y;
+	return 0;
+}
diff --git a/drivers/gpu/drm/udl/udl_cursor.h b/drivers/gpu/drm/udl/udl_cursor.h
new file mode 100644
index 000000000000..6a848accc106
--- /dev/null
+++ b/drivers/gpu/drm/udl/udl_cursor.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * udl_cursor.h
+ *
+ * Copyright (c) 2015 The Chromium OS Authors
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _UDL_CURSOR_H_
+#define _UDL_CURSOR_H_
+
+#include <linux/module.h>
+#include <drm/drm_crtc.h>
+
+#define UDL_CURSOR_W 64
+#define UDL_CURSOR_H 64
+#define UDL_CURSOR_BUF (UDL_CURSOR_W * UDL_CURSOR_H)
+struct udl_cursor {
+	uint32_t buffer[UDL_CURSOR_BUF];
+	bool enabled;
+	int x;
+	int y;
+};
+struct udl_cursor_hline {
+	uint32_t *buffer;
+	int width;
+	int offset;
+};
+
+extern void udl_cursor_get_hline(struct udl_cursor *cursor, int x, int y,
+		struct udl_cursor_hline *hline);
+extern int udl_cursor_move(struct udl_cursor *cursor, int x, int y);
+extern int udl_cursor_download(struct udl_cursor *cursor, const struct iosys_map *map);
+
+#endif
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 282ebd6c02fd..ccd813bec1a9 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -21,6 +21,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_plane.h>
+#include "udl_cursor.h"
 
 struct drm_mode_create_dumb;
 
@@ -60,6 +61,7 @@ static inline struct udl_connector *to_udl_connector(struct drm_connector *conne
 	return container_of(connector, struct udl_connector, connector);
 }
 
+struct udl_cursor_hline;
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
@@ -74,6 +76,7 @@ struct udl_device {
 	int sku_pixel_limit;
 
 	struct urb_list urbs;
+	struct udl_cursor cursor;
 };
 
 #define to_udl(x) container_of(x, struct udl_device, drm)
@@ -97,7 +100,8 @@ int udl_init(struct udl_device *udl);
 
 int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
-		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
+		     u32 byte_offset, u32 device_byte_offset, u32 byte_width,
+		     struct udl_cursor_hline *cursor_hline);
 
 int udl_drop_usb(struct drm_device *dev);
 int udl_select_std_channel(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 7702359c90c2..21594144fec5 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -26,6 +26,9 @@
 
 #include "udl_drv.h"
 #include "udl_proto.h"
+#include "udl_cursor.h"
+
+#define UDL_COLOR_DEPTH_16BPP	0
 
 /*
  * All DisplayLink bulk operations start with 0xaf (UDL_MSG_BULK), followed by
@@ -204,6 +207,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct drm_rect *clip)
 {
 	struct drm_device *dev = fb->dev;
+	struct udl_device *udl = to_udl(dev);
 	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret;
 	char *cmd;
@@ -225,9 +229,12 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		const int byte_offset = line_offset + (clip->x1 << log_bpp);
 		const int dev_byte_offset = (fb->width * i + clip->x1) << log_bpp;
 		const int byte_width = drm_rect_width(clip) << log_bpp;
+		struct udl_cursor_hline cursor_hline;
+
+		udl_cursor_get_hline(&udl->cursor, clip->x1, i, &cursor_hline);
 		ret = udl_render_hline(dev, log_bpp, &urb, (char *)vaddr,
 				       &cmd, byte_offset, dev_byte_offset,
-				       byte_width);
+				       byte_width, &cursor_hline);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 5ff1037a3453..ba3a3ae08943 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -11,6 +11,7 @@
 
 #include "udl_drv.h"
 #include "udl_proto.h"
+#include "udl_cursor.h"
 
 #define MAX_CMD_PIXELS		255
 
@@ -43,6 +44,19 @@ static inline u16 get_pixel_val16(const uint8_t *pixel, int log_bpp)
 	return pixel_val16;
 }
 
+static inline u16 blend_alpha(const uint16_t pixel_val16, uint32_t blend_val32)
+{
+	uint32_t alpha = (blend_val32 >> 16);
+	uint32_t alpha_inv = 64 - alpha;
+
+	return (((pixel_val16 & 0x1f) * alpha_inv +
+		(blend_val32 & 0x1f) * alpha) >> 6) |
+		((((pixel_val16 & 0x7e0) * alpha_inv +
+		(blend_val32 & 0x7e0) * alpha) >> 6) & 0x7e0) |
+		((((pixel_val16 & 0xf800) * alpha_inv +
+		(blend_val32 & 0xf800) * alpha) >> 6) & 0xf800);
+}
+
 /*
  * Render a command stream for an encoded horizontal line segment of pixels.
  *
@@ -74,6 +88,7 @@ static void udl_compress_hline16(
 	const u8 **pixel_start_ptr,
 	const u8 *const pixel_end,
 	uint32_t *device_address_ptr,
+	struct udl_cursor_hline *cursor_hline,
 	uint8_t **command_buffer_ptr,
 	const uint8_t *const cmd_buffer_end, int log_bpp)
 {
@@ -81,6 +96,9 @@ static void udl_compress_hline16(
 	const u8 *pixel = *pixel_start_ptr;
 	uint32_t dev_addr  = *device_address_ptr;
 	uint8_t *cmd = *command_buffer_ptr;
+	const uint32_t *cursor_buf = cursor_hline ? cursor_hline->buffer : NULL;
+	int cursor_pos = cursor_buf ? cursor_hline->offset : 0;
+	int cursor_width = cursor_buf ? cursor_hline->width : 0;
 
 	while ((pixel_end > pixel) &&
 	       (cmd_buffer_end - MIN_RLX_CMD_BYTES > cmd)) {
@@ -107,6 +125,11 @@ static void udl_compress_hline16(
 					(unsigned long)(cmd_buffer_end - 1 - cmd) / 2) << log_bpp);
 
 		pixel_val16 = get_pixel_val16(pixel, log_bpp);
+		if (cursor_buf && cursor_pos >= 0 &&
+			cursor_pos < cursor_width) {
+			pixel_val16 = blend_alpha(pixel_val16,
+				cursor_buf[cursor_pos]);
+		}
 
 		while (pixel < cmd_pixel_end) {
 			const u8 *const start = pixel;
@@ -116,12 +139,19 @@ static void udl_compress_hline16(
 
 			cmd += 2;
 			pixel += bpp;
+			cursor_pos++;
 
 			while (pixel < cmd_pixel_end) {
 				pixel_val16 = get_pixel_val16(pixel, log_bpp);
+				if (cursor_buf && cursor_pos >= 0 &&
+					cursor_pos < cursor_width) {
+					pixel_val16 = blend_alpha(pixel_val16,
+						cursor_buf[cursor_pos]);
+				}
 				if (pixel_val16 != repeating_pixel_val16)
 					break;
 				pixel += bpp;
+				cursor_pos++;
 			}
 
 			if (unlikely(pixel > start + bpp)) {
@@ -160,6 +190,8 @@ static void udl_compress_hline16(
 	*command_buffer_ptr = cmd;
 	*pixel_start_ptr = pixel;
 	*device_address_ptr = dev_addr;
+	if (cursor_buf)
+		cursor_hline->offset = cursor_pos;
 
 	return;
 }
@@ -173,7 +205,7 @@ static void udl_compress_hline16(
 int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
 		     u32 byte_offset, u32 device_byte_offset,
-		     u32 byte_width)
+		     u32 byte_width, struct udl_cursor_hline *cursor_hline)
 {
 	const u8 *line_start, *line_end, *next_pixel;
 	u32 base16 = 0 + (device_byte_offset >> log_bpp) * 2;
@@ -194,7 +226,7 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 	while (next_pixel < line_end) {
 
 		udl_compress_hline16(&next_pixel,
-			     line_end, &base16,
+			     line_end, &base16, cursor_hline,
 			     (u8 **) &cmd, (u8 *) cmd_end, log_bpp);
 
 		if (cmd >= cmd_end) {
-- 
2.34.1

