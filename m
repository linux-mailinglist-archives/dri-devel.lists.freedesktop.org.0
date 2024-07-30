Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C2F9407F4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 07:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23D710E05C;
	Tue, 30 Jul 2024 05:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nOAQLwpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A106610E05C;
 Tue, 30 Jul 2024 05:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2AfX8OliVgr50FXOa731nHyJLAKAreK3Vp1TROfweOomzpyPJP5AWzXA8hG8JPknXppgOglwGqjLquT3MAgFUDldarttg3gStt9p5v7I/faRxsByp8zUsklH4ADQu4wniOnClnzbCdT2UHvfh/nTrIcGVXUWRcbWmZUb+9l5kEXm9molG08CyGu06RAZ0uf9lYZNshuwSsk3kVqt7J5rf59TmikzBx4J32We9TW/noxeKCvbg9S7JZoysbSKOnnFrk/MIuC9g9uaNag7Ip8Q1Gh1bgl6TC5Pn3Gs4i7pf1hjrApVbZ4wOIOSolbGW2e58aZFSR2Y/tGIyzBo1jhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGICi4aIESKpMvOANF2f6mpQPu9HUe0TZsLhZv0skrM=;
 b=tRvOPBSSYhPVjOLECED9KbuCWsz4kkJR3DOm04OzrneOQ1h6AwNt99YKSb9eDUgiq5H2nhqnfMmB0QT0lAgLRcVzMj4+P3DiVz/35IhR8COKVMzxc+VbIjqtCubAsw92IDVDj5Kw8Y5ImSZsOMnGwsIMUN1NkRJvUW5d0aF+3OdJ0JNZc/d7QZI5FmR/s5N/ly7QJOjJ4vrNcLp0PnvDYLdz/jrKzvyAPua0GW3g98a/92XIWWROl1HzopNDhW/YiaQe1qNZmYxxtf2nbiR8h06SfRno6JQW+JRwg2OezUmxvOcf/4Y7OhpBJaKjybtUZQlqKHtfT8RLQ5wD3Oh/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGICi4aIESKpMvOANF2f6mpQPu9HUe0TZsLhZv0skrM=;
 b=nOAQLwpAzJcsWrZMOXrS8v8JnvOAHo59odurRVHow9RGWfuVYQGHdHTHoWTKprbF9wJE2RbjacBissgjHGeRWAETjprHJVYdab3LtD+KzxFqMDp8fxQI7dBfJhKeurpHf0taFj07R0RHEPuVULhCOFRkxDVbd3onk1xakomX1t0=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 05:56:43 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 05:56:42 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "kevin@holm.dev" <kevin@holm.dev>, Linux regressions mailing list
 <regressions@lists.linux.dev>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Topic: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Index: AQHa4EIHlXNw8ZbqLEehA7MTA0aCA7IKx3CAgAKT1cA=
