Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1806B94DBA1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9067D10E0F3;
	Sat, 10 Aug 2024 08:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="cuGJ5NtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2097.outbound.protection.outlook.com [40.92.103.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792310E0F3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb3GnwL7xAvKJm1chpBLpYTRM+pkK9ZEWOSztb7n2qaJbvbdScufcQAGVlPmqO9/zq4kYbu4mjWmhcHy7G9MANfWTZqYmx3UeS/nVVbL8MubxDpwxRi8ek9Eg4NdqnG0A/SAJI/g8j0eDVbUFYnnJRL5h2GDQXrVwi0BVqrROSBIZQRD+vwav5O8IhCe/3hZtKhdADpzt2gHByq1oGYal1kPUd6u2l8yIrizjPi/DwwGuweQltZe7vUfkMjc+Uff2hPSpF939oDtLgxA1LfrmQR8y1qim4l6RYdR3uaftXqAe4nTjmBHd5oGWWWWIhRmWYkQG+5+95eLgyLs+jGK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRt78VtOOTop7uXP6qZZuYGoLQDXENHCn9pPeI2rY8Y=;
 b=QgcVottiuRFkzJO2aSXWFoBhaBSfPcAZdpP2q8iU7Q4QhW8yhg4qOv6g2I/CzrsECuEC4jqNep154AybiXMfInPMXE54eVVwaVjkrjxrXMkpzBQ3vXV4nzelDa3bAxdT5UULk6IG8hFdbv93s5Nv6yA/EaK6Qz7aDy18tKxfAKoIrEfrrJbmjPYYboA7yY6u/xZTy1yaHUHrFlHQFjY/5/wZ5COy/0OwuZHOKYPDTE1QoPhqJxlxGcQJ0FqeWOui2nfJjua22o26anFinfEVN8K5E/qBdSy+1ywE0r+FjNSsi7VonFfMmt123Rp9jBoNeJGRabFVSfgsDoA3tlPBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRt78VtOOTop7uXP6qZZuYGoLQDXENHCn9pPeI2rY8Y=;
 b=cuGJ5NtG0j1UynFLaK///1AobWwBMXDsajSMQ09IDnIPwAwSMvnbNP4UB5q8bSWlOV0dpmJdH2Hu0uvLlUnn0tiBz0ZxWiatMZYFYv/UV0TagiAgFVjL9r17ixJN+EAjj8hsC6gcWmXFnItnf7laq17Tn3xS1ZcdAPZQGVNAzfe9OhmuPQG1eAUFUzWZPsgD0DYMjhQ6y1PwcQ4aGs2f9kMrqLb3yTrTNxuydxLzu7fV/mZUvlGB7PmKmECenpvGaL6KbwREkIPExSWUBTzewGRtCus8VcnwEgLpv8iCFfWoK3XBvFaYAPWfvuG39byEOlqVozRZsOVxn+5Q7JValA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAYP287MB3581.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 08:51:02 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:51:02 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v3 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6ZnJpnJcIilSrEGLxn+LoY1FJ7IgMZkA
