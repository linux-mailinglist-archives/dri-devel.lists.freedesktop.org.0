Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70469956AF9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 14:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8DF10E25C;
	Mon, 19 Aug 2024 12:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uGPdnoBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EE010E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 12:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlHi1Tmuw6TtBAskDQwGZZe1v/e0mNw/QwuwDIvKDZeABQRwI8XS0t0f/9v8iYj2S4yzYxzVSnkxKGCK20J2JOC9dBwVozWdjG7IjwO6vgfgjwhy0ivALyZvQZ06PLCU6T9Mhr5zwE1wbJ5rp9fZHxnp6Btkyux8EOXDU533EpPLIJ9vYK1ufZizCSlGoZrotbKMnLbRzQcn3djycaryEqbZzea6inMepcp14gav1nmXxQZCf8/lELuMDRZ4/sgCTWdeB1OwfCY/kGtfxjSorDyd0xzR1Pe/gdmu7Hvr8EKHj8KfZ5Fnq6jZejyRQU7zKybiyWDj1PJeoJS8G/CfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXZGMSuC+nXkSW+cXQSwscgNbfDwO+4PKfFbr5bTuNA=;
 b=LMGrxFDPbsPsLE84ZqP+R4eW3GnoGp+PYMA4YTMBpjQCgeBRW8bAPytg0Kqn0R5DD3mJIpXr+3BHSRrWdkNB0V3VK1t0o6ckXOORWKxyik3yQ5Rbaj/r4hn41g2ydZhj6CQmq2zx0MqJlihjA1kKSnHJsYAYI+dlKwrQK0eZ4081Mo1xK7U33q+jnGPRNr25CAltkO+5eFsfIrWUqlokxxhdtF8qk8LkW0LsiS1aFhlPuu0Llb4lKRshmeaSl0GLekroT++4UljMdhs3q3VpaMvtvvN4gs/OxuirhEy8cVyfohOSt/eEo+b9Ylprxz6OzOH4j+J7vuN+SUw49OBi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXZGMSuC+nXkSW+cXQSwscgNbfDwO+4PKfFbr5bTuNA=;
 b=uGPdnoBl1o6U1sVwV9d7oDTVAvNpa6NbwbCncTv6MRtOeQ7opEIL1PQ07zG/2mPkiUOdIRssDfg+APYNXle6cpyJKFgDDkko4vJI3Ri1247qr1M/ox2bBae+Rl6rGwXfvLJBS9hIMF7hLci4d97K9NIzLYttndWYNZxRujCPhzc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9945.jpnprd01.prod.outlook.com (2603:1096:604:1e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 12:37:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 12:37:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: renesas, rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHa51OeDAJ50N6hlE+dnXg1qW6SlbIlbhQAgAA0N4CACPdU0A==
Date: Mon, 19 Aug 2024 12:37:08 +0000
Message-ID: <TY3PR01MB11346EC4C14C99A1771DE9A6C868C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
 <20240813163220.GA1164014-robh@kernel.org>
 <20240813193913.GH24634@pendragon.ideasonboard.com>
In-Reply-To: <20240813193913.GH24634@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9945:EE_
x-ms-office365-filtering-correlation-id: 370adc74-c8f7-4653-c8e8-08dcc04ba3ac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?N1BUOW5OY2I3clJ3VHE1SldjM0NOd2o4V2paMHcyc2loL0lnOVpyYnU5M3Jv?=
 =?utf-8?B?L21NeUtidUpkQTVMTWE2WnkwSUtFSDE2cWpqamFFUld2aEhIVjhlTHh0OEg4?=
 =?utf-8?B?VGszMElMRTJqOXE4RW8ycWVtaHRVL1JuUGRWQnZhNjJHSGtZNFQwOU9ZYmJn?=
 =?utf-8?B?UEFJeTk3eFUxcFZ0bEVmVEUzUlVBZUZkbDNUNkp5SWJaMVdSWHpvVStCTmtv?=
 =?utf-8?B?TGx0UnQ0VjZrR0FEZDg3NkNoSFlmNjl4a1Y3VXROcnU5bElsS3NocHN4aVkr?=
 =?utf-8?B?dTJwY0VoV1ZpZUR2SFpYalRzeUY0bWY0anhkaGdzcFJRLytzcDR3aXg2Vjhq?=
 =?utf-8?B?amdzVitWem4yUFVadGgyMmFBRHU3SjViMVJMK2p0MTlSRVEvandsTmRIMUF2?=
 =?utf-8?B?ODhNcDh6clFGc3BnaVkzdTJXa3lOY1BOT0IwYnZ2VEw2bnNITFhhNW1WejRF?=
 =?utf-8?B?VWJLZU9NV1pNSVlXZ0ZRVGkwNWdXQUVtenhRRGlwTDdoZjUrUE1HNzQ0dU5Q?=
 =?utf-8?B?RFk5U0tUMjVQOU9BZkQ2SHIzL1RLSjN2aFZJQ3lPazNHK1lOZGZDTjFCUGMz?=
 =?utf-8?B?Z0d3elRwemV2cjl1bUxVRGVUdjZPN09hZDNtVTJkR0hndWdXOUdKZ1ovY2kx?=
 =?utf-8?B?VGFvUWljM0xaTDlqNmQyTDVkS1JUVXJZRS9VNC85S25IRzVMcXpyZjlhL0cy?=
 =?utf-8?B?QXQ4bE9Xa2FMY2I3bndvZFYyMG1GRHowakYxUnZ5K2RISEVYUU9BLy94OGtW?=
 =?utf-8?B?SjduSXRIWmI5UVR2N1VxR2t6MWI4MklTSU4zUE4zSlZsSzQ3VmJZbkEzc1JR?=
 =?utf-8?B?WkhKWFYvSXcyQlpPTW0yM3hjTzVnRkhwZ3hLelpnSUpjWFYvbmlqRVFSTUpp?=
 =?utf-8?B?UEFXZUhDMG9RRThERnBqc3JBUzBLYnJtSXBMTFREZkVxbXphaWlYUHY2akdL?=
 =?utf-8?B?Z1hGOElwK2V3QXpnamFHVzBZMHAxeFVWTndLTVNJTVh4TTc0WU5JOGJZcFpZ?=
 =?utf-8?B?WTFhTDRRWUJOVHJnUzR5d3VZNGc5RittSi9vMmU2WjRIbWxtaEYwekptTE0v?=
 =?utf-8?B?c2FHUlduNW81RUd6NWZRckdCenJ5ekRITmg4TXlNT2JzK2orcUVKNVhNM2NU?=
 =?utf-8?B?OEFlejAwN0hDM1lwSzIzWTgyM0VNK0hHelZhdEdxTjBmSC8zMDBpVHd4d3Vq?=
 =?utf-8?B?QzJrT3lPQ2p5dkVzU1lEcWhiRDgrMHVXVmlQRkJ6ZzlRVjA3RDhxUTFIK2o3?=
 =?utf-8?B?N0xRNW5QNVBsYnRoOU5vZzFhRklJeEl3MzZyQzRianFySW5nc3BZNGFtV3E5?=
 =?utf-8?B?TUw2OGNkaHY1cHQ3K2dwNFV5RGR3Z1dOTHZtVHh2OTlaYVZXN0dMczVaWDJR?=
 =?utf-8?B?dWNLd2o5Q0dlelJXMG1YN2RCUzM5Q1ExTXBORVppdjVreVhFWkNHVm5RUjdz?=
 =?utf-8?B?ZEI0TVQzS2ZjV3Zqa2xldDk5eEExTDJsUjMyUUR3V1BFVTdKSUhhOVRVYlJC?=
 =?utf-8?B?WklXNzFOMmo3RlZjR05iWkxGc25MOHhaNjRNaW5IdUVOVnRndzBlM0FIRGd4?=
 =?utf-8?B?eURUTmRGc0Q0My9FWlJNME5hV0JZZXJ4TW4rNmZncnl6Und2TnZBY0ZmU0dS?=
 =?utf-8?B?cFJBL3lrYTNENHlnNGtBTWI3UVNsUWcvd2Rsc3MwRmkvYjZ3SncyMXRsT1Vo?=
 =?utf-8?B?ZUw2YmE4WjlpOXR2S3JKTzNDaWc3SlR6NThUR245alFuRkpFbndWYUZ1RzFD?=
 =?utf-8?B?eWx4SnRMOXV6cVp0RjdqNmJyRU5LQWROK3FTaStnT1hMdGl3RVZlaEwwZVRB?=
 =?utf-8?B?QXhPdmw2ZFRnN0JDNWNEYk5wSXBtN0dxN2Q3ZlNBMlVLUU5sZXpJd0xjREdy?=
 =?utf-8?B?S2VCZTdwM0VYemNsdEFlakdRU0dNSXVQMGF3bU5mM3dTZEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHhWUCt2cUgrcFJaREx5WEdjaEtvQzdaZU1xeHQ0dXZ5UERXN1BMMDFHTG5m?=
 =?utf-8?B?ZWVzd2xXbWhYQjdMRU9sL0thSEl0WXdWcFRQNmliWmV5ZHpwRXpqcm9DcENh?=
 =?utf-8?B?SGJmSzc5ZVB0UStjczdwVkdqU3VYYW13M0lNQ3hDY2VsMG5KRnlCVzFaTGV2?=
 =?utf-8?B?UXlYaVlnOU1jcVQ0MDZkWml3MHUzOERoem1TV2xaZVQzRWFFWDJGc0JZemI4?=
 =?utf-8?B?WEo2NWw4SmRQdkVjeC9MamJMS1h3ZHUyVExBZUFXOUcyZE1LZGMweWxHS2gz?=
 =?utf-8?B?S0QwR3FlbWh1ZVRBcnQ3UWtHRkhJRTUxa081bXNlYURxUHlwaURsQnRlb0cr?=
 =?utf-8?B?SnJXV1gwZWg5N2NyTlRmOXdwcm9QMkJYQmsxb1dTMFJPeU4zcktjeXFiRjNH?=
 =?utf-8?B?S21mR1Y3NFhWb0lhUG9wa25pWHNGL253ZDV6enlPZ1V3dlp6QTRScjZ5Yzcw?=
 =?utf-8?B?bmZ6eFdSMHM3TWhhdDEzc1JzUk84c3pwUHJDNVVGNTdFS1ozMU5McTg0VE9X?=
 =?utf-8?B?NHVvbUIxemJ3RHpHd2VuL0EyN2xISXV0ejRORFhDSFNHRjFpV1I5Y3JIc1ZU?=
 =?utf-8?B?UnpmSHNMb0ZwZUhFWDdzUDlGM3ZEN0lpVnJXMThOSzBIL3k3cVFKVnpkRDJC?=
 =?utf-8?B?S3FHbWJMRDVwQ2Y3MTgwMTZLd0psayswcXZHUjVYZk1CeDVpSEdHZ25LWXFL?=
 =?utf-8?B?bUpQTytkL0hrN0V2K0lTcENGZnF3eGdMbVZBOUxyd1pZT0dLSFBKWnFIK0FR?=
 =?utf-8?B?L3NqeVpmZnNqNnlnSWE4cUxDTm5JQkRSMmFFV3EyYVRjMFRPZVN6RzU2OGZU?=
 =?utf-8?B?V3laL0sxa3ZPSFFsR2V4aHBBMU5ScUM3Y1dKL3pjanlVK0JKNC9mMlg4Und5?=
 =?utf-8?B?MXh6YUVpNFJCNDl2V3BLZ3lqRm5oQzBHdGYyMGpRdkUrQkVNbDhtNTkzMUlK?=
 =?utf-8?B?UUdidGhlanpUZ1hnbzhjZlZTSWJNSnRHOGJjZFZOSDBLK0xrRldEU0pMWFJ3?=
 =?utf-8?B?RUVFTWFzZEtSMWtPSnBTTklpeXdyZnBFek5MNlNHcU92dUF4K0VISURnQlZU?=
 =?utf-8?B?eDI5bldDMWwydmpTNTlGd2VtdlgxOExTeUxGZG5tM29FOWZHeGVOSzdWdHcr?=
 =?utf-8?B?NlFrVDc5Vzg3cGQ0MCtJdU5UVkZTaUxTNGhoQUFLd0cwbFJzY2ZGTktzaUd4?=
 =?utf-8?B?NE9UZC9MVWFRampkZ2NjUWlDY0wySndGcVl2aW9PcG8zMG5INjlFRHg1alli?=
 =?utf-8?B?TlNoNVFKUUhINkZLUFRvYkFEV3BFTVR6MzF4NnB1QjRYdm1aNytuSGs3aVNK?=
 =?utf-8?B?UTdCa2I2RzRiT21Fb3J1YzBITlRTRWpIWlk1TUI5b09OQjE2OHg1cW9DaCs1?=
 =?utf-8?B?eVdTQkFKM2tWRW5NU1N1MFVGdlhsYjJEUjdFTStnZGdzRElFUHNNQ0g4Y3ZO?=
 =?utf-8?B?d0JzS1dGRkhpTGI1MG1DSVJaTm1RdWlRUW5sYklmTlZEWnNjMzRHNERCQitH?=
 =?utf-8?B?L3ZZSmFmUVU1ODVOOS90U2ZzeUZPajZyNGhTdmFxUmhHSGtQM3c4YU9qL2ZU?=
 =?utf-8?B?UDJUelBJQWxaTjJGYS83SlFydm5WSUF5TVVkL3pnS0E4MkxJYTNBTTBIN3hW?=
 =?utf-8?B?ZWZjTHlhVlJ0QUtBV05JMTdvTDFjSG9NZFBaZjFnZWg5VTJHS2gyTG41RHN6?=
 =?utf-8?B?cDBGb0IxSS9IYXAxcmdkanVpdzhVZ0NndzN0UHo4SjhRQzl3b2VTN2ZGSisw?=
 =?utf-8?B?SmhCdnV4cFgzc2dTdWM5emhWSjAzRlhVbzBkNEVHTWgwMm9BTFhmTUg3RDFY?=
 =?utf-8?B?Q2plYjhLRTZNaTV0c2pWVjJKc0xuZ2xnNitsSCt3S3N0eTVoTzhmM0tpdG5Z?=
 =?utf-8?B?NDlmV1h0SUQ2clpmendqRFZSQ1JKeCtNOWQzdnBUSnpDdEhyZ1UwZTMzcWdm?=
 =?utf-8?B?ZUpESUVRcm00QnphdXFJM01QRUxTaXlUbzFIb3BpUG9BREVwa3F2WGx4VCti?=
 =?utf-8?B?RDdwOXZZOEZzcTZYano2UDNhWUdrczVMNkkxWnBCMEl3bnpyS20wZ2N3aVVl?=
 =?utf-8?B?aHpEclQ1TGcyRmJvM2Q1aTNzVGp0d3pZRTd5b0tQWXhTMzB6bnNHVW04WWxJ?=
 =?utf-8?B?c3U3OFlBanVrbkxTSHU4YVR1cmp6bi9IaGh6QVc5Q3RObFBJdVM5NlowTjZP?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370adc74-c8f7-4653-c8e8-08dcc04ba3ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 12:37:08.0541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9Axjguo+7hcVWuwYdQz09aSIhIN5RZRw/k4fe3Bfl6sAzcSwAxcr740t6B/vcTEmejWB7AqfCE86FZ9DCxzJ2ce9qd8P00XvmpMWkI48+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9945
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

SGkgTGF1cmVudCBhbmQgUm9iLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaw0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAy
MDI0IDg6MzkgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzRdIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiByZW5lc2FzLHJ6ZzJsLWR1OiBEb2N1bWVudCBSWi9HMlVMIERVIGJpbmRpbmdzDQo+
IA0KPiBIaSBSb2IsDQo+IA0KPiBPbiBUdWUsIEF1ZyAxMywgMjAyNCBhdCAxMDozMjoyMEFNIC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiBPbiBNb24sIEF1ZyAwNSwgMjAyNCBhdCAwNDo1
MjozNVBNICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IERvY3VtZW50IERVIGZvdW5kIGlu
IFJaL0cyVUwgU29DLiBUaGUgRFUgYmxvY2sgaXMgaWRlbnRpY2FsIHRvDQo+ID4gPiBSWi9HMkwg
U29DLCBidXQgaGFzIG9ubHkgRFBJIGludGVyZmFjZS4NCj4gPiA+DQo+ID4gPiBXaGlsZSBhdCBp
dCwgYWRkIG1pc3NpbmcgcmVxdWlyZWQgcHJvcGVydHkgcG9ydEAxIGZvciBSWi9HMkwgYW5kDQo+
ID4gPiBSWi9WMkwgU29Dcy4gQ3VycmVudGx5IHRoZXJlIGlzIG5vIHVzZXIgZm9yIHRoZSBEUEkg
aW50ZXJmYWNlIGFuZA0KPiA+ID4gaGVuY2UgdGhlcmUgd29uJ3QgYmUgYW55IEFCSSBicmVha2Fn
ZSBmb3IgYWRkaW5nIHBvcnRAMSBhcyByZXF1aXJlZA0KPiA+ID4gcHJvcGVydHkgZm9yIFJaL0cy
TCBhbmQgUlovVjJMIFNvQ3MuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2Mi0+djM6DQo+
ID4gPiAgKiBSZXBsYWNlZCBwb3J0cy0+cG9ydCBwcm9wZXJ0eSBmb3IgUlovRzJVTCBhcyBpdCBz
dXBwb3J0cyBvbmx5IERQSS4NCj4gPiA+ICAgIGFuZCByZXRhaW5lZCBwb3J0cyBwcm9wZXJ0eSBm
b3IgUlove0cyTCxWMkx9IGFzIGl0IHN1cHBvcnRzIGJvdGggRFNJDQo+ID4gPiAgICBhbmQgRFBJ
IG91dHB1dCBpbnRlcmZhY2UuDQo+ID4NCj4gPiBXaHk/IEhhdmluZyBwb3J0IGFuZCBwb3J0cyBp
cyBqdXN0IGEgbmVlZGxlc3MgY29tcGxpY2F0aW9uLg0KPiANCj4gSSBhZ3JlZSB0aGF0IG1ha2lu
ZyB0aGUgcG9ydHMgbm9kZSBtYW5kYXRvcnksIGV2ZW4gd2hlbiB0aGUgZGV2aWNlIGhhcyBhIHNp
bmdsZSBwb3J0LCB3aWxsIHNpbXBsaWZ5DQo+IHRoZSBiaW5kaW5ncy4gSW4gaGluZHNpZ2h0IHdl
IHNob3VsZCBuZXZlciBoYXZlIG1hZGUgcG9ydHMgb3B0aW9uYWwsIGJ1dCB0aGF0IGNhbid0IGJl
IGNoYW5nZWQuDQo+IA0KPiA+ID4gICogQWRkZWQgbWlzc2luZyBibGFuayBsaW5lIGJlZm9yZSBl
eGFtcGxlLg0KPiA+ID4gICogRHJvcHBlZCB0YWdzIGZyb20gQ29ub3IgYW5kIEdlZXJ0IGFzIHRo
ZXJlIGFyZSBuZXcgY2hhbmdlcy4NCj4gPiA+IHYxLT52MjoNCj4gPiA+ICAqIFVwZGF0ZWQgY29t
bWl0IGRlc2NyaXB0aW9uIHJlbGF0ZWQgdG8gbm9uIEFCSSBicmVha2FnZS4NCj4gPiA+ICAqIEFk
ZGVkIEFjayBmcm9tIENvbm9yLg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvcmVuZXNhcyxyemcybC1kdS55YW1sICAgIHwgMzUgKysrKysrKysrKysrKysrKystLQ0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxyemcybC1kdS55YW1sDQo+ID4gPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+
ID4gaW5kZXggMDhlNWI5NDc4MDUxLi5jYTAxYmYyNmM0YzAgMTAwNjQ0DQo+ID4gPiAtLS0NCj4g
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxy
emcybC1kdS55YW1sDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbQ0KPiA+ID4gKysrIGwNCj4gPiA+IEBAIC0x
OCw2ICsxOCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICBjb21wYXRpYmxlOg0KPiA+ID4gICAg
ICBvbmVPZjoNCj4gPiA+ICAgICAgICAtIGVudW06DQo+ID4gPiArICAgICAgICAgIC0gcmVuZXNh
cyxyOWEwN2cwNDN1LWR1ICMgUlovRzJVTA0KPiA+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlh
MDdnMDQ0LWR1ICMgUlovRzJ7TCxMQ30NCj4gPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ID4gICAg
ICAgICAgICAtIGVudW06DQo+ID4gPiBAQCAtNjAsOCArNjEsOSBAQCBwcm9wZXJ0aWVzOg0KPiA+
ID4gICAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+
ID4gPiAgICAgICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPg0KPiA+ID4g
LSAgICByZXF1aXJlZDoNCj4gPiA+IC0gICAgICAtIHBvcnRAMA0KPiA+ID4gKyAgcG9ydDoNCj4g
PiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ID4g
PiArICAgIGRlc2NyaXB0aW9uOiBDb25uZWN0aW9uIHRvIHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9y
dC4NCj4gPiA+DQo+ID4gPiAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiA+
DQo+ID4gPiBAQCAtODMsMTEgKzg1LDM4IEBAIHJlcXVpcmVkOg0KPiA+ID4gICAgLSBjbG9jay1u
YW1lcw0KPiA+ID4gICAgLSByZXNldHMNCj4gPiA+ICAgIC0gcG93ZXItZG9tYWlucw0KPiA+ID4g
LSAgLSBwb3J0cw0KPiA+ID4gICAgLSByZW5lc2FzLHZzcHMNCj4gPiA+DQo+ID4gPiAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gPg0KPiA+ID4gK2FsbE9mOg0KPiA+ID4gKyAgLSBp
ZjoNCj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToN
Cj4gPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gPiArICAgICAgICAgICAgY29uc3Q6IHJl
bmVzYXMscjlhMDdnMDQzdS1kdQ0KPiA+ID4gKyAgICB0aGVuOg0KPiA+ID4gKyAgICAgIHByb3Bl
cnRpZXM6DQo+ID4gPiArICAgICAgICBwb3J0Og0KPiA+ID4gKyAgICAgICAgICBkZXNjcmlwdGlv
bjogRFBJDQo+ID4NCj4gPiBUaGlzIGlzIGVxdWl2YWxlbnQgdG8gJ3BvcnRAMCcuIElNTywgdGhp
cyBjYXNlIHNob3VsZCBoYXZlIGEgJ3BvcnRAMScNCj4gPiBub2RlIHNvIHRoYXQgRFBJIGludGVy
ZmFjZSBpcyAqYWx3YXlzKiB0aGUgc2FtZSBwb3J0Lg0KPiANCj4gVGhhdCdzIHdoYXQgQmlqdSBk
aWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIGFuZCBJIHJlY29tbWVuZGVkIHRvIG51bWJlciB0
aGUgcG9ydHMgYmFzZWQgb24gaGFyZHdhcmUNCj4gaW5kaWNlcywgbm90IHR5cGVzLiBNYXBwaW5n
IHBvcnQgbnVtYmVycyB0byB0aGUgaGFyZHdhcmUgZG9jdW1lbnRhdGlvbiBtYWtlcyBpdCBtb3Jl
IGNvbnNpc3RlbnQgZm9yIERUDQo+IHdyaXRlcnMsIG1ha2VzIHRoZSBsb2dpYyBzaW1wbGVyIHRv
IHVuZGVyc3RhbmQgKGluIG15IG9waW5pb24sIGJhc2VkIG9uIG15IGV4cGVyaWVuY2Ugd2l0aCB0
aGUgUi1DYXINCj4gRFUpIG9uIHRoZSBkcml2ZXIgc2lkZSwgYnV0IG1vc3QgaW1wb3J0YW50bHks
IHR5cGUtYmFzZWQgbnVtYmVyaW5nIHdvdWxkbid0IHNjYWxlIGFzIFNvQ3MgY291bGQgaGF2ZQ0K
PiBtdWx0aXBsZSBwb3J0cyBvZiB0aGUgc2FtZSB0eXBlICh3ZSd2ZSBzZWVuIHRoYXQgaGFwcGVu
aW5nIHdpdGggUi1DYXIpLg0KDQpPSywgSSB3aWxsIHNlbmQgYmluZGluZ3MgYmFzZWQgb24gaGFy
ZHdhcmUgaW5kaWNlcy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gKw0KPiA+ID4gKyAg
ICAgIHJlcXVpcmVkOg0KPiA+ID4gKyAgICAgICAgLSBwb3J0DQo+ID4gPiArICAgIGVsc2U6DQo+
ID4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiA+ICsgICAgICAgIHBvcnRzOg0KPiA+ID4gKyAg
ICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAgICAgICAgICAgIHBvcnRAMDoNCj4gPiA+ICsg
ICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBEU0kNCj4gPiA+ICsgICAgICAgICAgICBwb3J0QDE6
DQo+ID4gPiArICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFBJDQo+ID4gPiArDQo+ID4gPiAr
ICAgICAgICAgIHJlcXVpcmVkOg0KPiA+ID4gKyAgICAgICAgICAgIC0gcG9ydEAwDQo+ID4gPiAr
ICAgICAgICAgICAgLSBwb3J0QDENCj4gPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiA+ICsgICAg
ICAgIC0gcG9ydHMNCj4gPiA+ICsNCj4gPiA+ICBleGFtcGxlczoNCj4gPiA+ICAgICMgUlovRzJM
IERVDQo+ID4gPiAgICAtIHwNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBp
bmNoYXJ0DQo=
