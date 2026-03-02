Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEEGODl3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:40:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2F1D7A17
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316FB10E492;
	Mon,  2 Mar 2026 11:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XwZ9BaKy";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="a8ietcSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C7210E494
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 11:40:36 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227A2Cg2877823; Mon, 2 Mar 2026 11:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=5FxE1ALe+hP+ruy+bWxpWIs3yAk60auCXx+zBnOMAhw=; b=XwZ
 9BaKyuYM0S6ZU7C+UZEdr1aVKxHCit44vevlSMd+kg+spPn286ggWjzf5Z4wHK5F
 yVzTGq8A65lKZr15LVqk6dv1Kda6+kfHShTq6+VM1LZ1aGtZUdpERcn5lj27ApRs
 7FU/LNepFjetipvdQWmf1bTiSiBYSlGscQ0r9JI4j3gZ673UJUltn6Hh7oKFvo0w
 xjK6dvzFssRk4a4oOboklV4mha6McaIROI67kz2O8SoNKu4hSvIJX1ZfPjhb+Cx4
 NXCtRuIAB8+EudqV6npjuHMTgeI5i9OLU/vk7rKP50tLZDgeLQCCX9yC4i+TNsbF
 +xHr+HV/LvY6Qy2r3Pg==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cksau9mcb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2026 11:40:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0YJ+TMP+1H8s6iLCC2b561CSnHoE9M5O84akPO7szSSgjAbFyw3eL/VpPiVE1SACVhd95MWBV2ceYjVBPbm8z96pPOoHV9fwRtCcizP/tUnlhqK/fVLQIS2fWrwxUV5Y1xkOtf3Ef4nE/THNtN+TBL5cwGrErT4e10yZdcwnibpsqs3t7Bkc0CpopbD3Ag66I7V5c+wIIJIvTkh8ZxzTJ7c12pHKM5SwVq1/AEpNH3tBfNjTMUGMIJ5nUq7JpkLFISrnbqI01nNY3U5ULlJbI8d3EwslFtI4I76hlgq1huAWbXjbQpYubgSNOevXlEKf9CAQXbnkaK7gPRkqRn6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FxE1ALe+hP+ruy+bWxpWIs3yAk60auCXx+zBnOMAhw=;
 b=GTz2YYm058oSeBIH8vcJaaMn1JQtPo7XXRo7oCciNF6Og9qekLNsR46frN+9T4FkD1FAz7NaUkO8ClBNE6QiAoNZgjDj92JFl55unOok11i8MNI/MOwWce9vi9IN4Vw6InJMbBFaIpnb1vfg16h9ME0BtKs0BJ7JUCBpuDuLMiQw/joqf1kLRUUW4F1KZH9BQeBQRSIMPGLE3NjfESNhNCfzrRSuKql2Pe4LJnb+hURBGiwBQE2vVQjji8IjwuXeqzAhZnf0QT2bf7MRzMTSUg6nk4yAInOrdadHmlnZ4E8etGOtmKpvpkNiLgPOjtT/nlPcSMEG1VZ+EywRAdrUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FxE1ALe+hP+ruy+bWxpWIs3yAk60auCXx+zBnOMAhw=;
 b=a8ietcSD4QUABTU/aMhqHphRBlu2IAifA5cG4bi/+dMvFmQhj5nQheNWxCkFMoRAHXTK9MBINGUiBRbUP9xxqse8ZayEW0JJNAWsi1V5lK/ygjebbYf2O+5vgLIkYo2jtKnW7fVVoKVsk1LyPlA8JLPo9mPox5AVrPwEZMGit4E=
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:449::15)
 by LO0P302MB0018.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:369::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 11:40:14 +0000
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e]) by LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 11:40:14 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "broonie@kernel.org" <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>
Subject: Re: [PATCH 0/3] drm/imagination: Fixes for power domain handling on
 single-domain devices
Thread-Topic: [PATCH 0/3] drm/imagination: Fixes for power domain handling on
 single-domain devices
