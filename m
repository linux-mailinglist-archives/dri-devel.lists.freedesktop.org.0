Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKrnGt/4fGmTPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:30:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE2BDB43
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963DA10EA33;
	Fri, 30 Jan 2026 18:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O6UCpsQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1EA10EA33
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV0t3Itt6FAWTf2k/NfcG98SQ5L0FAeDw/B0Lx2oMSeAZZ9Cyqruq96ErMtvxzntGlJTwNx/U9bqX+2gBuH6DnIKRuwS64B8EogL0MOaypwPlVmcPNJbuISW1cqhl3sVuSIqXEu+nc7gziB/QkB2xaRbNwe3/gsj8Iji/KXEKFHBpdD6BuHGtj8+nIdY3O0I2K1wgUvgst2mTJ2wFsCLkRw7lT+j1USd31w7P06Q6L/6mQtld4hCskxx0rp3CRqRjKWTBdX9SiNloPDmyi6mQxCFnzskryXqmZ8yi3B/WRhSzNytRlDstbGrN8EJxKSauwSvoGolZUmxrUWT4K/vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClQYCgNezkyqxPNTjs5XGBQEZqwSbA2UeywVSWMVke0=;
 b=hKk0ubETgTKhlPpfg/7SbjNJpA8EEUubOyBp/PTDqv9tEFLaohboTRmmsx1jqYAGAdHH1lQsq/V37qYMERFcJN8tpKgIBL3D7C3WmJTGYGfrO5nDKMM8XNWqRmMJILQo7ZjV2EhgXRhaBOZ/7w8R5oPI4rcuYdaz/7C4uU5bgP3TlYn0doHNpXuxOKWRFiVOJnbTLGTfIzmRSsVJueNpRRf1T4s4D4gLp1rIs1MsAYRIBLcVhd1iIhAwDq5wqJ+OqiSddb0a7Vqfe0r3qd7a051Cj/OBcTHsbrzGZIDOjhc+Bzb/8Gql83z7/eHt1pmp4QII3mDioyNUpwAcoQ6Bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClQYCgNezkyqxPNTjs5XGBQEZqwSbA2UeywVSWMVke0=;
 b=O6UCpsQbZvI55FPWv8BPTjZfgwoZ4+yo0J6bJQYsV4gyazSLXl70srhTTaM4LXAZrnml5e7edNl6WKbymUr88Vn5WaB1cTmo420bt63Pe1qDbln8HkPfWWmnqcC3LAaMSxtNxkiBFzs4Y23xXtLUEAE0H2VWaECvPpxw8yY2pqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:30:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:30:40 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 00/20] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Fri, 30 Jan 2026 19:29:52 +0100
