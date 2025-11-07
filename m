Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BCC3FC85
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A0F10EAA1;
	Fri,  7 Nov 2025 11:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="X/tPKist";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="X/tPKist";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C210EAA1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:54 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zFnFbIcCNlHqPXsS5DTagQYR8axApstbndlWVj/lANkc5QO4PwYs0XxvM8+ff1r/7E3YWuVPPkC1SS7t9w4c0NemCpbdXQa4VxJqcyFjbwIsgbg//79b3+kdHjniTWvadW0fxlBGFJeaYX/Vk+wk5o0UgDh0fNr43mwpPauVzIivKsNBWS1Cp6CnHyEcXJJ5jxxjIvtn7726jIP23KINqGYVbmVoSq9tVOqgUkVR18aQXBDGMTP8fXbZahX2EVyPFVfAQgnCpeZsl/jnd6miLnLtIqjeF5928EUZuIcCkR/gVpm/pSHqk4cBI03SNolzIiMYA2kPA5a+CER89lBlUA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=sCRh/VdM1Uz1m021o6PKoFNip6LvYGXq3kicHWIY/t9uwnLpjOeRgrMx2tM2fUC46HXs4W1Ov9MtpHuYkxMGbZrPVawf/1GxXtgHVqs0T+ZxTMUfuwQVLCejkacRr7dyZ/7zI9x2b2fazOtBXRd69EOL8fFSButC3ErE6S+Kj3XHWTQv8mnLnOCSvni9WCehkiGvAVFV6ihQPF0IGeqvwue+Kdd2ryVkzlF8ODXb+jj2A3ija1U1wWCtLttm+eUc28SNpcH7R9vPJUs5111dzP8cqGp2iRM3URUg7LI7lg/JPulCISrUst5LyvE+Hxm/ifr2KOhQ5HqtGBzZu+HjBA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=X/tPKistri1HbTQR/2c0g4FeTEpb1/BV1GmgT/Ti8pLEckDidtEwKKgV9Qb0M0aTedBQwHHmvMi6/A4DX8SdXIIMBPURsNI7IYAtL3wdQun/wW5eFAtm3ZILJ30b1CoKV86Jg5pO/J/2qyXVkRfpchJyVH6/eMXT2Daonzwb6mc=
