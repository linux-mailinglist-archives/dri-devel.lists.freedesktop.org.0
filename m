Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DBAA772B
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 18:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B883B10E952;
	Fri,  2 May 2025 16:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WZggzqtn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B510E952
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 16:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VostExn/djw0Gifan/5a8pf3/bVRF2aIepuH2zkU3GacxwJLeM16KOZg9Y4GqxsFRaFhKWuRNDtIVbaA2D/l/UquNHFvBMEMCq8FhelveTuQSeyr5fVljlspFfzX7ytdoee4wJSaqdkcvpvnaxLKI9qroxotOCI1xTojthzpNkLJADnGfec6IyVnTJ6/M8xbUMqBzKOJxKlF28ZR0m5gSm0ET+U5OoPE0RSVd2IIMlTV39wmQ5TdVvL3TlrSvnVuUqg+Pi1IBIkx3Tu6vZ5BjoBmRW6wzpmKhGudCVUxLZ6o2ac/bO2Jz5fFQ+fSghb4hlZgijSSyQPb49J34iRidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvYtjugsMFpf4fERGzchNHI3Pg4veDBWmxmgbrL+J7o=;
 b=lEIr1kkXzmNXYP7CqpYg0avcXRpfhO+fx0ohzxC8stKPdy84k2yrW/s7XP3mIZ1+yvA+QggfKwnHlKytvVupFuKq42B51gxp2/1NqDJEm9m0aOKGvz1z4C8kawrQkP2lUAv1ZhetDBSYy0EzHc+MXbyX5UZWE9KJ8YIOvWapjDjF6gK9XCMjMPeTl78XzWnqBxa+MfHtWKgfG4N83rgxFVvNuWJPhQRMCuHdXDTlqudb7krnb2YyNs2k5ZPOr++IhLM+ujcU61UftA7Nbr/w4+9uE1ta1z7Q0K6F/8Yw0OFc2ICLJFXMFueUvj2jRLqtyCVl0/7iS5XxYGyMyvenlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvYtjugsMFpf4fERGzchNHI3Pg4veDBWmxmgbrL+J7o=;
 b=WZggzqtndf5rFEtkQAWfvCGc08rQJXGKlw7jyJLeFmnmzgxmVsjPHTCYLG5UoIeiimf8oVqcsNqPLYKvfKLqKpcd4pavMfpxYJxYu/7CnmgVHokYBFJlA0JDHkYFK+G4d+S16JMok+00Or4qpWtEupab9Hck/klBvMEYTphEZ2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB9345.jpnprd01.prod.outlook.com (2603:1096:604:1d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 16:24:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 16:24:29 +0000
Date: Fri, 2 May 2025 18:24:17 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 0/9] media: renesas: vsp1: Add colorspace support
Message-ID: <aBTxsS71-4gBz8WK@tom-desktop>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
 <aBSAgR15PoPVS9Ic@tom-desktop>
 <20250502161657.GD15945@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502161657.GD15945@pendragon.ideasonboard.com>