Message-ID: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: bf461db2-f47b-4e95-ce8c-08de602dab5a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcT7JF+z8mG6xDomEHqHrxbvjqlfz+So33Sf5vdbtaVH8kOFOYw3G5VFZqpp?=
 =?us-ascii?Q?egdAsxy9hAj/hamZ0KD2UN3nDKZukTtGFIWy5AC8Ha1eSXfCZvOssFVWkBAk?=
 =?us-ascii?Q?15f6+bbshrlGeSL3NK90OsmGW6cHF49yo+upGj3ga2HhVkmhr9NMMBFXW7Jk?=
 =?us-ascii?Q?wJAUJyIJriskdeaMjTDckVaAXmToLUpKCtlYXznJlZt81mfBW669dIgW20ll?=
 =?us-ascii?Q?LCLbYdxhu4ohw3a9f/naikZZZGVjG7bldQyC/+TAHLAkqZeOwRoTTyE7sWFI?=
 =?us-ascii?Q?sIDU5cs7TtI6FemH4XcsZNEuka5iZ8ucA/4z8/YLEo7JOY2qRejhmnKOL0hv?=
 =?us-ascii?Q?UaeA7IG4OP50hWBIwmwrIqEvCeVLBNkYJKnoGB5H4LttuvNTruhyuBNJDCe8?=
 =?us-ascii?Q?jHTSAVkoTO3sG1DJoZPE5/YpAe3wx9L2lblRuTOQFB+xy9xt6sUqu075MPor?=
 =?us-ascii?Q?k9ZrzJtB0ys6FrCPVHZvs5UL2B+H52Sefx9cDBetIowzMyRfxY+xBTiPJUEQ?=
 =?us-ascii?Q?Bup8bluDOAK0e+5ykfad/WfdAeo13/3mwMnxcf9i8C/KHSVpxAUcSdBH4jhg?=
 =?us-ascii?Q?cgJVhLhzA+Sr+p7/PcgL9Ay3KiLB45f213U2KL/7RemDEM+cLqzXeWrpQ79m?=
 =?us-ascii?Q?3KlLPGv3GuD3SNSmJVYGbE3AH9grJttgJJMVvSFXuI/KsWq+Xpon18Lbf6xg?=
 =?us-ascii?Q?OU0koUaL5hd5aX9zwseCLEqPN17Ggqro7rHAfYpT+MzYcr08pu6MXgupq2IH?=
 =?us-ascii?Q?kLdCwkgMJHBvdm+oo+oohuzinaJm8Q6z84dMvSXO89oilrMf/F0tf+Y4Ebi4?=
 =?us-ascii?Q?nGGlH1A3WK1BrQQc5jLHqJ/0UWOY9pMfyuMCAQlcKerySjBYsTJdQDSMXY0N?=
 =?us-ascii?Q?ksuGfsyuKc7pBINz456+l5DM66O6EXMT2SKUZpCav5M7n68X0v7A7J++bnvP?=
 =?us-ascii?Q?CANZuI4Hzw/Zj+mawWsJHOlxsc7Y2bPRCc1GWOlCkQyM6ebAFfdDedu2WEDr?=
 =?us-ascii?Q?lnNsfyF6atr/sHdmV32pMZLXTWgPhpMI6kfLzsxnEYyrOyw365Ex2bH3dYaT?=
 =?us-ascii?Q?3Zy+cgjtg3uuNuyN+hIZ5rWGp8SZLAh/LxmLOUoUa66nfSEfHGj4MBeJWEMW?=
 =?us-ascii?Q?lgxFo5jX6GFT/yUmxJLjQJIAXVXT6ZBbXCM9xy6nz/WiNVxDYmG4aoZX72fh?=
 =?us-ascii?Q?EYSFk4xfX7uDn8Z4uLiDc2wM6u3I4OmyO1TFM4UMfAq3ifJXFqpKg1TpcLaC?=
 =?us-ascii?Q?hzt6wyPopqoTJh1XvAqtwPRewPzX2pdpN05CSl61GfhF0GhyJOixyhFRKpAp?=
 =?us-ascii?Q?MekaIiLPNiacu0BhdcVD/l0UDZEjk4QN/z7OlKz2JmiONYTZEDeCTA81w8k4?=
 =?us-ascii?Q?gZ1X9EoiAfRSMaSXBsBHfo3ObuUGyxFJIgRD6aniNDcTSYgfem42c4u/oF90?=
 =?us-ascii?Q?4qh+BhRwltTsVcXsZLfi28oebukNlIzu4ubBanvLRHV9M6j/yDHUdgf05hRl?=
 =?us-ascii?Q?gh+I7DxhShCY0fX7GGCR3MvDUrHkWs8on6d3/BKZEQF/aa7fxDjDX25ky9mn?=
 =?us-ascii?Q?zHfxJuf1R+owB1MHhQgkjir/Cnp0DPK55CdcdXnXrzKpq4vyoyz+FTc2R8D1?=
 =?us-ascii?Q?DTVwKinSVf/WNedfHfw5PtI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iB8bNmMZ6BlQJ0C/SMQz5RWx+e+rHrLAO26JGGeJ1ndTFd/cn5xpCDdOK2Qn?=
 =?us-ascii?Q?qAKfR+9EFnVWZqXCCXrj49TNPmSFvkj4hzxOmJwZ9tpDyJpN64XmYF/RXQXU?=
 =?us-ascii?Q?VPnzHmVBKIl8uG3KryEwKACTaxvgROhlgOw/JpO3cctjxp331Y5hPKE4JZon?=
 =?us-ascii?Q?iSkHk6oHHZtlYotVZ6BS7FI+TfkcE5cEcc9T5m9nbxn07zArnSOA1cgOwk14?=
 =?us-ascii?Q?YozZuS5sJ8GlCLoxsrwfNqWEXzzRPDMx+noBcTEbwYPQRB2fzCeCe1Sm8RXz?=
 =?us-ascii?Q?UJHJK/oXDn3dIWgJygU9RCQTNKchCwndCWNWoemJx0LLgwKtoMyPcxllT0yM?=
 =?us-ascii?Q?y5AF/XqyFWneYZNilEoXJZu816FlTdIMM2kIzDN2czjjICNudWbYRNI+1MBK?=
 =?us-ascii?Q?w3iJD2iqAzMDV42RO7s7/soQvVfF2vDnpJVTQTvkbWFqU03pNo6hZMg07azA?=
 =?us-ascii?Q?TQ/UJdR0vHNGPAa5EHew+jOYK53WCW9qinLauq+pHl1a44gI3+ugWf8tDzZZ?=
 =?us-ascii?Q?bndwydNtkBnlt95uhKs7F9dbFtUZxtSaY8053+c9qWMy8z95LBCJNfJeTgX8?=
 =?us-ascii?Q?GQV0SK6pLJ63+8HuRCul4VQ5YUo9DIyS6eJSPwrnrZXvKQUEtQ3r7VBFfKuO?=
 =?us-ascii?Q?Gcs67fkYUBgB67kiKQvg/hyA6u7qpo/NRrl1CGLqwL0KFUKGkPhYjrisabAs?=
 =?us-ascii?Q?6HtPKIJkWNJdTMg3xBDdL0uES1XbbS6I4OB/ysEGd/RA/LUttlppGFqcxJgW?=
 =?us-ascii?Q?AfH3p0JyLdh0ejrEMy41k33Dg87r22PQcU1t4Qb916ldm/eexXZWJLf3BdQy?=
 =?us-ascii?Q?h0tzg2FFIdPPqZTNMZe37Sd7TqvSkjPgEy6dtgn3WzAwt8WJwXvx7b6HyxEI?=
 =?us-ascii?Q?/9uZri4PRaLSnBhvPNAIDV5ECqb681bmZ1VuiBrn2eUKeRp1qDOvAK3v8Kco?=
 =?us-ascii?Q?+CTKvFwVUa0quoTAJubEW5k5AVHi1ltq4qHRPit6atPtH9IMmuo7AVtFoVaC?=
 =?us-ascii?Q?LX7wAiEBLy2PkG56B1xXuGskpxaQ1ckVgw+K3vb/n+bl/wSK74cYpaVnuRxh?=
 =?us-ascii?Q?VUD/t22VKCg4zbIH58szSAOTtPaPnaen2VA+itrT2n4gCOR9Fvl2+HowWomJ?=
 =?us-ascii?Q?n9WV3iEoZBqlv6MyB4H/ItcTmULM48dUZOwTrSolB50+1qpllZhgMJbCGKQB?=
 =?us-ascii?Q?QFeuOawlJ21syBBknrwVmDQB82eHvu7tkAouIJHqkWr7yp3P3kITNPQdgVin?=
 =?us-ascii?Q?JiVoD0rgEZe/hK7ucTuHuH0cWfTcEXWblfbGrFARfZiErBzleIp1tj++oXHr?=
 =?us-ascii?Q?+Sxoyt3lOzGdykiPsbYqRBcRy001IT0CytZ8Di0eS98ARZoieEPNPewPcNky?=
 =?us-ascii?Q?YWb4Ny5MVqs6MirAvkRln0Fsr+yKEkyUD76dXdW0AfyZ22y/DSypSaREyJYg?=
 =?us-ascii?Q?zRDOOz8NJwfpd7yowMbtqVR7OpNwPRs3boQo4YODuj19UbbVEShh8f7njR16?=
 =?us-ascii?Q?QgnSdCqJmovdcMjjRAhYrFGZukOl+zItZYaY+Uj51aecNDGsB49yc7kjqAtI?=
 =?us-ascii?Q?xuyHrPhdCo3qbEpx5dZxyQAU0GIZg0dFfpAwMshL9LCnGfnjIeofh9Kf4HYM?=
 =?us-ascii?Q?4a50jdmOR6bhmCkYGJl1BCqro6ZSQIuZ9eTYerPSnNY6o+okECKUKutzak4U?=
 =?us-ascii?Q?qICS+LDDrYgeXtePSmY7kfRcqGTjh4KKSpCkNkeKPZ80VoRUNuCpOGrwmnHb?=
 =?us-ascii?Q?aUAUhCzrpfltKHo2rros6GywsmaWJnGXh9jE2MSiYrTg2Tc7QIYg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf461db2-f47b-4e95-ce8c-08de602dab5a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:30:40.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NkWEx06dECjgLVCZzSYgb2YkGoeApveaFWBgpMHLbZRrkGXXxWXtYWrVER8a9PmxafU8yG7+33ZrupL/Whk3wSe5vF4u7Je4nPsW2MuqGiKF4wP3jrshw5w0P+Z6t0a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7EEE2BDB43