Thread-Index: AQHcp/MtiADxGtv8R0q9dQgkujd6D7WbIsIA
Date: Mon, 2 Mar 2026 11:40:13 +0000
Message-ID: <748ddaf1d27f9735e0937a23d684203279041420.camel@imgtec.com>
References: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
In-Reply-To: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO7P302MB2107:EE_|LO0P302MB0018:EE_
x-ms-office365-filtering-correlation-id: 04f7fed2-2490-46eb-d967-08de78507800
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: J1nOYRVnhpNp5ButRylrGDWmmtW7krDQpz9nP+lS2lFZxEfQpX3UpjkvRCGW/5ZG7d4/aum5vBL/fXJRVdpUzQcPxz+FtEOd2YHGTylL65liBOPO7OAEu0OwcmTfrBo7U9CF4I3aHLlidI0zT2dSCcC2wFYZyRBad8WCu7WONTUj5t/3uvN0a/X8Y9N7n3JdPZ6sa9ZdhKgYMWEHF6vazWqrPv81Vg639vGK8LrrFhcWR4A8daaoFClISHHt5nFSqQeTorKKWvBroHadJRCeLcgVfiXfvd/6NutFtHMI1E9LSWWqVClJC17dW+w/J9+os0dtIWrj645Gckq4HqDLta7ELeTui5eMTJfQ9Yy3bNFLdoIqm6uid6GbVA8fMeB+qniZ9nS7m8teehmZF4VneCAaGZSRoJ7btMDKBlmfZlAM+4eHlUOzQnCi9HYqSbpJs3/Tn0//fawPrxgbpIsvwYBlYPBp1f3lMYjwBx9480ZxGtrqeiPmAQhvp2TqyyUmVX34TectGNRiJ/k2xTBwW5+RDo2U5dQXE9CWW29RY9Rr14K3tzsg753RKPUeYCLl7n+0k+hYy4gIRZt4QcGlFInrrqcD1gtv7UaxiIUt8qhSW2igkDTh9lt/xgFLrX4ZRxWiPrLBbHJqMdwkz8d9iLXWL0qm5Ik9iUleUekbdZJohjaDdaySUyD3TxEIBmxbucmKfkzMx6z3PhSyROV+nWV55zJdk2YgwHczy13UXo5rdd0tWBuTP+uy4M/GmpniMtJETrQbCC60R7/7Irawqff3mK03+TTKg+rQxutW5Ro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVFIWXFGMHhRTjM1VGpleUVXMzBCUkpBYWxyOWllcm9XRkNWWWZ6VE5va09w?=
 =?utf-8?B?OGJHeFBpMi9IK3pGRVdBU2Jod3loOFV3bjd0VUIyUzF3WjRoZHhNZ1N4V3RV?=
 =?utf-8?B?Z0kvS1U1c1llalpQZEQ2NkU3V2dscm50KzBiTVI4TzQ1T3FXS0xYOHdrTjR1?=
 =?utf-8?B?TGJoZTJJeFhVb0hIYk5xejczUTNQbVh1ZTIzdlhKSkJBSnMwdlhIU0FHa1ls?=
 =?utf-8?B?dUFhZWpTR1kzNHplK3dkZjRtT0RsRGlQeWNhZDRHa3A2RndXcTFuMlE4ci96?=
 =?utf-8?B?TkkwRXFyemVoSFRpSU1OWFVDVitEWW1aYnJBNWdBckg4djA4dkpJM2ZUWHJl?=
 =?utf-8?B?QSticng5SGZiQW1ZRVdsY1U5Tk0wWlF6VXhBaCtoaUpoQW9pUHdPMStFbWt6?=
 =?utf-8?B?R3owY0VRbjB2QWVqT1lQY2JhWFVuM2o4M3FhK2JOV1pLb2FuZ1QvUlZjVEY4?=
 =?utf-8?B?QVBkdUpsRmxFbFRRbSs3RkM1dENBMktYOVRQaDZGTFBGSjBYdi9ZY3ppbTgr?=
 =?utf-8?B?aHZsYmFhZURSK0x6ZFBReUNwTml6RVo0K0h4MExwbHc1NS9zTkhDMklqWFZZ?=
 =?utf-8?B?MnR0anc2UlZzVWlvMFRPWVMwZmlXMkR6Nm5jZ2RDZk5TZUhqc29XVi9ZeDZ3?=
 =?utf-8?B?Y2NUMDFwK3ZGVmR5N1ZNd1N0eFpNNGZtUE1WSXNwQWtadnZBbi9SbVErLzJY?=
 =?utf-8?B?UlloQnloMXZlc0RDNGQ0RXBYck5icVhERFBMeEZNWUZEYkhUZGNCN2dXbFlm?=
 =?utf-8?B?NkFlVjZQUE9JWkxlMmY5eW5XSDJURXZ4NXUwNUZLZkRlTlhzZE5ydnZZR0pV?=
 =?utf-8?B?eVowb1pSQ0kxOE1NZFZ2ZGpBZHk3dFY3dGR0cGM4WncxaGJZWXZCSnMyeWFY?=
 =?utf-8?B?V1doZUludGt0aEN1OFQxVHZkQUdCSkRZZkdIV0lBMzR1MjBrbWlFMVNVaU5G?=
 =?utf-8?B?blBMaW5PR1plR015TDFoRDVMMGZvRmQwRkxPR2RobHF5blR1ZGd6SjlkYkhC?=
 =?utf-8?B?QlVGUWkrOHVRUlNhVThvc0w5NmtLSDE5N0RyanEvMjNSYU5SeUFyc0JVYmRC?=
 =?utf-8?B?dnd6ZkMrTGJ2UlJZaEdYb1RYTEJoYzlvZS9CV0NPT0xnSUdaZm80ZUVCbk5J?=
 =?utf-8?B?MDlDNjMwMWtQaXlWY3dGOG8zeGFBUmhsK2pYZlBUcmh3M0NBTVBEalZ2eVhE?=
 =?utf-8?B?WGNQdTRqZ25qN0NzVlViN0JKYjJ6cTluQUJseGgvdlZhamtjUm9qSnFycVdJ?=
 =?utf-8?B?cU1JOTlLcnZCRDM4aDBWcFpVNEpYMlFvRjdDcnRVaVhHVjlQOGtQUm02OFpo?=
 =?utf-8?B?QS9vSWRlVjJ4eFNITjQ2MzJQSGovYUs0UEE0ZWZZQUUwOEhrSXdHcmZnTkdU?=
 =?utf-8?B?dndGZVdjQm9mRjJpbzc1TC9xaGxNNXhIKzJjTWpjaU1sMWNRYk9wdkI1eW5X?=
 =?utf-8?B?dVY1THVMYlNYV0JlREZleVVGS3o0eVVteFJqb2xkWXVGWFp5Z1ArekpsTVVk?=
 =?utf-8?B?elFEelhDcDZnS09PdWhOeElzMVVOaTQzcCtOTmV6b2J0TU9xMkdsOWsyRGRz?=
 =?utf-8?B?UEFEblRET1k2R1JkU1B3TDd2b2dVUWl4Q3ovdFZxUkpjQ1d5cC9jNmppYm9j?=
 =?utf-8?B?VFpTMmRRRmU5ZlloRkIzbmV1cGJuYlZUdE00ZEc2SGFJaVJ1bWhDUy9nOTdY?=
 =?utf-8?B?cjJCaGlTOSszUTlvdTYwL3BFVElieHc2SWFJdXRaMjZuR1lLbDFybkI1eEZD?=
 =?utf-8?B?WEhuYzRCVGRpNG5HU29xazhSMzNEdjNkc1FTeTAvb1dHM3BhR2g2VW95aEdJ?=
 =?utf-8?B?dmMxQ2tHR0FnV1JnWWRCR2RsajE2cTYzSUp2YldVMnJQYmpicVdZOEhsR2xj?=
 =?utf-8?B?Y1IzYWV0YzMwSUpPV3BQV3lVdG5GVVZuYTJjRThxL25KbVdFeFkzMFB2V3ZO?=
 =?utf-8?B?c3FpTHBza29yTmg0bzYveEdPcXg0eXlvQVNKKzVVOXVpSW96Z3hTUC9YZGhv?=
 =?utf-8?B?OGJPbEo0Uk5odjlGdXRUWC9LYnZaTlRTYVpueFpJNTFxTjQrNmdlNDIvbVJr?=
 =?utf-8?B?RWNHUXZFWmQyeTBNK2pOcnJXcjZ2TVVBbmQ5UHJlaWVqaVBkTTVFK3FUUW9p?=
 =?utf-8?B?alBibDVpai9iU3B4aWg1dkttTC9WZUo5R1RLYTBIVVp3bUxvNmx3VThMelpP?=
 =?utf-8?B?RmdRaFJLSFpaYk03RTlrbHh2R3k2RE8vcjBLMkdSaVdLZUZCTC9nMW1nVDQ2?=
 =?utf-8?B?dWZISEk3V3ppMTdsZEZaaHJYYjY1dE9XbDNWS1VkZUZPejhPOCtNNFNRN3l3?=
 =?utf-8?B?ZnhqN0dvNTRGSkg0eW4zTWk1ZkR2cm5mZHNpOUlyT3hUbXVwWVFPYzUxM0ov?=
 =?utf-8?Q?cj16r2JLH7C+G4XI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBBADACDFFBE7045BB8E63490E0D958C@GBRP302.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f7fed2-2490-46eb-d967-08de78507800
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 11:40:13.9040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ia5WoPK6jjrfO0GBmaRpbhItwPSuxD0qhlU9s/423sx6YyTGUcU9CMvr3PvxGV241tVZRDKY1yQI69Gig75JcZZPneF5CVDcQ11bbQDsLdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P302MB0018
X-Authority-Analysis: v=2.4 cv=J7KnLQnS c=1 sm=1 tr=0 ts=69a57721 cx=c_pps
 a=QcZtSyD3xzNBMCTTI1tAdg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=3Rt2ToWW1D_sNKFwi8cA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: gj4XuldDE_Ns3SmSuIQLQ9TKaCBP-mT4