X-ClientProxiedBy: MR1P264CA0193.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 25932513-719e-4039-a4d2-08dd8995d02a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NoFzgd3mOF3w/bHeXU7GcljMG8gRZB/3siue95cpkOxuh0dMa8eCz90+OucN?=
 =?us-ascii?Q?8kopOV2KKRVP2LD8bwgx3DfHcSzRHHEhpaSdqIjhneHp9ZGDKalY9lyq8dBL?=
 =?us-ascii?Q?S0p4mGysFH+SI2prQWK1s7+fZb7Kcv47392GR4j4MLuc3d/qK77wyAHCdkcj?=
 =?us-ascii?Q?INmxV+Q2eFl6IyWvxW1T1v6Niiv1VDy7eazz+3qvIZMgrWDKLXxROZXhuC1n?=
 =?us-ascii?Q?SBBm/RJyboVxeLC+q+XjqMa0M20gDit0cyl+Z2NMsKPU0AycM0lOZFg9Y+WC?=
 =?us-ascii?Q?mLHa7cqNUR9EzXiAJI+ZL/EAt+GyLaNdPWJSchO+3zpeWTskhPne5PzdxFZs?=
 =?us-ascii?Q?IXhFZaKHKnnQSpSPYNTE/60R0lQIZmk1x0NeAwkdrZFOAMP+0ov4cHhRqKEM?=
 =?us-ascii?Q?MurTiln6PirmGQ8BmyFuO0rKV2FLELPJHoL95W8pCMop5eb57wG0EL9Uj1o5?=
 =?us-ascii?Q?nmESXaWqrJq1/kGl7E23QuD5U1HworEGVSsiLe6XGrcibrWmQ97xq3p/NdtZ?=
 =?us-ascii?Q?9/rDK/60ccws584OqddL6LaTryV21pHFqO5EZ/PusyF6dTDoLS5clVO5MWTL?=
 =?us-ascii?Q?qjF5veaE0NKY4J6MfF5isOB3LTVToReK8NK3Y8DyFPB5JA+hu8nK6Fhasny/?=
 =?us-ascii?Q?+vLj/eLBczqIG8GZPDxQkiQUaCk55xtxGmjZhQnLpiQ0c6r+zux1O7ypaM+v?=
 =?us-ascii?Q?Y+aUtHjNmF06QDUys6R1TM/tpAhOXMwOMKchH56IJp63DECs57hwuPx36M55?=
 =?us-ascii?Q?ago/XoHCIi48LxL5oQeJGf7o83fLJTzPl4A6FkucPwBz5jPxmnZK9PjvHwi5?=
 =?us-ascii?Q?BU+Yq4oEYtsqwYiiNLAcCwwT+DQy+kp47Z+xdA9IyLwR6NFbEqAb703VP29o?=
 =?us-ascii?Q?tAEJFNMIEGUQHwD0d1YzplgbuTP2uy/w5dtpw/ZPHMZFVIfx+nq/uz87RYrY?=
 =?us-ascii?Q?4T+xHLn7D3GONUpnVrUhsRm9tmIiqOnHo9lan419QyAgk2jN228mNCnu5c51?=
 =?us-ascii?Q?PmekOw/psZxJoIz/F1p4FlPjKXnkbJb7m4nilUoiexD/wQeYOfzPpUS0qtFi?=
 =?us-ascii?Q?7YeQydkLImJQ55L36qo3Z5+YWxiFok4fVhkUT82a5N1fw69xuOW1uxUk/uX9?=
 =?us-ascii?Q?65hoxOTrpzLaAs9dliS0zSfSPLbeD+KyJWAnPyGFkMwrrHNPxTArRvLkcHSc?=
 =?us-ascii?Q?iuDEbGuC6v2K9fSxesJwsxADwHQxPb5BUEApbHybaoza6DyCpVphxYcLYWqo?=
 =?us-ascii?Q?HwUoa+f6ZC6cj3pWgSVbS9nFY9f2hninh3Nk0649wE/5VmQr22yRzcSSnkLX?=
 =?us-ascii?Q?+iWUo/LyVPnYJvZLyVvlwpZNtTUUULdsFmDZUEDID/jx70YS4sONcOkxIpkz?=
 =?us-ascii?Q?ccuZSHkuF+y1oAw9JQ9ZLTI+GfvmOWFmibMGHOFXdTU3ymkVJONNcpIh/BIG?=
 =?us-ascii?Q?AVVDUxQGetw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9MP8VpYGL5SOkJa0+rwTWPQdHaqlt0nt/CtBKPnQmKaFg9XAL52K7wMMVnDR?=
 =?us-ascii?Q?XJZWWs+I7h6zRDui8ApSQWkvlXUvk5Ri3f0KKgJ74flybwmAOjmXWBSR3zDt?=
 =?us-ascii?Q?xvaGcbZPcoflkhY8cbhzeLB+hDwvBfXQoSdN9DQygk9deqXPDt2zZ/FvRZ3B?=
 =?us-ascii?Q?cgAJFPzy1Q+fXlnKVZjDfNtrsKelZsWnQY5ciV8TRmILHMLlTdKMGOxMVlwq?=
 =?us-ascii?Q?pKi3WaODoWl1fbF7oqmSeFaj69b5MtDkRXJ4GGEgYe/kb6o7yJkzCLeaw54G?=
 =?us-ascii?Q?5cIpZGBjtWZPznYgYEPhCV3ejEi75HYnlEvVKNYBbOmxS1WoL8KaxTk86pvs?=
 =?us-ascii?Q?94dPdO1pFNZfIEeqYpTToe3ld3uLxivmzHSE5XGP2qIy2AhcrZFlHOmZelcj?=
 =?us-ascii?Q?GF7i4H3MHfdQaC3ZX31tUpxg3Chi9MMECvibjRf5k7xLFamnSPwJ73sLECBt?=
 =?us-ascii?Q?L8kHaCOG7bCIj0d/AUr1jkZ2EOEg1Gceo3YX9iL14y1FQt0rO9e/adlNNrJF?=
 =?us-ascii?Q?47lYpqM5DiLOoJMjsEbTKNVoecaiVIe2zIyeq3AvwB6Fw1VAXee+LzURzm3Q?=
 =?us-ascii?Q?0SIUeS9tq5Airw+JimHcYxV2AOZjmS8R2w4iD3mzCSUI5SbvwCGjqhbgEkRx?=
 =?us-ascii?Q?/w9/GNrHhS+MJ4wkF0DUzi61TOsJhmEyEjNTotmvb/zaHAP5H9e2fcZUzmDm?=
 =?us-ascii?Q?7sdDkiIKPD0/nHWCFwcEeLRLiLyyQrH0voaFG+W+xUz0UJrwuCAzch3L92tj?=
 =?us-ascii?Q?lWLjpsHou0i57QGYKa6eiT7AdOACQJK12QEuLfP3enkDjvRnXO4u42C60khP?=
 =?us-ascii?Q?uxTajNWQC8aKBnoaZWO1tULILgihqWBrzFhP9FZJp6SPNaOfmmheTaqM1S0j?=
 =?us-ascii?Q?m8Ncoid/UrupzoLTg0I71UDBfRilArdgo7CFET6CQSkjCFSQmwU1qYMvUkFc?=
 =?us-ascii?Q?Cd6YlqLdZW5UpPXM9aP7qTulUFiPlNMfw0MpCz6osZ8lxaXTaNs52pQJUk8s?=
 =?us-ascii?Q?+NS0Q0E3XfkkGL3btn2Ihv3WGtjGA7x1kMXIHTsZSz+hV8EgMv+lubFa9tv+?=
 =?us-ascii?Q?6NhvEZTa1BfaamXoyhSbkujGOcV4/C+zVQvROIfTun24vkuKOj9AJYJjEm0q?=
 =?us-ascii?Q?DK30ogTAfrQNQQu3AxkybpTD0w1vsZEf1U/VGP7JM17PmsVflxEtD2ZnanlN?=
 =?us-ascii?Q?KGUQ8oYwuIOoNGZJZIm8sBXnRCCE5UdwmBw9npM1yNPLhyEOpVvdBHXRviYy?=
 =?us-ascii?Q?cQ32qa+yqMpY0kNEIUMQPhj+YqOfgLHHJ4TP3tEToZl6kPtX6CA6b8+W/2VI?=
 =?us-ascii?Q?92rOfo9nVsqW/izUwE2c0LJSnmeNARsYsT/0iZEM2qZJSBvwszUE+s/84U5e?=
 =?us-ascii?Q?H10v/EaFMdb1JuiZQnpJ/AGRho5cav2oGt9ypdH3TKQDVQy2Z6CvicP/Oynm?=
 =?us-ascii?Q?nNZfDI29K4nwV7084snD5qpPKPv7Pq+EbU0TukiUF1aylazPlE7BGeFsxZL4?=
 =?us-ascii?Q?YsvDTQHbg0pd0a5zHxDHuPj80rYpPJW6Y7aAAle+FzrCrEozcb1yrfCX0k6S?=
 =?us-ascii?Q?IbpnyKSBg6YZDGqtuM7xOy4R2xgJPQpiE3Z3yG9RTRapgYY+W1Xy0OlQZ/zh?=
 =?us-ascii?Q?lcEgM+uQ/0k0l8l44JeUuTk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25932513-719e-4039-a4d2-08dd8995d02a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:24:29.5328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayADnxbCIlCDb/O6OSz4higdSRe+XpjUtYGvs2CF+hEH67GrWT17gpATACzMlGYPywOInUxmBJpNOGuIyY6jFKDcG7l3aB2e3uoZV+oL0PinXSDtMcKxg2yEmz520fEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9345
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