Date: Sat, 10 Aug 2024 08:51:02 +0000
Message-ID: <1F72AE51-A572-4AE2-BC4F-2A3B8C2D761D@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2XEyAq3tecGg/nrlNIBEFcZID/14d0Wy3a9VZdAnJ9xyx62IIsCBJCWKVdQlG+qmii5qsjG40Lk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAYP287MB3581:EE_
x-ms-office365-filtering-correlation-id: 14a4d17f-8c56-4002-4b00-08dcb919904c
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799003|8060799006|461199028|102099032|4302099013|3412199025|440099028|1602099012;
x-microsoft-antispam-message-info: 9xTj8TZJhK3Toi837mYcSySZY9Myg/S0jKDydWKMILDRpBshTds6+C6l+NxdLzc24qjDCZ/VznE6TgWOjfzP+KOUzM5cg3xvff9AkhWejl1iZRlpg5TLozVuZ5GYxnTuO0TnM4FtclHG2N4sXyiWr7Wcd6hGAngUXyyp46/+IDHHHJql+VcI34l2aG3/C4sfh8197r2uNkDbDwzptzBPm8zXQvuneWjEPLh/wgQ4i1dvwlwEg0kW1YdIknmHDr3urExAPBE/D3T1+dY083J0e9BYyfZsC8w8+47WEPLGojl1GJGdSSg8tuIqrhyH6DmYVcYUpVrEgua6S1R11+k2m1n+h2qmrETlXmid8mz5rNlRsK2m+GTac2aIN6d1EvLVzdU//+FAxNzwrgrWKTvRPPhWlJP5v1ZjSu/4K2VmSFOARFfMZi+mSxoNqGYy57y+k9lFpCabRq4a9qWBG+w3bt0dEyo4t+AqW/185CSoIbL+uKWwEj+pNfKAB1q/KtM+cVd/uo69m6jfDO2rKAv6/5p/hbtVhHuV9ISLCTbC/DoLS/kHE0gnP0+1D8PeTgy9tTJtvLV67wJ7HCMaM0adPT8gsPzDkGE9m830ylrc1w3AHLV/pCn6b7mQn3eaqdcg6Mm+Fa7cbjT2E400fOlom9xv18q7lQcP5vIdF/T++oUjQAtYWJ1vze9GwuzW38tIw9RQAW2/+ebKnuiN7dLZbqsieoTO/15NbbwoAZzTiZHmZXx4JXYja55yNGKmeLuD0S28otlyDsOcZiIARBvMAk1Br4++BmjkXIwplOvale4=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mONblracuiQzvDSNR0xMQar5nsohQUsJ6rlaCxUC3fuqGQXII/joEWe2s+P+?=
 =?us-ascii?Q?HlS27WFy5fQ+zy8fVIxo0lvMPfUqFTYjkAMcO1x0BIqeUiWZ7vIS66Z7pIH6?=
 =?us-ascii?Q?u5FFXqUiT7kIeFBqSWOQEHDi0FXo35mErJpas8AuI5NSlcqt/hu7yuMtN05s?=
 =?us-ascii?Q?BVrQTi4a2lgACXYXRDCvcyFTnnDpFuc02mHYWACvjffH8yT8x8gjQ9oVVb2S?=
 =?us-ascii?Q?osKaUt5nuKNFIagZq3i20PAjhulXi1hetH2IfKIZpvKRkizNpNXwZuDyALED?=
 =?us-ascii?Q?k2suXxRPbrMAxO5HTpusOTUAqCB3rO/pwH8T86PbfBet5zPOvP3cbC4iw+UB?=
 =?us-ascii?Q?vt7CXO++Q2EsTcDS8oyfr3w4HgIRiG1mpPF7ePobTGT+lAsworJjzUyrp2C/?=
 =?us-ascii?Q?S8vbK2ZlIgU1p5/LfYyL+YeVfu9s5u0tKSYet0HW3Ec6III+Ige+o6V46SRz?=
 =?us-ascii?Q?MV+9ltcE1kVtvmpS1KjCKov9q3QOInBoeTsvDCjRIH9ENX3vEUMM87CJUkhX?=
 =?us-ascii?Q?6aSK9k6EzvxEraEiZaf2KVIdeObo8J73ONf/vNZO/dXqFCJQPclt/BlBqAZp?=
 =?us-ascii?Q?3UZb6n81RUQmetWjKc/LDlR40cQ4bWi7oIY9EOlmkszR0324bq0VO9Of4MgO?=
 =?us-ascii?Q?FfiHhnrbNdRmVoTVzwL8XRMToegmuvnW73jdyipgtKbxBT8ZozbkMH7R0oXG?=
 =?us-ascii?Q?tQ2sYsg9aB2GnrwOyhLNBsa121w1jICskG34i8ihAbv3hwqvXqb+bvABe4v0?=
 =?us-ascii?Q?05fM2qdkMXD5QAW2q398RQt8jH3ZyAAOsX6j7EtkGhL3AaF6dW2Vd+fW2Uox?=
 =?us-ascii?Q?RjRLaeSJQqajww2c6NVTVUG+iSURJobt4hiwtr7kpHbE+P5loksg1/A5xi+w?=
 =?us-ascii?Q?6a74EppkX7RUPDYawVLoDksn+iB0pZ8DtMBGnsRHFgIDz++uJ03n3vaKMiRi?=
 =?us-ascii?Q?mOyOrwnwW8eY+THIJJiAAqHGeSC720AIQ36S3958evb512I2H0U4rmWCTRmB?=
 =?us-ascii?Q?lwQ+QKTibMCsNQyhuW1UVEqrxptVIC6f2YZu68rKjPEPiXprjGYqJB2/SXoH?=
 =?us-ascii?Q?heirqqpWuyeTIWA9xXfYvXLJx9gRzzrCJnEgPop2yg2SGf5sJOIBE10k6+rx?=
 =?us-ascii?Q?CGAXcVehkBRaqyNJvqyc2EzXVEn5zKS3+54Iicr+VfSYo5CY+xJAsJxQbqLN?=
 =?us-ascii?Q?vw2t3zoGIJ/jTK5Cn0lQ4wE0FpmzBaOCot2uveNHC+/tlvFRdFapCslTBh0v?=
 =?us-ascii?Q?ur+B/bMvD0s+xsa0DtMh3QWPv343uPLUnCRITLZJ2yDE2KP9KOfZYwmAVTZJ?=
 =?us-ascii?Q?Qc61EbLoorOosCXWnbSQ6wVP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F7E00642AB58C42943D139D4D6A77C1@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a4d17f-8c56-4002-4b00-08dcb919904c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:51:02.5533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3581
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

V4 with an additional patch sent here:

https://lore.kernel.org/linux-input/20190CD7-46CE-400D-9C58-29798479660E@li=
ve.com/T/#t

