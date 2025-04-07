Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAEA7EDD9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53BA10E55B;
	Mon,  7 Apr 2025 19:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pr6Jzt1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064810E55B;
 Mon,  7 Apr 2025 19:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Md7brt54liVt1OtZUq2fkMMeANcearj1dl3K7+Gb9bO/jyzWjGNIP0reYIBnr3FiyZWvUg9VGjdS8DOTUgmZ0Z//YAUVfsPKyY4GGAWw+yH3c5FawFnQBWXbahdZaYmNU97hzEIT/CGsEe/77xI5QsWRAitvPDdulJTtvwneP5hxG1f7M+FEyJoi09Xi1W9dH47Y2a6wdL/O0r3rG4g953uhZSw4cS68gIJHOPUoO47IlugKtUaYaN0r//xAw6G2Gk3TQoZqTHHzuTuRo7y5m3tOqE3Q9TO3r+Nw8gVGZk9Jl8eLQ3e9fq8TkfbfyxjRflhdHfREdTOuYm7B4UhFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS9tGXJXI5uIi+CvJyzSyYLr6eYP7wolua1rLkMTT/E=;
 b=ZXsfNUM0QNsOpeMJymkP6DrjJ9fxdklnonjZ5ylyXgBWnh7F8abKZ4bmRgFiOjnny9PV2AR+jR/Z564r3Vwqi2zTaO8WLOX3qRYWcL2vksKOi5wsBgN6RzEUbI1UKMTfB8PpKNC9clXLF1MAQwQVlYXuj1sCxWhuGXObhCfF3ldCHFBDc5zlEPqp3CATE40Wm+4q/acFsQ3mqQsvZFBW6lUhWM/exIkRObg/xex8bJ1Pn0COL/mKS3wMVzvTEhGTB29duNK/OyHJh8oQAVvdoExhpf7mf/JSj4Nwcmak7jzoEx+YHT1KwHtuEnwkp9pd7CLkMFoJiNuMC2ChM/4mWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS9tGXJXI5uIi+CvJyzSyYLr6eYP7wolua1rLkMTT/E=;
 b=pr6Jzt1pMx9XAtmQLGyNlTSUIEl5+awpFaX84O+oiq5mvmTrCIKE6g9HNylTugv1sk1p859ACjAZTjo35tv23JTGuIIZfCPf2tJLi+SwiwZDJOwsm1ZiH+EfAXO2wqs9MwJuTrJ5OaFXoUWfZSzScIxu5JGz1r7EOCYpDfkLbX0CfkDVq0V9p7dBJn5QGUj5hO73hFdmT1YVP3NemRpPx+RQF4wD02m0RnMUtnEnsOS+gA4NzJmilY1I4I5fkpxWOmfh91KP8I0HE4mXm+1anfKjHMvsnypFzJ8hbDA0ZFYmJ1ZmNVIYff0+jc5OlQqxjAaqE6kV6RNpRF8NXob7xQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA5PPFC3F406448.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 19:51:51 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 19:51:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWAgAACUACAAAJUAIAADx4AgAAC2IA=
Date: Mon, 7 Apr 2025 19:51:50 +0000
Message-ID: <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
 <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
 <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