Hi Laurent,

On Fri, May 02, 2025 at 07:16:57PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Fri, May 02, 2025 at 10:21:21AM +0200, Tommaso Merciai wrote:
> > On Wed, Apr 30, 2025 at 02:28:55AM +0300, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This patch series extends the VSP1 driver with colorspace support. It
> > > turns out that the VSP RPF and WPF entities can convert between RGB and
> > > YUV, a feature that we have failed to test so far. The hardware support
> > > BT.601 and BT.709, in both limited and full range. Proper configuration
> > > of colorspace is crucial for accurate image rendering.
> > > 
> > > Patch 1/9 starts by implementing pixel format enumeration in the driver,
> > > a feature that was surprisingly missing. Patch 2/9 then continues with
> > > another fix, restricting the creation of the HSI and HST entities to VSP
> > > instances that include them. Following with another fix, patch 4/9
> > > addresses format setting on the RPF and WPF source pad to disable HSV
> > > <-> { RGB, YUV } conversion, a feature *not* supported by the hardware.
> > > 
> > > After those initial fixes, patch 5/9 starts implementing colorspace
> > > support by reporting the related information to userspace. The driver
> > > currently hardcodes limited range BT.601 when programming the hardware,
> > > so that is the value that the patch reports to userspace for YUV
> > > formats. Patch 6/9 makes the YCbCr encoding and quantization
> > > configurable, finalizing colorspace support in the VSP driver.
> > > 
> > > The next three patches are new in this version. They proceed with
> > > exposing colorspace configurability in the API exposed to the DU DRM
> > > driver in patch 8/9 (with 7/9 performing a small refactoring first).
> > > Patch 9/9 then updates the DU driver accordingly, to create plane
> > > colorspace properties and wire them up to the VSP.
> > > 
> > > The series has been tested with the vsp-tests suite and the kms-tests
> > > suite. Patches that add CSC support to the vsp-tests suite have been
> > > posted in [1], and can be found in the vsp-tests git tree in [2].
> > 
> > I've tested this series with out of Tree patches with RZ/G3E.
> > Basically I've added the equivalent of:
> > 
> >  - drm: rcar-du: Create plane color properties
> > 
> > On drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > 
> > Tested using modetest:
> > 
> > modetest -M rzg2l-du -s 48@46:800x600-60.32@YU16 -d -P 39@46:512x300+200+200@YU16
> > 
> > modetest -M rzg2l-du -w 32:COLOR_ENCODING:0
> > modetest -M rzg2l-du -w 32:COLOR_ENCODING:1
> > 
> > modetest -M rzg2l-du -w 32:COLOR_RANGE:0
> > modetest -M rzg2l-du -w 32:COLOR_RANGE:1
> > 
> > Where 32 is the id of the primary plane.
> > 
> > Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thank you for confirming this works on RZ. Unfortunately your Tested-by
> tag came after I submitted the pull request, and the patches got merged
> without it. It however gives me confidence that the code is working as
> intended.