Received: from AS4PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::11)
 by DB8PR04MB6889.eurprd04.prod.outlook.com (2603:10a6:10:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 11:46:51 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::a9) by AS4PR09CA0005.outlook.office365.com
 (2603:10a6:20b:5e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:50 +0000
Received: from emails-8656387-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 937918065A; Fri,  7 Nov 2025 11:46:50 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516010; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=pF0H5srY0fdvXIDZw+vQONsm27vi3wmMYIl+Str0KK6NEBkJHNZZB6MmGS7QXpcgDzpFW
 B/kZyTOpkxe5jcaGsa1qSjmbUOyblhlI166uivxgIDJl1e3DSyroGK7Pc3JHTeascl6TUS+
 sBfKvdjcSm6fZTzzNF9hym/DNGkEy9Q=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516010;
 b=gNpx5eWD+4pulBZdX1BiiRI4O7/w2klP0fqqELqlx4gCXClLWxcRGJjhoaLKa3KRGsByj
 RxPDECfh4QYJxVBUxHUPEW9nTHuaAE9R4zA3hhJyhsSrSoUOHg8eF2SovGQ/DiBFG9hg1HY
 hYFnF+oy+59f4fCquxf/WcwuEuK6iKk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnxmIiaBC+WY8ydhWoOSjg5fT/8jpgDPJm/XcaSVJeYrRsMjp9AYZAM5dp4/YAcYA8pxDsltDiKycApR638q4H9na+Qap/qqZspkUxksIY20hxKMXZPc6MyFc9ZGRA2aZ4TlRM3KBNxlDZDhAq6kxp6gbEY3RYMbcNhpAnH7fecnDfvN0q2OjoJMV2n114q+JFbzDaa5L27LHvgrghX8+LkqQeFWnnAZRplrlkstHlC5ySZY1pCEyTnI0lgzjUEWXPyfd/w3MeNaUsfMFkmEzAkhLeN/U86ryISLrQsY4tVzkPxQriEydhNFTMq0a21/6roXIitE2beT8EC1Kcl8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=gHdmMQiElG4DsCPMH1zV0uvSd8QKENwBeVU/jXsKoSamK7JsIX/UBoROH0YkpP3pkWptXnD1FGlDVPuAjF5YwRYzYsFWPMYF3vX9T8zcO4+wIBHDQv/pYm2hc0+RopvlAaZa/+9d8bieYENUyGj2ZnEtGpoxH8BThS9l4MKG3e0tig4nEx2A2R3slYPwtJerYFOQpv0l6vqZOozJ4rcv/LGhP7Lp1xh3vDAVIy0HoWbNJm9bSw2GU0v0USQeWv4gQjW97W2bhOon1S1Oxfyh60tlB7Vq4sSEjmwtwi9u369QtN4DNcACmBDttlurRWX2cG0t3vjIT51dL/w2iaVexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=X/tPKistri1HbTQR/2c0g4FeTEpb1/BV1GmgT/Ti8pLEckDidtEwKKgV9Qb0M0aTedBQwHHmvMi6/A4DX8SdXIIMBPURsNI7IYAtL3wdQun/wW5eFAtm3ZILJ30b1CoKV86Jg5pO/J/2qyXVkRfpchJyVH6/eMXT2Daonzwb6mc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:34 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:34 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:12 +0100
Subject: [PATCH v2 05/11] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-5-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AM2PEPF0001C70A:EE_|DB8PR04MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b29f80-8871-4415-18b9-08de1df35726
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZWo5MTQvd1FWSjlyTTcvRFIyeUxYSUlHLzFrTDFVQ3BWVzNQMGg2c2kwZGdS?=
 =?utf-8?B?eUdWVGpIMFQzQ3U5UjBPUm1xa2dtOC9QV3NtZ29iVFY0Rk1CRjNjTW5XYXlW?=
 =?utf-8?B?YUVoY2ZZamx0Ry9ueTN4bUVLSFdMWERSNTF2Z0hSaEgxZEhSZjJuRFFBeE1r?=
 =?utf-8?B?SGhnaEo1d3RIaGdRczNXd2Judm5HWllEQy9EV2tQVmZHVEJ3U3B6Zm0yUWg5?=
 =?utf-8?B?MjRrcWd3VVhIVjZRUjZGa1pMWkZad1BjOEVZMG9VMENYY3NxRVdib2Ruei9a?=
 =?utf-8?B?d1JTZ0cyVXNiOW5YU1d6RnNHcS81cHdoYnF2SkpKVXZCclVOZ3dwQ3lqeS9x?=
 =?utf-8?B?OXNGa2NaN3paRDJPQUI2MFllUVlxSU1tR2FTZGhLMVlIaytJYzQ2aW9GakJy?=
 =?utf-8?B?ZHpJRUh5bGU0L2FNSDg4RGtrRWFCR1pPQll4MTgxODQyOXQxOC93TE5SQTk5?=
 =?utf-8?B?TytDNUVNd0ZKQUpWUE5PN3JMbEhJREpUOGFKdkNJcm5UQzFkb0lUV1lsRUJQ?=
 =?utf-8?B?MU5aOHpDYWZpZnQwYWJ4WFA4Yit3UGFZbGJ0OE96RVJubmRkL3NrcnV3L2c5?=
 =?utf-8?B?N0xMaHk3NlY1S0ozdzNNbk5HamRybUFsWm1Pdms2SVlYcEdBYTNLQUdXTG50?=
 =?utf-8?B?b1NHTnJZa1haNVZueE5mUFUveXNrd1RueEpJVDQ0eHZrV3dWTk5OM0syZFU3?=
 =?utf-8?B?dCthbEtJc3RxY3ZVVUFhK2VCQjJHUk8zdXd0VWUydmltV00vakdKM2FzTTFG?=
 =?utf-8?B?L2ljM1ArT1hVUnNjanNNeFh3Q0FNbDRxV3FWU244SjdBbHZHMGN6NHg1K3Qy?=
 =?utf-8?B?TkRNUE10OGxuMk01a1VoakoyY1dIS2RMaUhYNTVsUFpMQU45Qmp3aWhxREZY?=
 =?utf-8?B?UE9hSDFTSzVSanR5c0QydDF5MktlYkhKM0FBbHhIZVZjdG9XVmRhVGJEMGVR?=
 =?utf-8?B?aE1wTU5uUlduMCszSFY3QjVhaE9ZazlIWkFhdHdsYkJ1RkM3eXNhaGRQZmJx?=
 =?utf-8?B?RHhaclhCdjhsK3B5TVZRc2FQblU1YzRQOUJNOWdDa2pjUjRwSzh5SWdnaFJn?=
 =?utf-8?B?Rmx5NTB5Y2dyODJmLzVuWExiTUI1Z2lOOXN0MnBXRmhLUEowWmJNK0lqZExW?=
 =?utf-8?B?cXBMeUZTRGdWbXlSZzJRY011ZS91UjMrdm95SkVXbUdVYzRpNjg2S1VoS3RE?=
 =?utf-8?B?cWE5Yk5pN1BrZGFtK0dTeUFuM1hJdlVjMDUxQzN1WXhuNDRjVFNvQlJMdG9N?=
 =?utf-8?B?NXRoMTVrc3k3WGtKN2NjSGlXMXZDNGt4MGVYeDRIbDZoekVxcFY2MTdDUHJo?=
 =?utf-8?B?RnI5SU1WVXdNeUdKbWp4ejJjSDgvUno5cVNabG5rUlVLNzFQQWZDM0VGQzlF?=
 =?utf-8?B?U3N4MjVCb25Fa3Ntc0V4ZWFVLzRjL1RsUnM5aDA1NjlZYmZvdCt3TThxekNF?=
 =?utf-8?B?M1NwQjRobjk4S2E1V2ZTRFg1ek9QWmFUbnFYaWlpVXBHc1RMaGRYRGVOWDF1?=
 =?utf-8?B?R2RwakZGQWNGS1VHQ04vVi9td2lnS3FuRjJSK1JEU2NJMVl1OCtBY2pkZmty?=
 =?utf-8?B?cDIvZ1JWZXJ6dWVxNGExbTY1VXVzQ0tvYnVwcDJKSDUrZTZzSmMrMnQyTXdK?=
 =?utf-8?B?ODZpQWZVdVhSQ083VlE0ZFlqVXg1REJxajJsZ1RZdHQ0VnN3Z1J4OXdGeDUz?=
 =?utf-8?B?V2JDN05pSnVXelNlTXNiZlRNMHI2dit5SU1BaUlQQmlVZ3M2UG0rSjhEa1FY?=
 =?utf-8?B?SmdzUUdET1JkcHZ3UFFGRDByekl5aUhDQXIwa05US0dFVjA1RVNLT1hkVmNh?=
 =?utf-8?B?ZTV6N2pESk9UdzBrbGZ1Vk8yTzZlbFE3ald5bjBnVkZXOWxSMTBLRUZpMTRs?=
 =?utf-8?B?UXN4TUJIM1ltdlpMcVg1RS9QTkhCNEJwQ1ZMYmUrOHBPRzh0WmExeStaMWVp?=
 =?utf-8?B?VW1McGtPdEhkSktSWFBuOW0ydGpCSFJXYVhlaG9YRlp4NncxOXF5QUxoV2RW?=
 =?utf-8?B?NWR4ek1FSWUyT09nZHRGZVFLczlxVUpjVEFXZTUwWUdPMTlPTmU4aUhDVEdw?=
 =?utf-8?B?aUtMNjd1RS8wVEdnZUJEdXFZdFRmbDlGcXVsQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b81bd7f052ff47c8b25e7ac7bfaec1bc:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4209c8f8-72af-409a-4a9c-08de1df34d14
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|14060799003|376014|7416014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG1qdE5Bd3poQWVtUVh6NW5CQ01WSTF4dDRVVGVWVzdYWlpMSnNkUXZGd2JT?=
 =?utf-8?B?eDBKVElESWZVOFNRTGNZZFgxVEw0R2d1TEFHKzFzMlVBNDVmMlUrajVOQ2ll?=
 =?utf-8?B?VzJ3SlM2Z2g5WG9FdWhoTzdmcFROL2RSVHMxR3N6bFRadmx0T1ZyTVEwK2ti?=
 =?utf-8?B?UCtOSWhINU11S1lnMjJYZTB5LzRHTWt6QjI0MlR3cmlueVJHbUdMNUFzbnA1?=
 =?utf-8?B?dk4wclA1cW1HSnBXMTVseVBWUGN6WThzN2dYK04yRjFPTzdrcVl0bzdCaHFB?=
 =?utf-8?B?YUY2L2lyQm1KTS9KUnZjWHR3K1dOT1Vra2dCZ1B0aG53Y1F0SU9hZFg0ZmFO?=
 =?utf-8?B?cGg1L1dDNExCU3hXaUpObmNkOU85ZW1CeWlCRHU0eXBqeXdBQUtQOU1LcjQ2?=
 =?utf-8?B?NWpuUFVTdERablJUc2FTNVd6N3pDWCtHL2d1cUd3MFp0cEdkbjlmaXQvNERq?=
 =?utf-8?B?cS9GampkeGlYSGw4U0J5YVJwOWZvMU81K0M5UzhWSXYvNlVEeTFYZW9Ma0Nu?=
 =?utf-8?B?cDdvTC83UzdpTlhJRi80bFpxRjV2TWw0bmxLU1NBbEg5UmwwUnNraUFFdEVZ?=
 =?utf-8?B?YUFoTzdvdk1aN2Z2Sm9pRVVsUEpqYksxMUw0U3dRTUtzYk1kRkZ0cWFXSlFM?=
 =?utf-8?B?amUzSFR5SVlxOUt0ZFlIRmFHenZIMTBLMDBrRytkNEREMmROaEdDQjZBR0NP?=
 =?utf-8?B?ZTcwUUZ6THlXTkVpTXpYcjVjVHd1YkRaVFVRYURZVE9tT1A1V044cDFUTC9M?=
 =?utf-8?B?czNRMnZwcjFiaHllNGozZldLTVAwbm9FZWlOTDNUWklkaTNkamo2bS9ycmo5?=
 =?utf-8?B?c2R0TnM3ZS9CUzRqNnFZT0czRThESzk5ZVhhM1ZRaHh0RXdoVGhQMjJnSkFC?=
 =?utf-8?B?cU9uajZhSllrNyt3andJMk5rdzIrMkN4dUJPMTdPZWNkazNBZFNlb016RmxH?=
 =?utf-8?B?OTM0bGpzY0QweWkwMUpKNlpaRjZNRnBiaDcwT053Q1k1MmF6cWlxV2dFTnR6?=
 =?utf-8?B?RlBPZVFPYmR2QmVIRDNqTzAwZStLdVE3TGEzV2t4NFVtWklmWVJvTGhaZ2U0?=
 =?utf-8?B?czBCeUd4c3FpSlNNWWNDZTF1bXJJaW13TjVqVlZVczVFWTIweUUwaVlkVG45?=
 =?utf-8?B?L2VEWmRkcXFmbFNhSlpaQm9oZGZDZVkvQnlZZjRqVHJJMlk3TlZ5QVIrTlls?=
 =?utf-8?B?bG5ZWXdVRG5aalZ4UDV4aDhvbDhQaHFacVV5dDhqRVo4SlhsSm5lSVJ6Mmlp?=
 =?utf-8?B?WHNFZEdUSC9jQytZSUgrTDEyd2d5YStyQXM5ZzBQSS92NWVUbE4rclBXdjZH?=
 =?utf-8?B?RitHdHZqM3Y5bGRKdGtveDZjd2NLZ1Zta2xML0huSytxZVFPMlV3QnhZSDFO?=
 =?utf-8?B?Ym96Y2lublVTNjlTbUxHTFJKeUJVL1BQMjhkYmZHWlRGUm5VNFZVR00rYmc0?=
 =?utf-8?B?eEJEaCtFSjBEZDV4bitVcy92ZVd0cTFvb243djBIK0IvR1ZXNU9qM2pvcStE?=
 =?utf-8?B?OHJFQnJBQlFlMkFOdjBnV1BQS0FZVVAwN1RVOE94a1RQQzFHell4R2cwR1dV?=
 =?utf-8?B?Z2Mwb0xMTFpITWhLNGRSV1h0WkNTNG1SYU5IbCtmWnZDaFFpRlF0eXl0ZUFH?=
 =?utf-8?B?L0VFNENnYm9KY1pDbytIY2V5Sk04QTZobk5POUxsaGpmRHZUekJkcHhIS2Yx?=
 =?utf-8?B?MnlLUTVqWUVKV0ErckFKb2Z1ZGJmOVFoZGtsbWV0a01qY0hTWk9VOVBaU2Fj?=
 =?utf-8?B?RmFVYWFnRm4zSWJNcS9ZdDlhQzJqdVVySHQzT01ERDRpWG0vbnYvUVhtNXJi?=
 =?utf-8?B?eWlCZTkrSlIvN1JnQnlGRmlqNElsYkdsb25Jam40VGtRQ1ZVUS82ZzhkbnFY?=
 =?utf-8?B?YTJ5cGZOKzF6a1VkMVl6cE4yc2o1R3JDczN3bWV4MWZLbHhadVRiNWJuUUxI?=
 =?utf-8?B?RysydjZaVUR1N3NjOEVjMlR2R0lYYVk0ek9SV2RjNWVRRGQ3NGd1M3R2cm9M?=
 =?utf-8?B?elpSMDZ1UXVPdGNmQWkvaERrb0JjMzV5b05mdjlya2ZaT3o1WXNKY0hCYlBU?=
 =?utf-8?B?OUZsTVJDVnRDK3NEZnBkQTdVS0Y0TzdDS3NONmlZTk0wbzE5Z1ZYSlVNNnRG?=
 =?utf-8?Q?naDryewfDYuUMgT5IQk20xErj?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(14060799003)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:50.8679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b29f80-8871-4415-18b9-08de1df35726
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6889
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

The ronbo-rb070d30 controles the various gpios for reset, standby,
vertical and horizontal flip using the non-sleeping gpiod_set_value()
function.

When the connected gpio controller needs to sleep as is common for i2c
based expanders, this causes noisy complaints in kernel log.

Control of these gpios is not time-critical, switch to the
gpiod_set_value_cansleep() variant.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index ad35d0fb0a167..c3fbc459c7e0d 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
 	}
 
 	msleep(20);
-	gpiod_set_value(ctx->gpios.power, 1);
+	gpiod_set_value_cansleep(ctx->gpios.power, 1);
 	msleep(20);
-	gpiod_set_value(ctx->gpios.reset, 1);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
 	msleep(20);
 	return 0;
 }
@@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 
-	gpiod_set_value(ctx->gpios.reset, 0);
-	gpiod_set_value(ctx->gpios.power, 0);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
+	gpiod_set_value_cansleep(ctx->gpios.power, 0);
 	regulator_disable(ctx->supply);
 
 	return 0;

-- 
2.51.0