X-Proofpoint-ORIG-GUID: gj4XuldDE_Ns3SmSuIQLQ9TKaCBP-mT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5NyBTYWx0ZWRfX4Ha67jDhx3Ng
 /s0yBDh54iL/EPQLbKVmK8Yqdd/9QqUHiIvoFUrz2o9O7oyEfnmkKmAezOILfeaHJqXqbkP1d22
 HhilQnleoTeM9MS58gtAXSJ2XkSgzIPp6eYrd1VBkt1v+6VPOUL6e9jcJ6SzVP7X7lhvIkrCoGx
 PaK5OJRMGhU1bK9pcHs10Dg5LF0g+9lyW2XWPPYKs23xTKDNLwRjTizEv0qEu7pLS0eHmvxL79y
 CpjGFT5j5lHD8yGYHxMyFbIpfQHraLb6vitwbFldFhFP2u1Y1cdqw8+8oUONqTwHdLCJsOu/Mm/
 6w8DgPBh/yvVzTCjiQlf9ALAq4qiUwAWE34aGFZDjiuqDAGFXMHq3m2cemCmF7C26uh0EaEZKw8
 1y/GKrveirNX98KNQZ8/V/wa/7EQLYXrEbFQgGbyOATKgbBO9ohGUO3UPL44VQFHv0Tw1EoP1RT
 Gkoqt4RICXFdDm0yTpw==
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[suse.de,ffwll.ch,kernel.org,lists.freedesktop.org,linux-m68k.org,gmail.com,imgtec.com,linux.intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Alessio.Belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:broonie@kernel.org,m:geert@linux-m68k.org,m:airlied@gmail.com,m:Frank.Binns@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:Brajesh.Gupta@imgtec.com,m:mripard@kernel.org,m:linux-kernel@vger.kernel.org,m:Alexandru.Dadu@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Alessio.Belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[IMGTecCRM.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 17C2F1D7A17
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE0OjEyICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
VGhlIGZpcnN0IHBhdGNoIGhlcmUgZml4ZXMgdGhlIGV4YWN0IGlzc3VlIHJlcG9ydGVkIGJ5IE1h
cmsgaW4gdGhlDQo+IGxpbmtlZCBpc3N1ZS4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFyZSByZWxh
dGVkIGZvb3QtZ3VuLWxpa2UgaXNzdWVzDQo+IHRoYXQgd2VyZSBkaXNjb3ZlcmVkIGluIHRoZSBw
cm9jZXNzLg0KPiANCj4gQWx0aG91Z2ggZW50aXJlbHkgZml4ZXMsIHRoaXMgc2VyaWVzIGlzIHRh
cmdldHRpbmcgZHJtLW1pc2MtbmV4dCBzaW5jZQ0KPiB0aGUgdW5kZXJseWluZyBjb21taXQgZTE5
Y2M1YWIzNDdlICgiZHJtL2ltYWdpbmF0aW9uOiBVc2UNCj4gZGV2X3BtX2RvbWFpbl9hdHRhY2hf
bGlzdCgpIikgZG9lcyBub3QgeWV0IGV4aXN0IGluIGFueSBvdGhlciB0cmVlcyAodG8NCj4gdGhl
IGJlc3Qgb2YgbXkga25vd2xlZGdlKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgQ29zdGVy
IDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPg0KPiAtLS0NCj4gTWF0dCBDb3N0ZXIgKDMpOg0KPiAg
ICAgICBkcm0vaW1hZ2luYXRpb246IENoZWNrIGZvciBOVUxMIHN0cnVjdCBkZXZfcG1fZG9tYWlu
X2xpc3QNCj4gICAgICAgZHJtL2ltYWdpbmF0aW9uOiBEZXRhY2ggcG0gZG9tYWlucyBpZiBsaW5r
aW5nIGZhaWxzDQo+ICAgICAgIGRybS9pbWFnaW5hdGlvbjogRW5zdXJlIHN0cnVjdCBwdnJfZGV2
aWNlLT5wb3dlciBpcyBpbml0aWFsaXplZA0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfcG93ZXIuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiAt
LS0NCj4gYmFzZS1jb21taXQ6IDVlYTViNmZmMGQ2M2FlZjFkYzNmYjI1NDQ1YWNlYTE4M2Y2MWE5
MzQNCj4gY2hhbmdlLWlkOiAyMDI2MDIyNy1zaW5nbGUtZG9tYWluLXBvd2VyLWZpeGVzLWQyNzJk
NTM1ODlhOQ0KPiANCg0KRm9yIHRoZSB3aG9sZSBzZXJpZSwNCg0KUmV2aWV3ZWQtYnk6IEFsZXNz
aW8gQmVsbGUgPGFsZXNzaW8uYmVsbGVAaW1ndGVjLmNvbT4NCg0KVGhhbmtzLA0KQWxlc3Npbw0K