Ouch, sorry for being late.
No worries, hope this help. :)

Thanks & Regards,
Tommaso

> 
> > > Updates to media-ctl and yavta to support setting colorspace on video
> > > capture devices and on subdev source pads have been merged in the
> > > respective projects, make sure to use the latest master branch if you
> > > want to run the tests.
> > > 
> > > The series has also been tested with the latest v4l2-compliance. The bad
> > > news is that the test flags 56 errors when run on a Renesas Salvator-X
> > > 2nd version board based on r8a77965:
> > > 
> > > Grand Total for vsp1 device /dev/media1: 757, Succeeded: 701, Failed: 56, Warnings: 0
> > > 
> > > The good news is that none of those are regressions, quite the contrary:
> > > without this series applied, the total number of failures is 95, and the
> > > diff shows no new error. I will therefore address those issues
> > > separately.
> > > 
> > > I would like to get patch 1/9 to 8/9 merged in v6.16, to then merge 9/9
> > > in v6.17.
> > > 
> > > [1] https://lore.kernel.org/linux-renesas-soc/20250409004758.11014-1-laurent.pinchart@ideasonboard.com
> > > [2] https://git.ideasonboard.com/renesas/vsp-tests.git/log/?h=csc
> > > 
> > > Laurent Pinchart (9):
> > >   media: renesas: vsp1: Implement pixel format enumeration
> > >   media: renesas: vsp1: Make HSI and HST modules optional
> > >   media: renesas: vsp1: Fix HSV format enumeration
> > >   media: renesas: vsp1: Fix media bus code setup on RWPF source pad
> > >   media: renesas: vsp1: Report colour space information to userspace
> > >   media: renesas: vsp1: Allow setting encoding and quantization
> > >   media: renesas: vsp1: Name nested structure in vsp1_drm
> > >   media: renesas: vsp1: Expose color space through the DRM API
> > >   drm: rcar-du: Create plane color properties
> > > 
> > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  15 ++
> > >  drivers/media/platform/renesas/vsp1/vsp1.h    |   1 +
> > >  .../media/platform/renesas/vsp1/vsp1_brx.c    |   9 +-
> > >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  22 +-
> > >  .../media/platform/renesas/vsp1/vsp1_drm.h    |   8 +-
> > >  .../media/platform/renesas/vsp1/vsp1_drv.c    |  59 +++---
> > >  .../media/platform/renesas/vsp1/vsp1_entity.c |  22 +-
> > >  .../media/platform/renesas/vsp1/vsp1_entity.h |   2 +
> > >  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  11 +-
> > >  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 188 ++++++++++++++++--
> > >  .../media/platform/renesas/vsp1/vsp1_pipe.h   |   5 +
> > >  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  29 ++-
> > >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  51 ++++-
> > >  .../media/platform/renesas/vsp1/vsp1_sru.c    |   9 +-
> > >  .../media/platform/renesas/vsp1/vsp1_uds.c    |   9 +-
> > >  .../media/platform/renesas/vsp1/vsp1_video.c  |  50 ++++-
> > >  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  29 ++-
> > >  include/media/vsp1.h                          |   4 +
> > >  18 files changed, 442 insertions(+), 81 deletions(-)
> > > 
> > > 
> > > base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> > > prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