X-Rspamd-Action: no action

Dear All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks & Regards,
Tommaso

v1->v2:
 - Rebased on top of next-20260129.
 - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
   operations to allow the DRM driver to query and configure the
   appropriate clock path based on the required output duty cycle.
   Updated commit message accordingly.
 - PATCH 2-5: Collected tags.
 - PATCH 6: Moved clk_ids to match enum order.
 - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
   to match order.
 - PATCH 8: Collected GUytterhoeven tag.
 - PATCH 9: Use single compatible string instead of multiple compatible
   strings for the two DU instances, leveraging a 'renesas,id' property
   to differentiate between DU0 and DU1. Updated commit message.
 - PATCH 10: Removed oneOf from clocks property, which is not sufficient
   to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
   existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
 - PATCH 14: Instead of using clk-provider API to select the right parent
   clock, just set the correct duty cycle based on the output. Updated
   commit message accordingly.
 - PATCH 15-16: Collected tags.
 - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
   Collected tags.
 - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
   Collected tags.
 - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
   of vclk1 for DSI Node and set to the right position.
 - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

v2->v3:
 - PATCH 1: Added missing defines for duty num/den.

Tommaso Merciai (20):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
 .../bindings/display/renesas,rzg2l-du.yaml    |  54 ++++++
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 175 +++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 ++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 183 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 +++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 15 files changed, 938 insertions(+), 44 deletions(-)

-- 
2.43.0

