Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA9C414C2
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770E010E076;
	Fri,  7 Nov 2025 18:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="bN94bPUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706A710E076
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wudqs+MePM4sIZJn47zKQt44CQXAXoE8k7U6ivfPRflBX4FVLY/QWIYWQe5YEMRrRFad3wV9wjoXX2fGDM9GZQAMu7uaIZcCtwwa66DvmE3EloQ3meSo7XxRw1WARh7AmOlV1yqzl4vavYjaCd0y0IufWgcsio/OFkztSa7VtC4dwK7GOusVpJSZ7fQO0yYOF366r7ebbtJ3LO4GK8YJfDWzFkGVFRPEE5INLq0WBN0KdIZPoyyYgjCr5sPUkkdBkpPHTgv7yadbQWXnqnSJ9B0mJeN66P6/IdaTPLACA30Dcv5PieqiYJzPg8K3FPKcqXno8U4k/lScIVpiKryBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Orjbl6mg1SauwWtFKxjBhDErvaWz6wN8d7K0Rq6eS4=;
 b=arhobDIwq43/BwZtWvJ76Fp55U3EZ5i1H9H3ONGJPWSzbE+oGbqmMGu7b37R/PwGM2pUX99TYGYLBhrqy1HApIjBu0V89zMkSw21B7hX+ZjT6aIW6vDXChWJr9TfCb1eyABUNjyZR5atanxVe5pgCdamVUeeEx89j+QSlqBa68MsmuXKVwKYfIcim46kJuaZ73s1Sf6dzfH3UpL6ewzv2m98zr9ZknPoGHUCafbqEPKH7p/9uvA0y0KkzY9uU/kHxg8Unc/sIyFVkLCbBiJ4qW8rshaHSMU4HNRAnoZDgRsOBPJQM43fX8SXbikp3AEUQR9qZUdGIinDLnHK3UCZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Orjbl6mg1SauwWtFKxjBhDErvaWz6wN8d7K0Rq6eS4=;
 b=bN94bPUyQGyJd+LJvKogBrn439PCIephVe74LH7EZ2Oa1hB3AWiEtacBsTd+ecJRLhtwWoeGJNw+2nreTlNZLVcSZfylkhQqAkd0xuiePMNV6rRqpulQBhnmKGoBJ4cHclqiCBsYSDzqEDndxIzSGr9AZbSG6yi++yQGMmJQP8A=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYVPR01MB10797.jpnprd01.prod.outlook.com (2603:1096:400:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:36:25 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 18:36:25 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcTqM02+OCahzeqkGZBdprKCVrd7TnaoQAgAAejkA=
Date: Fri, 7 Nov 2025 18:36:24 +0000
Message-ID: <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
In-Reply-To: <20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYVPR01MB10797:EE_
x-ms-office365-filtering-correlation-id: 21108085-a75b-4e20-dfff-08de1e2c8e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6I1s69n1xt4RJevxVZQdkcf+LWs4HFtRlaCr8HDR5UDkVnFHJs90ZOup7iMD?=
 =?us-ascii?Q?un8QAJ6lWxbP4++asa0Dst7SjLb0u2RsQQjVXMNvOj3Rocn7lBJp7DszCX9F?=
 =?us-ascii?Q?fWsWs/M6lvciL22I5XwVEEwqzhEzSUjib+Ln89/+g2ZCTCIXeqDY51ouOyu0?=
 =?us-ascii?Q?C7pmkdFpwpzqr1YLqtKKbATLf0YabiJznSznVg/UKEn0rcG9yRQQddIALFpt?=
 =?us-ascii?Q?GaeQ5ucTvKFaDFxTMNUoTNdZ0ZZBBFdLCyYytclegmWlI+m/tvPQf+DUuvoj?=
 =?us-ascii?Q?Hegm51wUHY8ayd02FKsQVrvxtETM5QJ8zJvDNMIiZLcDiZZueEbz5XniAIEg?=
 =?us-ascii?Q?pr4AtUKxiJ7ib2wsX8GbMx5sk5+SwLO1eiaM2BcJmNYJMx2x0yzOmScoJW0K?=
 =?us-ascii?Q?w0r+pPOYPOCBFM3hRRLlTnvGXlS8MaxzYPctzhDkbXwMT0dzrBomk8mhfcNJ?=
 =?us-ascii?Q?6g4ZTsIPGTgPyx8hd/W1ZzXhoiQ+cGmn6PPg83BQyl5s5WPJ8ztBIRY+60dN?=
 =?us-ascii?Q?4FEq8r2v9osWAqAdQNeC1bIsWz8O+Q8cx3xt8CuquXmBLLU/FX3aJeKKqbrw?=
 =?us-ascii?Q?I376FJpMdVHSpdiObtf31mCbK9cCDlkeVgB+13xKTjpxnTErPL40K8+6ITvy?=
 =?us-ascii?Q?PFQSjyYezjFJ2Os47lmOjqDTPvFdQN3YjQjhyh4Xw3pvxTTx7d1Lx0e4TrUC?=
 =?us-ascii?Q?SjDMUU7IagBXzCkyBvUrp5Dj38wuulSW03/N2OblRvE1s+FY/Sweq+NllBEA?=
 =?us-ascii?Q?X5k9C+SPJZ/hThuDQ93U41eTIwO86CKTG32BAgJ4tgIIvreFb2331+ZjLWLI?=
 =?us-ascii?Q?yCdhWvWGDYCWFiR+sY8fK5311RIjnq/L0Zz19WkrifFUY1cyC+2PRzNK/YWj?=
 =?us-ascii?Q?ikEEH2TlVlJGGc6BghFblmi+JGxIH800VDEhtJ23Gi/71COyqT8ocpiIkZim?=
 =?us-ascii?Q?UMS7TW+GgWoiIQmf6u3l/GgxXlwcSHBfzOZpJeS+OSaaVhr8iiU6ZWDvHK1q?=
 =?us-ascii?Q?rAHYf3B/7w5lqOdg615zdbVPY19Ovm1IflktJRuP1AP1LgRCYVlkTu908AID?=
 =?us-ascii?Q?3sscHo2p01F7EmKmQrPhHz/x2FdN6gCggPvIo9wXsyjTT2qploQcDmuNMQ2J?=
 =?us-ascii?Q?crBIpH22YA51LvqKNbs+3GwbuEHTatx5keR8Eaz7JPwn8Te5TxzwLw6z7Ves?=
 =?us-ascii?Q?wRDNxb5JNt31bNPtUSZKtBfNSfUKM7IlPHTUl1RXiMsXLXm7DLlRw0Aedidm?=
 =?us-ascii?Q?PTTjSOs8hreP+vlQG8TcnIASzdYHITGtsKDctf6BLlaQxhWUroid3kVKAjkA?=
 =?us-ascii?Q?5CMtxLau30XFQfW+bBvwIASNAivCRSjKN5QxETGqkUcINi+WQkZEXEOv2ULk?=
 =?us-ascii?Q?XCj5w8/kU+J0Ias9Z24GV+Xjv8N0ckOw+WzgqidIzUpE75bIT2BQbKemLdv4?=
 =?us-ascii?Q?MKM/1ngdsECM6Xlz1bSItUuZzy88BpCq8Vg/EqK1uetaPxnNN7mpdf8hdoVm?=
 =?us-ascii?Q?ZJbMVehni+Hupjq1AAda2VFZYwubvS83mBvf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FKlGfEhWd6l+JlEZMpyjvFbVkqWzCN/Da8dQw5/65wP41gHwFL5/bKApxDs/?=
 =?us-ascii?Q?e3dmN5WedZ0pqZjSnpglb27R7T9jHg/EkL8mT4TmdOE24o57jfVoJK7B0tp3?=
 =?us-ascii?Q?H4T4Yrd2V2RAVxSsoNZXeUFE0XiHpSOqE45digFb3BrdSubUQXxWdrfZITSI?=
 =?us-ascii?Q?/DftAwwfR9wirpTXilWK0LbMyM3AZxofc5yGx4GflO3Mm28B65+RUIsyOui8?=
 =?us-ascii?Q?L7nHIzz59xGPhb5ZoUzu43n5AeKfMJlVp/j+rXagCt+CQnSo7jLWFWcTimCi?=
 =?us-ascii?Q?yAPLRcONMsLqghMMEFgqJnS/sWAtLHCqO+UhXVI54qHSbUEZz5rtAmpkZxg/?=
 =?us-ascii?Q?xP71vKR3IwiHDn5aN/p8AletnRs8WFDZEz8Gu0vgwvESlOOz9ppyRxiNXxv2?=
 =?us-ascii?Q?ivRhUkLu5yquggdkmByZUkuR90jlNO4kGeNGKdVmS2U4atiGC46NBz0VDf1+?=
 =?us-ascii?Q?NFWJWtD9R5JTJcfUApHQxVig2dawYt2FzbHGfQK0vepecic/5VP9LMHfLVk2?=
 =?us-ascii?Q?9SO30r+I8ZvOLOzLI748O3+F0ZsSvu+76sLn+4QG7UJRTGMLFkGbLzeXZYmV?=
 =?us-ascii?Q?UmeeivCVS/CFgh2L2GeAtraGzH6UGDYYUxJ8SCIzfwh25dVEzr6tZAYWSMVl?=
 =?us-ascii?Q?NmTULPlQ+UaR3vdm89qRyyNmY9JYons2Wn9HvLmLfSwz3fontCfYMYkgE/bG?=
 =?us-ascii?Q?sSOyDS0cv3aTjmduqg/vdbWMVPLQ+g/FlGQQAv4Ck1MV3nQ+c95Jte70sibw?=
 =?us-ascii?Q?6q+XHUfUR7nDjQ5bXxT/xTlB6qVqy+rr57vA2EPXc6e05rMeCB9Rkq5mjse1?=
 =?us-ascii?Q?687SyRaW3ZlB+bPHoPUtZ6Pk3xNWyHVxuHJGoxyX0PaD6OXfsiIoyy883AcM?=
 =?us-ascii?Q?rLfS2d8i2MWfNwoo0ny7OCGeEJdyvcxiJWwbEcN5vAQs1ccd2anMOO0DRHLN?=
 =?us-ascii?Q?p3AyELqpKEFJPnyaPxYT0ut0enlcAb1EDp2eipc0nLwgfjwK7jomZFkhgigW?=
 =?us-ascii?Q?e68i+4TbgC/JN7GlUtGqR+hTejkVeiAxZElq1KCOKOpWTkz6PxZz6dJj0ePN?=
 =?us-ascii?Q?v6xMfEuJFfK1uI5oNeL/9z/4fm6a4DE4NDnnbwefeUufRzcqtH8PuTYxtjjz?=
 =?us-ascii?Q?bQ3xTkbtV+DgiSx32Cif4m1utTZbNJOsXCp3lpx3sp43BUYjck3OVBskrCKz?=
 =?us-ascii?Q?/By96qiUWr7Ker9eUnmdTWHxxC3IYJJVxvIRuzaTguoqLhWptKU/xn6m3Cxh?=
 =?us-ascii?Q?l1SG0Z/5lQmt00pP4o8Vnp9uXqO0+bjn+lcG4VjUjlf/rjHEH7yp+AvJnqHz?=
 =?us-ascii?Q?LtGCCFCgbc1bsvKRrOWrgtyK35VjMDuA29jNi1ii4YIVXR0EpYZGEsj4KIBa?=
 =?us-ascii?Q?32+EujdHf31vbu6h7Pw4Lw6iRFpPkuFKzDB5KDT/Cbx/z5lSn2HtE9T1IbKk?=
 =?us-ascii?Q?kDu2PZ7dE6pyFUIDAFI0/wx9721imhpSPfe1D3eV+rypw42YhzhFxWp5SLxa?=
 =?us-ascii?Q?bIFr26dyTVn+TOI0qM1eIXFj+QskFJL0hCJhwQyzttnsaqF3yJcVJ9r+qRIq?=
 =?us-ascii?Q?yp6qIoQcStHYIzOcM4+Yapzaav7E5DcwKE6piuAY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21108085-a75b-4e20-dfff-08de1e2c8e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 18:36:24.9343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSFylHwYMAd1Jmi2K1kZJZDzpAYlWOQnN2ppt/w/pGJDo7ddcEO9bWQxH0LSx1rQ7cmb6H/YDrhxgEeauRl03iA2Sac0AfR3VOEN7/zMmqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10797
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

Thank you for your review.

On Fri, Nov 7, 2025 11:31 AM, Hugo Villeneuve wrote:
> > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > +				    params->pl5_intin > PLL5_INTIN_MAX)
>
> Your patch comments indicate that you removed +1 and -1 for kernel test r=
obot issue, but I do not understand why.
>
> pl5_intin is still defined as u8 (max 255), and therefore the result of "=
params->pl5_intin > PLL5_INTIN_MAX" will always be false because PLL5_INTIN=
_MAX is 320.
>
> It seems to me that pl5_intin type should be modified to account for its =
maximum value (u16?), and this should probably goes into a separate patch (=
with a Fixed: tag), that can be backported (if necessary).

You are totally right!
INTIN is a 12-bit register value.
It's a bug.

Good catch.

I'll make that a separate patch so I can CC stable.

Chris