Date: Tue, 30 Jul 2024 05:56:42 +0000
Message-ID: <CO6PR12MB54896312D4BEAE30963FDC5EFCB02@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
In-Reply-To: <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=093394d7-c65c-42c8-a2e4-9a20ccfb951c;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-29T08:04:24Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|LV8PR12MB9110:EE_
x-ms-office365-filtering-correlation-id: b95e5415-abe8-4832-741c-08dcb05c62f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SURhMDh1WWVJenRDdEVBZTNsSW0yUlVzdHNNb3hPaVhKK3NWc0NYTjRjV2JW?=
 =?utf-8?B?OGMxNllzWGc0L1U1ZDFiR3hySnZPMStpZHY1ZTVHSllrVisxZld6aUxZelUx?=
 =?utf-8?B?emVVVURjZC9mZXpqZGJRekE0UkM4UDJtbEVoLzhRS1dTc3lPbnU1UjhHV3R5?=
 =?utf-8?B?QXpSSk9qbm16eXNBcGwyanNnNlg3WG96S0loeWFPcE0vU01Oc2pyTStuc00r?=
 =?utf-8?B?a0RnNldOZnI1V1RSbW96M1FQQjNzcXJaNGVFOGNMYU1XcTBvZDhmaEU5a2JU?=
 =?utf-8?B?Y25yc3pzU3JhL2dMM2dQbUVSbFVBVldtM3FWakdmWHpVNXQ2TGQvTHExNjha?=
 =?utf-8?B?YXJaQU4vN2V3RjBneXkyMzVucDJTbzM5S00vNzg4K2Z0aVZWeVIyZE5YeWE0?=
 =?utf-8?B?S3dkeTN1MWVicWRFd0xXZ3NxaytObkFWZmdoZXgzTXFwTW9EKzhGUERBMm94?=
 =?utf-8?B?RHhFRGdqWW1qODlWeFhGMW9BemZ1REs1SHRBUFZJc0xzNVVRMFp1UldHTS9y?=
 =?utf-8?B?RTFzSWlzT1lqTzN6L1FNRDRQZlB6R0g1ZzV0OVNNOHhVZzRtamNSblhtWmEv?=
 =?utf-8?B?b05XdmtiUi9LL2xKSC9XU01kazNTaDBzbWYxS2Z6eGpLZ3M3eEVHb1Iwbncx?=
 =?utf-8?B?TzZ3WFhJSlp6enF3VUxUQ2JqNE9rVHlMd01sQU1heTI5ODdTTFl2V0FPVEVM?=
 =?utf-8?B?RjJ2MWp1TmNtZE1DOXNIT3hGNFc1RjNxNHRwN0JTM0VNRldsSEN6cTJTRFFu?=
 =?utf-8?B?V3FITE1tNFdBRTJha3NQd2IvWWxRU1ZZK3dMZEh6MUkvendkUllXdXVNbDY5?=
 =?utf-8?B?YTJCRlp3dWx4L2twb1JPY3l4TXJTVmxlbDVXdk94TDRuUWVvbEFscXdSbVNi?=
 =?utf-8?B?RHB1VXg1MDJkMEFyWDV3WTRkUzdLOXRnbExUOFNmR21QV3ZJMVdRd3BqYlUy?=
 =?utf-8?B?SmgyaFFOWURvOEFWOGMraFlHS3NLMjBiQWVqUXQxYmdhc2trOEUzVTNsTmYw?=
 =?utf-8?B?SGNFcXZoQWo4LzNNMGFoZ3MrZzNuTmtLc2x0NmxhcHFuM1JkeEE3OUxGaE04?=
 =?utf-8?B?dzlJQjcyb1M4RU5xeHZVMW1uNE4vQ1dQKzBIN05ENUpYSkNjQlhoVzg3bm1l?=
 =?utf-8?B?c2pWZnpLdHIvOHh6WUxWNUZ2V296WENYblFSeDRIWHd3STR5emM2RGdvdnZE?=
 =?utf-8?B?QnVaYm1tVVVvMittb3Vsc2o0a0FIT1FhSk5ldGpLWkZFUGVjTFZWY2JZcURn?=
 =?utf-8?B?SUZoZ09Rc0NCOHRNNUNJbllBYXFReHhIRE9DUnNGNGJIYjIrUEMxZXJXMjZS?=
 =?utf-8?B?c1JycXh6SzZCQkcrMURVaDdJRlpzZzJXbElaNmlWejFaZERSSzRqQ2F4Qi90?=
 =?utf-8?B?TkU3NUN0dURTS3VvSkt4Uys2Y05ZUGVDV0Z0bVg1V0k4Ykg3OWRWVmphRFA0?=
 =?utf-8?B?ckZRamRwUitkODV2M0czakJZelVGbDJja2hhTTYvSytzUDNrV3NZZUNic2FM?=
 =?utf-8?B?dzYvQ1BIczNJSzlUM2tCWEtoV1BKQktOOUVOcEhqcHd4VnZFRnB1bWs0VXVq?=
 =?utf-8?B?TUQya01NeWU2Y1BIaGIyemFmTWVBZ0VjQmJjZExRWlNtL016K0FLcFMzdjNJ?=
 =?utf-8?B?YmtHSGpXWVNDM3prTFl5Ui85NE9yckdYSlNuUGhOT0Q4RGRYWitiYzVYQzVN?=
 =?utf-8?B?K3RUNGx0REV4eGorUW5qcHJESkQxNGxiK2d2aUpZSzh4a2pyQ21rMTlZWXJR?=
 =?utf-8?B?V0haUUpXd1MyaU9HYlRCNXRPSExrNnRncWdwQysrQ1BMczRhdWltemluZ0E4?=
 =?utf-8?Q?AYfD8lRr7s2/WPrHa09ftPW3+TUxomNX7aWeQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFlOOUU3NExkemxaVHI3VE9BU3BzRnFJdVhqMy9YVklzakJ0aWNJdVhaTEtK?=
 =?utf-8?B?aHJmWE9aeFU4NFV3ZWh6NUJPVmMxYjBUTi9HWjRrdER0cFhhclBNSC9qSEEr?=
 =?utf-8?B?aUYrcWJMQW9MdW5nZEFJakZlUFMvcG9HbDVpM2FDMktDY0JjMFpKeHJwVXdF?=
 =?utf-8?B?WUtZc25VSE1BMjhhcGk3bnA5Y0hjNGxJQ2RxOXFrY2VNNC9lOUtiMzRSYnlL?=
 =?utf-8?B?S0JvTmZUa0E4S0Fab0ltUTEvTUJ4bFZ6N2owR08xNDVNd3VEV3Fpd3psTlFE?=
 =?utf-8?B?WHhkN3lSUTBQekdLSVlrbUpYREhHa0M3MUhtdUdBelZwR3VVTElOa21zYm1P?=
 =?utf-8?B?NlBCckJLVjl6ZzAvMk91Tk1WWnNMY1NkM0FPZ1FnMmx2RTVuQUlTUFh1bTg4?=
 =?utf-8?B?Tks3bTJpbFNJUmVwV2Z1bVJDYkI3c1BFUWVoVHkwL1dQZ1pZN05qcU16QmlI?=
 =?utf-8?B?enpWU0pKc1p6VDRqT1RtTUZyZThXVlZaSVhwNDFRTVg0MTBQQjl5QkEvZ1Az?=
 =?utf-8?B?WGdpQkpqelNzQ1R3Z3hLejY4cFhmN1pGaEkyclhHRmpJbmNvWHp5YmhWU2dG?=
 =?utf-8?B?MCsrSGE0TUNXMUNmU2V0QW1OamNOaFgvQy9GQ3hWWjNNd1I0cElDVmNHMjFF?=
 =?utf-8?B?cWhBZGQwbzV6eFhmdlFxTXhYWGdpcG5LUUt1TzB3UVNBbmVxNk9wM3ZYQXIr?=
 =?utf-8?B?ckVYSmE0aTRmZUQ5cXZDZnZJT1VmN2FsT3hDRVJXb2JFRi9takZMM3oxdG5E?=
 =?utf-8?B?Qi9Hck5vd0FQK0xmc29zNk1jakdQeklONVpsS0l0SnhGZExIQXBOSjFyTUpk?=
 =?utf-8?B?b1hsQ3ZySDRXalhaS25WTzdRaHJsWWlqVmdWanpBcU9RWERtUmZNdHRPTDRJ?=
 =?utf-8?B?VEhZb0MrTkcxVGlSSEhRa2hCMGNibmtYWWlvU3FGQm5LSk8vVExPdXRyWWhq?=
 =?utf-8?B?Y2FuL09uOTVTZVgxRVFvK29iY2pJZHRzZDRsNXpJMXNReUtHZkpFZEJOZExO?=
 =?utf-8?B?MER4ZGJBcnRoK0UzZ1UyZlUrbHJvd2gxS29LVWVhdmx3dyt1cGtrZXdld09h?=
 =?utf-8?B?QTJFTjd1Ly9ROTgwTFhUMlFBK3lZNmhOR0l5VUJiM3RpVmQyaU8xczB4ZW93?=
 =?utf-8?B?dmowMWRHakFZRGVab3drNWIvZXRINlhLYzRtMkdWYVhtWCtFTm9IMk1SdWNG?=
 =?utf-8?B?RjJ5S25Wckc3b055a1dmdmVncW5kL3h0MjVvUytBMzFudDZ3U24vS0lKQmFi?=
 =?utf-8?B?WUVKbXEvR1g0NWNtaDlOcU5WZlNreHlmRGw2bzhBS0F4MzByOWU1OHo0MDNH?=
 =?utf-8?B?WVJyOVZIL2VQRUNSbUE2c0ZybjZBRkE2R2hrQmdHZWNCNFNtNGdHbS80RU9S?=
 =?utf-8?B?TW5xZi9URXhWUnBRcFhrSWRLSEhBUmlCSk1VRHVxK1lUMjVHVmxjcnBKQVhm?=
 =?utf-8?B?SzNCYnl3ZUJiK1hFMUgvenBkY1B4dmErZlBLUjNuSmoxME0xcjNaR2RHTzZ2?=
 =?utf-8?B?dzhWU0c2TlpkMzIwc2pXN0YyTVA0RVZlQ1ZKYklsZjBrdGo5eWZEYUxhMnFt?=
 =?utf-8?B?Q3FIbEt2Zk5lRGZHd0pVTWcvQXFoUWlkQ2dhUW4xYkZFbXlXNEc3Uk5OeEpV?=
 =?utf-8?B?MVpSSFBkZUYyZ2VUSnh3bTFtakFtaHNZRE5qZEtGcko3eE9LclliWWQyVFZu?=
 =?utf-8?B?WlNoQXppQ25MbGFPaWNsWXhaNkdLRE43N091ZXl0Q3J6bU9uR2VmdFRaN2Ja?=
 =?utf-8?B?aWpWS2wzc3ZOc2pERmoxZUFISzFCV05zWnJjeld3UXUxODI1L1g5cEVJcTBT?=
 =?utf-8?B?c3c4NnJOMzZuWEpUMmh3Qmo3V0hGVGluU1hkUWZiaXpvRVk1TTgvWFc3dlk2?=
 =?utf-8?B?bFFpYXdMYkxBaWkvWmNUNjY0ZFAyZFpxKzVSWUg0TXhHWm85WUNwZ3gzMURp?=
 =?utf-8?B?U3VLZzkyZS9FVUFHYm9qcU5xclpSSGlxb0gySVhrSS9jMXU1UnRyQy9wa284?=
 =?utf-8?B?VlI5QklxYnpNaDBvKzlWVG80emovdEJRQXVTTWQ5RmVleWhTbkhQamJyTzVr?=
 =?utf-8?B?alNlZEJUK1hZWWNYZjlNWXpEbHUvVVp2d2Q5UnJsamNIZkczNkQwU2ZSdjl5?=
 =?utf-8?Q?uVAY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95e5415-abe8-4832-741c-08dcb05c62f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 05:56:42.3046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSK1GVDJwzYlZm8imsjfvoFmd6g3dGrDGOSPfDqnqUABeJrGVne365rM66SmoYYeksJnfzerPPwrK8i98M+eng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
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