In-Reply-To: <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA5PPFC3F406448:EE_
x-ms-office365-filtering-correlation-id: a5bea0b8-7c4a-4ef4-13d8-08dd760da3b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QVFSRnU3Q21hbUxjNytFSkFaMGYvbzBieGtmS2RCcnkwa3lsb0hsSGhLelFE?=
 =?utf-8?B?UzVwQldZTWpQcTZZTEE3ODh5QzFyMzA1bHVvbkhGckovb01vbUdMVlp6MExH?=
 =?utf-8?B?dDlOR0ExZWxXcHo5bTRES0xXT29YcGVtb2U4VHdqQnQyMHp4REJpeDdTSnBG?=
 =?utf-8?B?TVVIOXUwT25PVFM0UEZEdzhPV0xhK2VLam81M3Q0WUZSUFJwckJEdTFnQmtP?=
 =?utf-8?B?dmsyMEVjbW9uRExRUlduTHJRejhkTFErbTVUeWVBblZ2V2N4UmM1aFpjWm9n?=
 =?utf-8?B?K2Y3R0J2U25ucXBYazNGVWpvZ3UxZHVNMTd6dElIcTdFVXJJMDhJU2ZBUVVR?=
 =?utf-8?B?VjFNdVhVSFY5Q3JvbVBkS0tjaVJZYWJ5WlBOQ2tGdmNkSE9RdC8xYk1LOGNh?=
 =?utf-8?B?Z0hRWHppOFhMZFY4M3FMeTRNVmpGMGNxVTRjVzZsS291UmZkS3R4RGoydjdR?=
 =?utf-8?B?MExsTEg0Y09CQkFnaVZZdVlBUFZBZzYvbEg4bmdpd1V1dkRLamlNbGhtMFpx?=
 =?utf-8?B?M29FM1crNC9ta2hqMUVXbDVFcnhZVGkzVUZ0cm40RWZxZkNUUTNBUjNyd0xT?=
 =?utf-8?B?VGZjSVZvbXRsZHV6dmNFcVM0ZnZqZ2p0UkwvS1p1M0JITTJMZEtLeU5pdmMz?=
 =?utf-8?B?WTQ4aWE4a0VuV3MwdTc5RkVncXpKaUNPUjB4aHdHZDZ3d0Rqc2ROcFN0YXFS?=
 =?utf-8?B?NFk1TSt1cTRaanAwN2F6NnBxRVFWZ2ZrV2NoSlJrR2QvY2ttdmxTUnBKR0dq?=
 =?utf-8?B?bG5qbjYwYmplU1hIS3gwKzNyUVF2T0dLRDdKVDN1YVlkZlkwNEJlVE9XNC9D?=
 =?utf-8?B?RHoxTXdlaXphUHBpQ05ZOG8vVjgxMDE0Y3dQY1pQd2V5STBvdGtWVjh0L3ll?=
 =?utf-8?B?RkZiVFdDaW56WUJ2UTdMMFpzQ1IvZXZ4dHFyUnUvNnJMWVY5dTVjb1JERTNm?=
 =?utf-8?B?bnNOTzgrOGJMSVdFWmJjLytYeDVsZVBpTDF0M3VGbzNTV05idVBBYi9Bakhi?=
 =?utf-8?B?M2pnRVpIRCtta1RNZ0FlUURRWlJuNDhwbGo4TWt3TUJzMnhmQkxoRVVlOWR1?=
 =?utf-8?B?N1hoei8yaGRUNkJDY0ZSQzdEZVMzQWtuUXhiUG5jcUxCRkhtdS82RHNXa2dF?=
 =?utf-8?B?VEsyV2RJUXdZWE5BN0YyNFQzUUlmWktpbGtLd0licE96bjhDMVh2QWUrQjkw?=
 =?utf-8?B?dlVxTGl6OThNZ0pVVHJuVjFvdEVGd3JoVzJGSEh6am9YOU5sODVGdWNQV1Jk?=
 =?utf-8?B?Y3BWRXhkcTNIYk8vSStqeFNiaDM4N2xKUkdDV2Y4NFJrK1l5UnkyRG5MZ1lp?=
 =?utf-8?B?b1hlNHJvTHFTZGJXL011d3YxYXUyME5PckhSS3lTWVFnT0NoZ0xISlRlVEVJ?=
 =?utf-8?B?RXdJZ0dSYmgyazl1bk80UGRwWEp0M0NsYmIzbHNRSnZjSU1lM1luRVRhdDZR?=
 =?utf-8?B?QVplVlFHSCszTzlhcFlsY3NOMFg0SVR1azltZVc0d2hnMDV0VFZwWVhUVlpE?=
 =?utf-8?B?TThGajZycFpDSEVmWjlZSmdpbkRiZ1NiQTlUV2JZeHB6YWN2V3FCU2J0QzBL?=
 =?utf-8?B?VHVLZlpZM0ErOEsveFJpeVliQVh5bWRHcDd4ZmJQS1Q2a1BVeWkyMkY3QnBr?=
 =?utf-8?B?ZjZBNCtYbXZQU1N4SGt6Vm9NT3NCTGpjbllMWkRsZCtIaHJuU0Zsa29QRFFN?=
 =?utf-8?B?SnpmaEErVXVwMjU1UElLNmMwNWJhZk1EaThPZWwzU0g0aUdqMjByRkYvSHYw?=
 =?utf-8?B?byt5OHRWSFBiK2dqYTUvWisraG82L2Z2QXRwVjBaMi8zUHk5RlZVdG9zaUY3?=
 =?utf-8?B?UFNXNGR4ZEFJbWkrWTA2RnRXU2k2MXFFdmVFUXh1ZUZJdEhwY25KQXhTeFlw?=
 =?utf-8?B?eVlOTXZNWkVWMXk2UHFSQVozTzlNRysvR0J6VlgyeVpNM01zZEhTTmhBNkFr?=
 =?utf-8?Q?4AWSYJxxe+tK4hpRfQKct/TKj4nVDazL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEJ5ZWtZSDZ2K0dtOHc3ekxYdlhZL2NIL0M0a2YrRHZFa1JGVzF6UFlIUWdt?=
 =?utf-8?B?NGNoZm4zczhITHRlQ2hpem1DQzVlaTYxcWxWZnB3Q3NKNFdYNmtJVWsvdzdu?=
 =?utf-8?B?dWErRGc0V3k4S0JXRkNRazcweWtCUWZsak5NRWFJTFA0c0U3eWZoMTR1SEc5?=
 =?utf-8?B?ZGNGQ2FZMndMS1VqUWlYTkpxdHRrWHpkYm8ySHVLVHhkZTdGNjlFMWV0T1Nk?=
 =?utf-8?B?QUExVWF5Slg4VUJlaUVxNUIvdzRJNnN4QmVFWkFaaDZpVTdIU0xuczI4V2JX?=
 =?utf-8?B?ZHZiNllTV3BNM1dyODhZeHNOYTN6Rk9FeUVnZjRZSnFYQlRzcnVtcFZDcW9Z?=
 =?utf-8?B?d21HSStpQW5semRHQy9ES2tsTEkrbmZwTGdDZUR0cTlhaGxOTU5Bc0Nlb3Ew?=
 =?utf-8?B?TTBDVWgvc3h6VWNwV3kwcFU1bVBPeGJVcCtXb2IzL3hRK20vM2RLbTl6bFBw?=
 =?utf-8?B?VTJ2UFBhUnBuTWpHYndyUGdUUEhvQjZpRjRkSHZXa2dINzZhek1SQnUwWWVk?=
 =?utf-8?B?TTNCQkdOZUQxZWt1N0VMcWhFOTJQaFRTSHFHcTl5M2Y4eWJkbVBvY3E2cFY4?=
 =?utf-8?B?QjdyakZMa2RobUVYcHduUzFrZmJBSFExLzVsL2Y1Z2NUTm9Ta1BUdXZVZ2FL?=
 =?utf-8?B?ZnlMa3o4dHZoL3lMYzBBbnFGRFBCcGZraW9nMlVBODk3MlZDcitZdFJCQmxh?=
 =?utf-8?B?MnY0ai81Ry8wSnZBeUxmWDgxeU9QdjR2TkpsMlM1YlhlSytxR3dqMFNpWmtU?=
 =?utf-8?B?LzNlMW44akY1M0ZVaFBSallRN1JYZzhGZ3dDbjZsVUtDOEZKTVFRNkJSOVRH?=
 =?utf-8?B?dmwzRFcvRkZ6YS9DTHU0MHpqZC96T0xLRDR0bnFhR2hSQ2JHaEJvV3hJQ09X?=
 =?utf-8?B?dFUvUmhJSW1VZ0pOeDluaDYySmsyV0N4SGFWMDlqMkwrQ3FqblF2TzJuNnlW?=
 =?utf-8?B?aW9CMWlZeDNFYVQ4SHg3OUg5VkZDUWZQclkvWVlpUEVrOVNuZGF3am82eHBt?=
 =?utf-8?B?MGlkSlIyME80UGhJemlxNG5wYWt1L0IyU1BHN0JDeGYrbkRyNUpHUVplQW1J?=
 =?utf-8?B?elg1djIxK1hpVlZFQjdDaVFsd0JQaDF5bHJDNVRnVDNmT3hkWS81VHM3dkEz?=
 =?utf-8?B?QSs2b1pTeFBYaU5TOE9aeEJXQzgzNWUwU0tkalIrRTh3YVFmS0VmTXF5YUJY?=
 =?utf-8?B?akRsOVQwZXBoRjFKaUV5ZC9ZS2VoTUdTd250V0laa3FqK042dGY1N1lBVTQx?=
 =?utf-8?B?UXJvVmJ0NHB5eTZkTHZjN3JuQ21ndDFkOVZ0cE9icVV2a2pGcGU4ZVpGQjc4?=
 =?utf-8?B?aDlVOS9lUEl5UGZOVXdabWtUbTZVWTdjZStBUjE5b1lZaldVYk01cjd1ODJY?=
 =?utf-8?B?aE00eGx0bWlISHFnUmE2bmZLRzNOb1VJUFNnZitEbE0rRHlENDZSOC9aeVIw?=
 =?utf-8?B?YTFCR1FEVzhwb3UycGI1K0Uva01GRnNlWkR0Z0JJVk5oQll3YTFWamVBaUxy?=
 =?utf-8?B?VFNBbThycnkzRVFlekM0aVdYSzlna0pqLzBTZFZNMTVxOEJpdnBZUGFOSk5J?=
 =?utf-8?B?ZEMwY3RMMlpaWlc2OFZKYkVvdE1tZHAwYys2UDNYSFBWUlJhK1JXalptZC9x?=
 =?utf-8?B?V3RCUzY5Y0pLUFNkcEtkRG1XZk1yUDFrY1lVRHpkQ2J0M1Vodk9lMGZlb2FN?=
 =?utf-8?B?WUE2LzcrSFVYKzlMN2NvT213U09iVERnc25oTHpReHd0eVVQSDlNWnhUOUZx?=
 =?utf-8?B?ZTQ1cVNnMzNyL1h0dE1tM3J0MHJ4cWxaY1h4VDFiamp2aURVYW5JUkEyd2kr?=
 =?utf-8?B?Qk9kY2R5RlFnSllFOHlKdSt4alFpWU16RFRsaVdGT1lNRkNMaDBpQkFuTUZy?=
 =?utf-8?B?bmlXTCtlWlRxaWw4MUs5a3hsSFVpSk8zdzUvaS9pZ3ExR1ZGUzdJNWhvaXJl?=
 =?utf-8?B?M2lTODB2Rm1IS3FPM2d3RDVtczF2UnVYd1NaWWo2alFkSkpVMGNhbGpwcGkr?=
 =?utf-8?B?ZFVqWEJxeGZWeXNxc2ExRnhlZWZNa2xTZGx5Ri8xNUdiUFViL2d4cWJob0xo?=
 =?utf-8?B?ZHZsM0VENnNTMldhSE5QMDBqekg5UTh5OVJUTzVpOVJOQTMwUnc3TFdMeURZ?=
 =?utf-8?Q?v0uiSfs4C06X5R98x2E4UqGkF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B40DC625B4C8374D853675DEFF66853C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bea0b8-7c4a-4ef4-13d8-08dd760da3b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 19:51:50.9581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YnLu/oVvS0QjOHM3dmoSonPCRp9vgFC+XCQ5oePY8+Si38eF1AtebAoCxfufnMOSMk+mjB+yhoTiOoUBrxkbdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFC3F406448
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDIwOjQxICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IFllcy4gVGhlIHByb3ByaWV0YXJ5IGRyaXZlciAoNTcwLjEzMy4wNykgZGlkIG1hbmFnZSB0
byBsaWdodCB1cCB0aGUNCj4gZXh0ZXJuYWwgbW9uaXRvciBvdmVyIFVTQi1DL0RQLg0KPiANCj4g
SXQgd2FzIHV0dGVybHkgdW51c2FibGUsIGFzIEkgY291bGRuJ3QgbWFrZSBpdCBkbyAxMDAlIHNj
YWxpbmcgb24gdGhlDQo+IGV4dGVybmFsIHNjcmVlbiBhbmQgMjAwJSBvbiB0aGUgaGlnaC1EUEkg
bGFwdG9wIHNjcmVlbiwgYW5kIG15IGF0dGVtcHRzDQo+IHRvIGRvIHNvIChqdXN0IHVzaW5nIHRo
ZSBHTk9NRSBjb250cm9sIHBhbmVsKSBlbmRlZCB1cCB3aXRoIHdlaXJkDQo+IGVmZmVjdHMgYW5k
IHdyb25nIHNjYWxpbmcgYW5kIHRoZSBtb3VzZSBwb2ludGVyIG5vdCByZWFsbHkgdGFraW5nDQo+
IGVmZmVjdCBpbiB0aGUgcGxhY2UgSSB0aG91Z2h0IGl0IHdhcyBwb2ludGluZy4uLiBidXQgc2V0
dGluZyB0aGF0DQo+IGFzaWRlLCB5ZXMuIFRoZSBkaXNwbGF5ICpkaWQqIGxpZ2h0IHVwLg0KDQpJ
IGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgY2FwYWJpbGl0aWVzIG9mIG91ciBkcml2ZXIgdy5y
LnQuIHNjYWxpbmcsIGJ1dA0Kd2hhdCBoYXBwZW5zIGlmIHlvdSB0cnkgdG8ga2VlcCBldmVyeXRo
aW5nIGF0IDEwMCU/DQoNCkl0J3MgcG9zc2libGUgd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGRvIGlz
IGp1c3Qgbm90IHN1cHBvcnRlZCBieSBHTk9NRSwNCldheWxhbmQsIFhvcmcsIGFuZC9vciBvdXIg
ZHJpdmVyLiAgDQoNCj4gPiBJZiB0aGUgcHJvcHJpZXRhcnkgZHJpdmVyIHdvcmtzIGp1c3QgZmlu
ZSwgdGhlbiB3ZSBrbm93IHRoYXQgaXQncyBhDQo+ID4gYnVnL2xpbWl0YXRpb24gaW4gaG93IE5v
dXZlYXUgdGFsa3MgdG8gR1NQLVJNLsKgIE9uZSBvZiB0aGUgTm91dmVhdSBkZXZzDQo+ID4gY2Fu
DQo+ID4gaGVscCB3aXRoIHRoYXQuDQo+IA0KPiBJcyB0aGUgZmlyc3Qgc3RlcCB0aGVyZSB0byB0
cnkgYmV0YSB0ZXN0aW5nIHRoZSByNTcwIHVwZGF0ZT8NCg0KU28gaGVyZSdzIHRoZSBwcm9ibGVt
LiAgSWYgdGhlIHByb3ByaWV0YXJ5IGRyaXZlciBkb2Vzbid0IHdvcmssIHRoZW4gdGhlcmUncw0K
bm8gaG9wZSBmb3IgTm91dmVhdSB3b3JraW5nLiDCoFRoYXQncyBiZWNhdXNlIHRoZSBHU1AtUk0g
ZmlybXdhcmUgdGhhdA0KTm91dmVhdSBkZXBlbmRzIG9uICppcyogdGhlIE52aWRpYSBwcm9wcmll
dGFyeSBkcml2ZXIuDQoNCkkgaGF0ZSB0byBzYXkgdGhpcywgYnV0IHlvdSdyZSBnb2luZyB0byBo
YXZlIHRvIHdvcmsgd2l0aCB5b3VyIGxhcHRvcCB2ZW5kb3INCmFuZC9vciBOdmlkaWEgc3VwcG9y
dCB0byBnZXQgdGhlIHByb3ByaWV0YXJ5IGRyaXZlciB3b3JraW5nIGZpcnN0Lg0K
