Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97492ACEBDD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0B10E7D4;
	Thu,  5 Jun 2025 08:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="g7EBvqMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B910E5F7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsY7eky3SWZ85A0u+lfhtSSgr+tEuMitEO6cVIoY4Gmc6ofiPXhQiziT3G5pGjt3eAqigoQzBEjIVBQmzISNifV/CoZHdX1rma1nQXbhvPZNuYTyKQchbiI23ekDaOncPmJgnXGwIQcID64V8ZUimfQ8+5zkKsFceDy1R0UjW3+yZ0FdyFyRYO9GoJhZJXgoAQG2eZTQuk+KYbOic77hEiwua+E3yNrSED8DAS2NxLxGkS98iV/FDQe/4KwdonaxbIMkuXQ6ER8tepxgMfsyCjDGEZPgRmw6Ericte7llCD2DOKaUbjw6AxNNCHZI02CB5cb9oNja7+X5Bnkowl1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44r08ZybhomZBa6S9DuwfCEIir5yH4HiNHxrIFogplI=;
 b=lCOfZROY1DbweYp5IZA+8b1XRHMX4TqNTcSJvU9ZjMybhbh0pgOqm3DVDFbyuU2AFD2kkch0R4gPKFnbrYSoEWcn/SCxLnBVaNy0qBVy1GGmmXluJJLbPH9T2TV714dzTRCLa/JFc3Jsy7WyUg5TmDu0Bg55pmN/OJj/Dv+1qv1U01G3Cjw7myNqzjA9JSZUAoJScdYc1fp6wN+2fHYPOFeM61l0SOP6yWEAzc/nsO3BlxNPbcQjttrfWBEFqUFkJD/wHk6hFEJy4ZOz8RtmERG/WtvGm21ibnjNxam+lVJate00fb1VLp9qcWamqX+rEDd1KiezDiEUu949Z6Tz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44r08ZybhomZBa6S9DuwfCEIir5yH4HiNHxrIFogplI=;
 b=g7EBvqMF9HhNLm233urbtjOtYQJHHVENnKJEqucggzi7PdwcaCcwRA2reVAufqSiE5sV7IGy0f57Rw5flEUcaQ7JHfHas5zpIX6LwqTAJrpENCrYCbpnJpXr8DJG6Bd6WVXpGX4LAIBw1QKJl/JfhEUvQSk15L1qX1F02Wh7hNs=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYRPR01MB13829.jpnprd01.prod.outlook.com (2603:1096:405:217::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.38; Wed, 4 Jun
 2025 12:08:49 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 12:08:49 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet
 size
Thread-Topic: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return
 packet size
Thread-Index: AQHbyydYZROipDs4Mk6V13hnElvTOLPy9BEwgAAHgeA=
Date: Wed, 4 Jun 2025 12:08:49 +0000
Message-ID: <OS3PR01MB83195CC101339CA1ECDCD6C78A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <20250522143911.138077-3-hugo@hugovil.com>
 <OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYRPR01MB13829:EE_
x-ms-office365-filtering-correlation-id: 4c347552-c163-4f25-a011-08dda36090ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?OjIXP0HJdwe7qUNRt4F2lNDe7ClmbcbGcO1Un21IR/Si2gthrac8ZI9LR2+N?=
 =?us-ascii?Q?zD/qqc86zvfglIgOMob587tgkRJk66LZwAn1Xrzg4uX8CnMRHdcpVDhDAM/h?=
 =?us-ascii?Q?khHqQkIK7boZjwhxkNO4YamZgV5VkppBWB+GhIk5l4sgrOnF06AQFOstzji4?=
 =?us-ascii?Q?pAQfzBTGBnTVnWyTWN9hAXfB8mjcj7QMPdNTcCD52krTDTygIMBwdvbknyTM?=
 =?us-ascii?Q?SYXIKz/oEk7kKfK68rnzmKtgBAtU0K2dWQWwBINWdBT9vsFwWnupETgd5Q/Q?=
 =?us-ascii?Q?PpbwKfMCvUZANTzS33yA2JdHSR3dgzJeLKbbGyO1M206/1oTwB+X17PaEQss?=
 =?us-ascii?Q?JLXulmhoI0pqQpdAzBejYluj3eKZjOCelsAdgyy0p7g1EfWaGKepxmAgU+lU?=
 =?us-ascii?Q?5Ow9uw2ZujP8oUK/utrGVPkMx5xiamIHWAex8MnNxiO703nQU8ZlYDXdZB3q?=
 =?us-ascii?Q?Uw12oIqd+5hFdYIXTrK0hzZeRHpSCkg60gP4tC7EpMcoZx/DHvKGsOwSPyQf?=
 =?us-ascii?Q?RxAhAmAPpC16XPPcyEcQ3BxQUEiyNfYqGxLe8n7pmpHGb/S0/sScR8rh6CBN?=
 =?us-ascii?Q?O6DP5kNQmMYoeUimtTqK+WwpnOlI+v18C6QO+I6ayhiv3BwHzQXu3fMK0Or8?=
 =?us-ascii?Q?jiWjyMlM+dE7Uds1exy/6ZKUBuxOLPmAYJvc2FuaX0wl9OkxvN1CXZbyuq3M?=
 =?us-ascii?Q?3KZUBhGS9anJU4+fQhGLNDjEoFdoySdo7YqaRYXJDim/29S/aa6cJzsG6K5r?=
 =?us-ascii?Q?dv8IzK8L93G2rQ3Bf4tEl3RYxluRO1+5t2XUlRHIy0la5ovVOBoxOZoew4AS?=
 =?us-ascii?Q?k7FpxLRK5qH5Jv4+G/5C5SlLCBy9zlHuqE/pKIdwzkDX5bK+KsPdANaldcqK?=
 =?us-ascii?Q?khS8RoQptZmHzdcxJWwNzBnBIfkcTgOZwpn7KGKn1+ey3KaejVRwe57r+fzJ?=
 =?us-ascii?Q?bS6//mPz6YVgBdajmS1upbTzDSq5+aMDgk6FZsxDq2q9JDp1vw5F1SphV/A1?=
 =?us-ascii?Q?Qe7dPpMupbzF/tCmXvYNm1tKZxGslCG+L7r3EWqtJBlRG3BBtq8JPN5yicMA?=
 =?us-ascii?Q?QoNZnFDlVg6p3kQzExP3V+zuScBmmrg5IEFG7WQQzM1W61Lbk7t+NwqtipQJ?=
 =?us-ascii?Q?B0UbViudOlUac1hBNwDGZfr8KilZ3rw+JDHWa7V2sERSXuH8IJuJbm7bGM31?=
 =?us-ascii?Q?PpITYRheXStDXpKBOMqlv5rFOJAnqDB/7tbjj6hnDc9L0Blc6FhJQtBq7dL1?=
 =?us-ascii?Q?r9cYn5KaFXEh2gJkqWRQu0vEI8JIwQTVxB0fnYLx74eLs+foOv79ooFX4eoC?=
 =?us-ascii?Q?dGidtWg8h4J9fJL0bqQozXHRy7Ii9tFN6VmPqAQG/Idvgopf3Et8J/hwucjy?=
 =?us-ascii?Q?UAOMiQwXugUvZA+CJQm/ldiK6qDyLSuBnKaP1TZbDUJj4KALc0nWLxevmBJD?=
 =?us-ascii?Q?9YO5cP++4RAeM8GV6bFlZATasNYjm6fjgk+qvrObLP+sz+pRuhXauw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PYndG+OXqEhRQvJewDWDFjVahoaClSnLXL+Os4RS6xgdSD1PTJF1wDG4ksNG?=
 =?us-ascii?Q?peAIPlLL3e5aTUVCPmyauar7VnQY1la/5v0CJ+9fudZi9ZSyOZHQw258nrRK?=
 =?us-ascii?Q?m1NvJXO1EN+Vw3EGzT4wGrcFVSc1i11RwhheeNpr4WMU13YbsWdD6PKpD+Ou?=
 =?us-ascii?Q?xytYwupknQNZNS901OIY0w7HhpUNrrvgBWtAJxn5qdAVbjKJ+o5Zebdrihq1?=
 =?us-ascii?Q?m44Et0wJKoAm9H2o/m18LKivM1NIytpRuxzWpQ9BGcq8a2V+q0DqNG4IyTS3?=
 =?us-ascii?Q?e4kQv4pkSNLsSEXB5RDNtYotZJu3Lf+dd4vq6OawNQwcRMCAMn7GdYMxQ8Rp?=
 =?us-ascii?Q?sgda9qtnLvZy3raitCclB9XqXnAYP9giKoaityJR5UGeOKMllPcKX5n1Pe3L?=
 =?us-ascii?Q?JLQ2ESElYipNL8BEEKqi7JgQIlK/letsa1e+sNwWTSqECiT5c+AaE5wVhus0?=
 =?us-ascii?Q?g+9W7qzlgHxVqEcmglR226bekBOZkNmszLKz+txI6Pk0iVrzav6JsQAaqF8C?=
 =?us-ascii?Q?tJGRu4tGlZO0g4vkwhXQ2GuPdqGumnRMTI8okh3fJMI5gUrBFUhx+F1Bx/LD?=
 =?us-ascii?Q?BI3593PKGaJ5980LaNrx3mGqTltaOeS1DLcRi0j3l4wdnIByPBfEGLIOBgrG?=
 =?us-ascii?Q?GtTBZ8GgBjXurq1wzwAf8Pfad9hEa9rl0DCdh3KKdWriZz/zOhHQs6l7S9w8?=
 =?us-ascii?Q?gQ6HZ7yGFiKEhEGMm2dCkjKrlCMUMgTpujA7X+h+Oc1Blem9DXwVcQcXziYN?=
 =?us-ascii?Q?ZN7eKHm0NvKAe98Uw7JV4BELASP+gaSaQbuyY/a0DwuhqNWNrnDgP1tNfcPi?=
 =?us-ascii?Q?UOQX71hZvGHDB4Ben30lEdW/O5Rnn7S3ZmurjA12b/a+iG/DCa8PkfNz+29R?=
 =?us-ascii?Q?jcK1syqEpNL4L9P6EyCkPFRosiswrNzleN5gge+OLXy4yGu8K+nR0oLftIFE?=
 =?us-ascii?Q?vAsN1YZpknB5Q1v0uHVJ0i3KnaO+cs0bQ/XFrrUWdoEQrs0pdqA90bHZjayT?=
 =?us-ascii?Q?lIehx+M5jRUdelmfVQyzKa31xFgZKnlSaCWw+VYmlA4gcA0HsbvFgv8kvWlo?=
 =?us-ascii?Q?xktGFaZd5njYqIjG4usWAoScjFIYqirxSFnAkb1sNwaf+zFoLh+q0dPiAtjH?=
 =?us-ascii?Q?U1vPWejQLInYkI8j+Ep0HxGwz8woV+qPCG2d6KLIKHcYlsATg35+Lm3tHqiy?=
 =?us-ascii?Q?sBbbXZS64URs6yUoXmmuG+oNCma0wJzFZQkyKnOT/r8wfEFGyVMtFHtFykgs?=
 =?us-ascii?Q?vF+02KxM08p/xnCyCMrH7SRFv8R29+zRjStsRYoANd8qIIL2RfI2L09L6Q2S?=
 =?us-ascii?Q?ZzzaUJibmgmQ+usRGwPx++pTsbd0XLd6+Njc0JdqaHiYtjbfzUlYqISMXHAF?=
 =?us-ascii?Q?+7btHziEmzP5sD1e94cUvTu9RsrQ4Da6SOyqwhLVy3IsH+4khGV6J53nhElD?=
 =?us-ascii?Q?fjKxGdhHnRxOuXqD8GHNr5Xi17/ilbPW85RUvA614nXWU6rjRIsI6MU6sJwS?=
 =?us-ascii?Q?NNRbywPMhQvv+EyzCANmec2N5uHL/s5+ZQG6tqwKe1tC1x38AGfs/f16iK8V?=
 =?us-ascii?Q?pK9z8bBfhjQd6528RFXUeNNf3bfdgSCYD6RLtflO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c347552-c163-4f25-a011-08dda36090ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 12:08:49.5510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxaxF3z31x4u1NteHY5Nr+4LND1ezfJA6u6bN+8jBhQ7HtuC9jN4QBlNuwIjQXD3N+xJmiVeMobepCXS2OlyoJTBnFbrGIsXAO8xzG/bN/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13829
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:29:58 +0000
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

Hi Hugo,

Sorry, one more thing....

> +	/*
> +	 * The default value of 1 will result in long read commands payload
> +	 * not being saved to memory. Set to the DMA buffer size.
> +	 */

The comment is a bit wordy.

You just need to say:

/* Set read buffer size */

Or...no comment at all. It's pretty obvious what the code is doing because =
you are writing
RZG2L_DCS_BUF_SIZE to a register.

Chris


-----Original Message-----
From: Chris Brandt=20
Sent: Wednesday, June 4, 2025 7:54 AM
To: Hugo Villeneuve <hugo@hugovil.com>; Biju Das <biju.das.jz@bp.renesas.co=
m>; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse=
.de; airlied@gmail.com; simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; lin=
ux-kernel@vger.kernel.org; Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return pac=
ket size

Hi Hugo,

I'm fine with the code, but maybe it should go in a different location.

Since it's a register setup, it should probably go in rzg2l_mipi_dsi_startu=
p() with the others.

Additionally, since it is required to make rzg2l_mipi_dsi_host_transfer() o=
perate properly, my suggestion is to add this to your previous patch instea=
d of making it separate.
Otherwise, it's like you are submitting one patch with a known bug, then im=
mediately fixing it with a second patch.

This also would prevent the merge conflict with my patch that also modifies=
 rzg2l_mipi_dsi_atomic_enable().

Chris


-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>
Sent: Thursday, May 22, 2025 10:39 AM
To: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.co=
m; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll=
.ch
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; lin=
ux-kernel@vger.kernel.org; hugo@hugovil.com; Hugo Villeneuve <hvilleneuve@d=
imonoff.com>; Chris Brandt <Chris.Brandt@renesas.com>
Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet =
size

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The default value of 1 will result in long read commands payload not being =
saved to memory.

Fix by setting this value to the DMA buffer size.

Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_mipi_dsi.c
index a048d473db00b..745aae63af9d8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bri=
dge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	u32 value;
 	int ret;
=20
 	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->enc=
oder); @@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct=
 drm_bridge *bridge,
=20
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
=20
+	/*
+	 * The default value of 1 will result in long read commands payload
+	 * not being saved to memory. Set to the DMA buffer size.
+	 */
+	value =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	value &=3D ~DSISETR_MRPSZ;
+	value |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
+
 	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/=
gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 0e432b04188d0..26d8a37ee6351 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,10 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
=20
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
 /* Rx Result Save Slot 0 Register */
 #define RXRSS0R				0x240
 #define RXRSS0R_RXPKTDFAIL		BIT(28)
--
2.39.5