W1B1YmxpY10NCg0KSGksDQpUaGFua3MgZm9yIHRoZSByZXBvcnQuDQoNClBhdGNoIGZhNTc5MjRj
NzZkOTk1ICgiZHJtL2FtZC9kaXNwbGF5OiBSZWZhY3RvciBmdW5jdGlvbiBkbV9kcF9tc3RfaXNf
cG9ydF9zdXBwb3J0X21vZGUoKSIpDQppcyBraW5kIG9mIGNvcnJlY3RpbmcgcHJvYmxlbXMgY2F1
c2luZyBieSBjb21taXQ6DQo0ZGY5NmJhNjY3NjAzNCAoImRybS9hbWQvZGlzcGxheTogQWRkIHRp
bWluZyBwaXhlbCBlbmNvZGluZyBmb3IgbXN0IG1vZGUgdmFsaWRhdGlvbiIpDQoNClNvcnJ5IGlm
IGl0IG1pc3NlcyBmaXhlcyB0YWcgYW5kIHdvdWxkIHN1Z2dlc3QgdG8gYmFja3BvcnQgdG8gZml4
IGl0LiBUaGFua3MhDQoNClJlZ2FyZHMsDQpXYXluZSBMaW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbToga2V2aW5AaG9sbS5kZXYgPGtldmluQGhvbG0uZGV2Pg0KPiBTZW50
OiBTdW5kYXksIEp1bHkgMjgsIDIwMjQgMTI6NDMgQU0NCj4gVG86IExpbnV4IHJlZ3Jlc3Npb25z
IG1haWxpbmcgbGlzdCA8cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2PjsgRGV1Y2hlciwNCj4g
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgV3UsIEhlcnNlbg0KPiA8aGVy
c2VueHMud3VAYW1kLmNvbT47IExpbiwgV2F5bmUgPFdheW5lLkxpbkBhbWQuY29tPg0KPiBDYzog
cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2OyBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBMS01M
IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IE1MIGRyaS1kZXZlbCA8ZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUkVHUkVTU0lPTl0gTm8gaW1hZ2Ugb24gNGsgZGlzcGxheSBw
b3J0IGRpc3BsYXlzIGNvbm5lY3RlZA0KPiB0aHJvdWdoIHVzYi1jIGRvY2sgaW4ga2VybmVsIDYu
MTANCj4NCj4gPiBbYWRkaW5nIGEgZmV3IHBlb3BsZSBhbmQgbGlzdHMgdG8gdGhlIHJlY2lwaWVu
dHNdDQo+ID4NCj4gPiBIaSEgVGh4IGZvciB5b3VyIHJwZW9ydC4NCj4gPg0KPiA+IE9uIDI3LjA3
LjI0IDE4OjA3LCBrZXZpbkBob2xtLmRldiB3cm90ZToNCj4gPg0KPiA+ID4NCj4gPiA+IENvbm5l
Y3RpbmcgdHdvIDRrIGRpc3BsYXlzIHdpdGggZGlzcGxheSBwb3J0IHRocm91Z2ggYSBsZW5vdm8g
dXNiLWMNCj4gPiA+DQo+ID4gPiAgZG9jayAodHlwZSA0MEFTKSB0byBhIExlbm92byBQMTRzIEdl
biAyICh0eXBlIDIxQTApIHJlc3VsdHMgaW4gbm8NCj4gPiA+DQo+ID4gPiAgaW1hZ2Ugb24gdGhl
IGNvbm5lY3RlZCBkaXNwbGF5cy4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+ICBUaGUgQ1BV
IGluIHRoZSBMZW5vdm8gUDE0cyBpcyBhICdBTUQgUnl6ZW4gNyBQUk8gNTg1MFUgd2l0aCBSYWRl
b24NCj4gPiA+DQo+ID4gPiAgR3JhcGhpY3MnIGFuZCBpdCBoYXMgbm8gZGlzY3JldGUgR1BVLg0K
PiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gIEkgZmlyc3Qgbm90aWNlZCB0aGUgaXNzdWUgd2l0
aCBrZXJuZWwgdmVyc2lvbiAnNi4xMC4wLWFyY2gxLTInDQo+ID4gPg0KPiA+ID4gIHByb3ZpZGVk
IGJ5IGFyY2ggbGludXguIFdpdGggdGhlIHByZXZpb3VzIGtlcm5lbCB2ZXJzaW9uDQo+ID4gPg0K
PiA+ID4gICc2LjkuMTAuYXJjaDEtMScgYm90aCBjb25uZWN0ZWQgZGlzcGxheXMgd29ya2VkIG5v
cm1hbGx5LiBJIHJlcG9ydGVkDQo+ID4gPg0KPiA+ID4gIHRoZSBpc3N1ZSBpbiB0aGUgYXJjaCBm
b3J1bXMgYXQNCj4gPiA+DQo+ID4gPiAgaHR0cHM6Ly9iYnMuYXJjaGxpbnV4Lm9yZy92aWV3dG9w
aWMucGhwP2lkPTI5Nzk5OSBhbmQgd2FzIGd1aWRlZCB0bw0KPiA+ID4NCj4gPiA+ICBkbyBhIGJp
c2VjdGlvbiB0byBmaW5kIHRoZSBjb21taXQgdGhhdCBjYXVzZWQgdGhlIHByb2JsZW0uIFRocm91
Z2gNCj4gPiA+DQo+ID4gPiAgdGVzdGluZyBJIGlkZW50aWZpZWQgdGhhdCB0aGUgaXNzdWUgaXMg
bm90IHByZXNlbnQgaW4gdGhlIGxhdGVzdA0KPiA+ID4NCj4gPiA+ICBrZXJuZWwgZGlyZWN0bHkg
Y29tcGlsZWQgZnJvbSB0aGUgdHJvdmFsZHMvbGludXggZ2l0IHJlcG9zaXRvcnkuDQo+ID4gPg0K
PiA+ID4NCj4gPiA+DQo+ID4gPiAgV2l0aCBnaXQgYmlzZWN0IEkgaWRlbnRpZmllZA0KPiA0ZGY5
NmJhNjY3NjAzNDU0NzFhODVlZjdiYjI5ZTFjZDRlOTU2MDU3DQo+ID4gPg0KPiA+DQo+ID4gVGhh
dCdzIDRkZjk2YmE2Njc2MDM0ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgdGltaW5nIHBpeGVsIGVu
Y29kaW5nIGZvcg0KPiA+DQo+ID4gbXN0IG1vZGUgdmFsaWRhdGlvbiIpIFt2Ni4xMC1yYzFdIGZy
b20gSGVyc2VuIFd1Lg0KPiA+DQo+ID4gRGlkIHlvdSB0cnkgaWYgcmV2ZXJ0aW5nIHRoYXQgY29t
bWl0IGlzIHBvc3NpYmxlIGFuZCBtaWdodCBmaXggdGhlIHByb2JsZW0/DQo+DQo+IFJldmVydGlu
ZyBpcyBub3QgZWFzaWx5IHBvc3NpYmxlOg0KPg0KPiAkIGdpdCBjaGVja291dCB2Ni4xMA0KPiBb
Li4uXQ0KPiBIRUFEIGlzIG5vdyBhdCAwYzM4MzY0ODI0ODEgTGludXggNi4xMA0KPg0KPiAkIGdp
dCByZXZlcnQgNGRmOTZiYTY2NzYwMzQ1NDcxYTg1ZWY3YmIyOWUxY2Q0ZTk1NjA1Nw0KPiBBdXRv
LW1lcmdpbmcNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMNCj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbg0K
PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYw0KPiBlcnJvcjogY291bGQgbm90IHJldmVydCA0ZGY5NmJhNjY3NjAuLi4gZHJtL2FtZC9k
aXNwbGF5OiBBZGQgdGltaW5nIHBpeGVsDQo+IGVuY29kaW5nIGZvciBtc3QgbW9kZSB2YWxpZGF0
aW9uDQo+DQo+IEkgZG8gbm90IGtub3cgZW5vdWdoIHRvIHRyeSBhbmQgc29sdmUgdGhlIGNvbmZs
aWN0IG15c2VsZiB3aXRob3V0IGJyZWFraW5nDQo+IG1vcmUgdGhpbmdzLg0KPg0KPiA+DQo+ID4g
Pg0KPiA+ID4gYXMgdGhlIGZpcnN0IGJhZCBjb21taXQgYW5kDQo+IGZhNTc5MjRjNzZkOTk1ZTg3
Y2EzNTMzZWM2MGQxZDVlNTU3NjlhMjcNCj4gPiA+DQo+ID4NCj4gPiBUaGF0J3MgZmE1NzkyNGM3
NmQ5OTUgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIGZ1bmN0aW9uDQo+ID4NCj4gPiBkbV9k
cF9tc3RfaXNfcG9ydF9zdXBwb3J0X21vZGUoKSIpIFt2Ni4xMC1wb3N0XSBmcm9tIFdheW5lIExp
bi4NCj4gPg0KPiA+ID4NCj4gPiA+IGFzIHRoZSBmaXJzdCBjb21taXQgdGhhdCBmaXhlZCB0aGUg
cHJvYmxlbSBhZ2Fpbi4NCj4gPiA+DQo+ID4NCj4gPiBIbW0sIHRoZSBsYXR0ZXIgY29tbWl0IGRv
ZXMgbm90IGhhdmUgYSBmaXhlcyB0YWcgYW5kIG1pZ2h0IG9yIG1pZ2h0IG5vdA0KPiA+DQo+ID4g
YmUgdG8gaW52YXNpdmUgdG8gYmFja3BvcnQgdG8gNi4xMC4gTGV0J3Mgc2VlIHdoYXQgdGhlIEFN
RCBkZXZlbG9wZXJzIHNheS4NCj4gPg0KPiA+ID4NCj4gPiA+IFRoZSBpbml0aWFsIGNvbW1pdCBv
bmx5IHN0aWxsIHNob3dzIGFuIGltYWdlIG9uIG9uZSBvZiB0aGUgY29ubmVjdGVkDQo+ID4gPg0K
PiA+ID4gIDRrIHNjcmVlbnMuIEkgaGF2ZSBub3QgaW52ZXN0aWdhdGVkIGZ1cnRoZXIgdG8gZmlu
ZCBvdXQgYXQgd2hhdCBwb2ludA0KPiA+ID4NCj4gPiA+ICBib3RoIGRpc3BsYXlzIHN0b3BwZWQg
c2hvd2luZyBhbiBpbWFnZS4NCj4gPiA+DQo+ID4NCj4gPiBDaWFvLCBUaG9yc3RlbiAod2Vhcmlu
ZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkNCj4gPg0K
PiA+IC0tDQo+ID4NCj4gPiBFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0IExpbnV4IGtl
cm5lbCByZWdyZXNzaW9uIHRyYWNraW5nOg0KPiA+DQo+ID4gaHR0cHM6Ly9saW51eC1yZWd0cmFj
a2luZy5sZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRyDQo+ID4NCj4gPiBJZiBJIGRpZCBzb21ldGhp
bmcgc3R1cGlkLCBwbGVhc2UgdGVsbCBtZSwgYXMgZXhwbGFpbmVkIG9uIHRoYXQgcGFnZS4NCj4g
Pg0K
