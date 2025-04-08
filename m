Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3AAA81251
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E23510E705;
	Tue,  8 Apr 2025 16:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iTZjl2gS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3F610E6FD;
 Tue,  8 Apr 2025 16:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5y4ijK5NuAr8RzHOusJ/zYUCDP39zvNWsebIErMy1VNXA8oMraR/RG9f42QMpBM5sUcZ0WdHhKlV1aAGkpySW8gW2+r0km5NMZvba0GkNO5RbbE2Mha8Q0Zs1n4ckvWICJ9Nl+C2sId3ujfiz6EOwGs9TIeYPtl5jtE81nGlI8PHaMmviu6azgSG/e/gzWIVLb3EmALFHqmIvtPj7mCQ/dqz4i5SoYMGqJ0j9Vc0cn7vQ/j2KwF5viXnVZWaw/PSkFFqKNd1xbZnww1c7dW9xqRh5CXKfOjU+Y8TnxeCfuZf/PF2kE/MVMVyjrnXT9I+WGx5G3+mLXyVunr3nciAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABC6CycSkWeceIJ2NuGd5s4f9lWnaq+XnqAjQHZa290=;
 b=U7jQv7REkdnT9AusUvM6LaLYwlnDKXHE7wHfJ1RZRUbg/1/Wyk0UNJMP3MFOfRSJFs4XEZ+ZyIRBnh9xlsWl/svv5aI505VXvWlMzsMNEUoGaNmuJvugGxHCUI5eIfptcWwg9nFPoEaQfNGtTp0cvfuWuYOmTKkVV9Ey5ws6YIOaF1goYY1bn67IW3anmwfSslzV/n9MTJr8TLop+a8ka8bjFYY8fisTwUgJwm8UPSnUFSlrxfOcjVwel5sBgCWGtdbMBrnVF7yA5TKc75Oh+0DlTRhas6nd+/GoZJ8alzLpiTglqEZwPNUzfnkVrgEzEicjFrItE3FhHp7YPLU5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABC6CycSkWeceIJ2NuGd5s4f9lWnaq+XnqAjQHZa290=;
 b=iTZjl2gSTHNgD+znvh9Pd4KYJ8UzFNzP+VVtSSPpiAfaxNCfzLQEHQ3GkHrsVgLSLQ9SK5pPinvHoDeLljH+vJXV+AZ2p3zPIe+4RQqqwTaOYG5OmTXmoa7Aj21Fr//fd+F9aFRI4jLPg3AE113bOi1l3aBaI8jMPUgdQ/BsK3Qu7R/x5URvuWyM83U7XIAWazK5BvflSTq2nnkwr/KRtHr/WnbQSE+tuziRQiFdIjFj1icAxYiVlJULsvoau85PQ2Q+i8E9IKqs9Wp2vZzTr4uKIKACVucDW0nC77zmgiMEe29LRscFxqFZ0hD031jAE/Ane2fLa6jX+VHECXT3PA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB6279.namprd12.prod.outlook.com (2603:10b6:8:a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 16:30:02 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 16:30:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWAgAACUACAAAJUAIAADx4AgAAC2ICAAATUAIABTLUAgAAGEwCAAAJYAA==
Date: Tue, 8 Apr 2025 16:30:02 +0000
Message-ID: <a469b8f67ec6291e261eca0ff4c0f5fe697731b6.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
 <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
 <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
 <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
 <5B682A0A-C81D-47F4-A0A2-BA81A6281413@infradead.org>
 <c5bf5cf5a6d0d9020c6f7f0adb1b68c6d9598c23.camel@nvidia.com>
 <a5f5cf79aa72c18c6921192b3a8355d14bd5659e.camel@infradead.org>
In-Reply-To: <a5f5cf79aa72c18c6921192b3a8355d14bd5659e.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB6279:EE_
x-ms-office365-filtering-correlation-id: 0128579c-bcaf-4431-34ae-08dd76ba9d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S0hBVWNaajBBNWpxc3VNL0VxMTNyZzdjNXhYb29nZ3AwdXUrZzdOa0VmT0d3?=
 =?utf-8?B?akhpRDdMS2x6UG1scmUvdHgzODBRNDQzb2VkNXArNTgzRDdWbjhtVjhrbUhU?=
 =?utf-8?B?WmpXQjI5eXY5NWlmUVB5cytqaG1tVmc0ZjB2aHd0eEJRaWNyU0d1cG9obTN0?=
 =?utf-8?B?ZlprOXFrelZSd0V1RXFYd0hNMDg3RzRvOUZwM0VOUWUzTXdGU1hvcnNkNHlF?=
 =?utf-8?B?NlZtbG0rRnB5eHpwNW9nU3phV3l1aS95TmtEOVl2Q0xrUGhnZnFTUXRqSndV?=
 =?utf-8?B?SlVGNVB5NzRQdjdFN0xMU2NiSjBhTEhuRXZxNGxHajN3cnpIdmVEOEc1L0RP?=
 =?utf-8?B?OEpLcmp6V3R5dlFFa3BvUEtsZmdUY1VWM1VYSUk2cjNnd1lVVzUzWWJiVG5F?=
 =?utf-8?B?RE9CNE5iT1B3c3B1T21qdzdBOEVvSFpHa1Z0c2E5M29zRVdsa3BsVXdrWlIx?=
 =?utf-8?B?aEVIVkFIc2drNEFuNXNWY1N1YTdMc0hBSjYyMlFuVDNHdEpobFRzY0NDVFor?=
 =?utf-8?B?S2xSbEl6bkNQVUFzN0o3NnhydStRaDNoaTFUdXRBLzQ2UXYzc2h0bitXZ2dM?=
 =?utf-8?B?Y3lzQ3kvNnRPajVlTFpSVjhKajhZL2pyN1ZXMktVcU1rZkRaYng5eitEME4w?=
 =?utf-8?B?ZXhBWWxHRWtlNFpxOFM5OVFOc3BEellGcyt0WldVUXFTSnpLOXJFb2d6RWtR?=
 =?utf-8?B?SzdGOGpiSDVsSXlyMXpzYUZ3ek5LUTJIaFhjVlRWd2lueEtHUmdyUjM5dWxI?=
 =?utf-8?B?WCt5Y01ycmV5Rk1kY3ZiTFZoeHhRSkd1d2pRK3BiZWkvR2U4UFBIRnJoNDU2?=
 =?utf-8?B?c01VbXVxQmtmY0FzWUIvVU5DMkc2ZU5kZ3c0clJ5YVE2bFMyVktUd0FVVmYx?=
 =?utf-8?B?S0d0WWJJc0xCZWJGUk5ySkI5UTRNZSs1RGsrcWMvZTVxQkZUZ2hoYUl6Umd5?=
 =?utf-8?B?U0lkSzhMV01KbEJhdTVJRXh5VndvUWxYUmEwWkhEc3o0Z3d3Kyt2NVMzdGYr?=
 =?utf-8?B?cVNZeUdwbk5BMWV1T2IzVjlCc01JeWxqSCtSQzhsMmM1S243a3ByRytrK2FJ?=
 =?utf-8?B?b2cwWWhDSGpiam9MTC9qQjl1eHFHYi9QSGNwTmxqTzdOZmZaaWlubU5STzR2?=
 =?utf-8?B?TVlNbU9na1YvOGV6VEVwRzFMaCtQbUtVdlFRYlFKZ3JNa0RPMlBSWVMrTy9h?=
 =?utf-8?B?ME95TmFLR2J6cnUxU1BmZENXY2phNGxKWVVoR2IyODg1NDU0RUlOc2NSRkRx?=
 =?utf-8?B?enUxS0V3VEROeWRiYzNybWczSGhQMFhaby9VMXh3TUF1bW0vclJRZHhLNk44?=
 =?utf-8?B?S3IzNHpTbU9YOUhiaUtDZlZYYTg5bjdWSHAyVFBvQ09KUmRTNVJBUFhJS0VM?=
 =?utf-8?B?QW9YS0dYQUd3amx2ZWtzdXZPaDlVUnZRTHZWYzNuSzA0T0RpL1BDNWtMN0FC?=
 =?utf-8?B?emRhVG9PQ28zNlhTMUJqVTV0ZXUvY25CRGlJYnplS0tWR3lvTjZSWlNEUTdx?=
 =?utf-8?B?eG1kdEppU2xFeWVkQmFjYzJacHN6cEIzV3RFQkZPbExBbFc0RytNbkZQM3pE?=
 =?utf-8?B?UXl5NjhhZjA3OUhYLzlLaGt1KzdCbVMzRWJLUEtVeXUzWnhubjZhai9Mdjdz?=
 =?utf-8?B?QXJBVGY0OHZNVnhtUlNTUTQ1TUNYZWJndklSUGlXSWRqaHJjZG8rcjN3ekow?=
 =?utf-8?B?bG4yWmFmdW50Rm95MkZIbDNjQUhyczVyRGhiM0VzZ3JGSHRvMk85aWNOSlBw?=
 =?utf-8?B?bEtYQ29SSG9pSUdObmd6cWdwbGhGWlRqelB6SkJ1Y2ZlTlpoM3JlQXlBeEUx?=
 =?utf-8?B?RndBOEtxbG5HNVNLc3J3cFd5bE55NjRaZ3V4ci83alBNT3RNU1VZQnlPVmJu?=
 =?utf-8?B?elRYempoSy9kNHNGbDdoSzJ2MDYyQlpOQzM4WHpveVNhSE9kWDNOd2NUd0pY?=
 =?utf-8?Q?KY9/evjehZmj1JzQU7Flvy2xbF2oc1MO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2VDb1UvNE5mRGp2Y2RUd0ZJaHRmSDVKNSs1b2xuKzY0S2UrbDdzVldGdGt5?=
 =?utf-8?B?MThhaXdsc1dFTTB0dkdUQ2JSeUJYZzF3dWpLcmdBd092Rk1saEJTblNIZ0VL?=
 =?utf-8?B?TGxpVHFVeDNaMjd4NldYSStVc0JsVCtnNnVjU0U4Y3Z2OFBqL2NvZC9DSFdJ?=
 =?utf-8?B?VzVMVGd0YVhMRUlRTHY2MTViOFpxcjBZK2VubGY2YVpYNnRkSjkxVkxIS0ZZ?=
 =?utf-8?B?UWhZM3ZnOFdndGpGeVBPaE1haUpiZHdDbTJaclhZQUxrQXBPN2pRSnRqbldP?=
 =?utf-8?B?MXZxNTVpa1IyMGZnWExuMmtLanNFNVFhTEkyQnE5alB2ZERvSFNIdzBXeE0y?=
 =?utf-8?B?MFBKbUtEWjhhbGNKZ1RCZlVjamNIR0RabVQ1UlQyYW9Vb2ppT0JZN3p5V1BS?=
 =?utf-8?B?ZW1VaVhHL0RDa2hVRXg4aEhWTHgrUE16MllTZC82U2IzQ1JFTHNORVdiSGo1?=
 =?utf-8?B?RkxoY0tBd1pUK09aUDA5M3ZTSlJhcUZVSkpFbmZseXRITVpnN1hSSnFRb1pz?=
 =?utf-8?B?d3BDdm1iczVHMmVRSGRaaVR6eGhVbHo4TlZLV0l2T1dHQVRiQWZXNDBjM3Z6?=
 =?utf-8?B?bmF3Z3Z4SWphMUNDQmQwZlpVSCtZSlI0blpzU3Jwc3hPZDJCL3Z4RmZPWFIz?=
 =?utf-8?B?RFdXN3N0NFprdUdlSWVXU3ptbk9xVzY1UldSQnlpQ0VVRVJZWGErRVc0OGta?=
 =?utf-8?B?dW9vMlhoVU92TkV2M3F3WFVDakR0U0I5ZTlhb2hmM2o5d0xUMXBPS0FpaWZk?=
 =?utf-8?B?SStldmx5ZHhQL2ZGY1QyUUtSc3VBY1JrQUt3Z2QxY3Y2aDUrZTdGdEg4Y1dX?=
 =?utf-8?B?MERTWUF0dU1ldjFGOTZ3WTJaN2oxakVMQ2ZtR2VSelRBZE5KUEZJMi82NW5E?=
 =?utf-8?B?ZFBBOVNaOEpQYm5Oc3hnU1pwaDh6Q2l4a05NN0U4eENpN3kyRnFGWVFYQ25L?=
 =?utf-8?B?L0U2NzNJQzNlaytVbDNNc1dPcmM0aVR2dHJ0eUo2V0xMdldQZnJRcnB2SzV2?=
 =?utf-8?B?ZXNrOWJvaStYQWoxbkNLbllYc29NNy8vanRsdzdKVW9kelNYNHg2SVIreE44?=
 =?utf-8?B?YVRmWkU1akV5NnlPQmI1dWgvckVMSSs5UTE3SUY3ZzF4OGdGOFZPRHI4cTc0?=
 =?utf-8?B?WkVzSjBzQmlYZUZ0dGxxcUhGbmF5TlFiQWlaUXlBZzFHQWNyUFVnSVgwMFg1?=
 =?utf-8?B?bG5DOWVrTkVJcUNlV1JPZFkwSWtkMFd0S09vQURlVEhncm5sTkNsZFk4YVZt?=
 =?utf-8?B?S09kdC9EQ2ZXVmNBWHZUSFFWcmJCVzN5bDRwUmNFSWxWQ2dPNUJuRDB2VFVV?=
 =?utf-8?B?UUJJZ09LNk1PNm9ud2VDd202R1lBNkhWYTdHdVF1RHFHSVJhaUNwUjZmVkFO?=
 =?utf-8?B?Sm1sVEgzWEprVEJwMlpwMk9YT0JVdExKRCtMV3hUZ0NrUVVHdk5KcXVkNW5E?=
 =?utf-8?B?dEtYK1dsd2hBY3BiTm9ncFVvZ1VFQUhUcENRMXdTZS9UNElLWUloMk1oNkhn?=
 =?utf-8?B?SmVLNVJWZDZLNWJmcWRGNjFOaVpqdXpyUFN1L212dUNwVmlqOUQzbDlzYUVE?=
 =?utf-8?B?alhKTlRCeVU3SXdocWFyaFNFV1RFYWg5NFRGOGNyTE5OUnFsMjRXcWg5OVJJ?=
 =?utf-8?B?cmxhS1pCNEhBK04wTFZZVjVhcUNhRFdMZUxkUVBnQlpCaDdMOUQ2WHMzMnpP?=
 =?utf-8?B?VTFJZjFmbUdwWnhuTUVDNUZNYjBzTkRaUk1TOHA5b1pKMWFwL1cyZ3E2cU5n?=
 =?utf-8?B?amJ5M0ZSd0VpVFJzM3ZSUGd0eE9ldkd4RjRDenFNUEp1WnJ5dlVZaGV0cWRY?=
 =?utf-8?B?dkZkTEZEZ3p6UkNIUnlxU2ZURjFJTXdUS2V0SjBZakRydVFuTmNmbng3VTJY?=
 =?utf-8?B?eTdHWFE3MEtxUGlzamlIS0dQUHRhQ2NoZERwMmRuTDkzelRJVC9uUWRxUDlu?=
 =?utf-8?B?SzdLcDJFNnJJSlYreCsxUVk2c2IrWlpMUllGRnFCMHdrNTFXZklaVVMrOStU?=
 =?utf-8?B?ZkQwZHhZRzN0cktDWElCOGU3Y1BROWlueGFLbWV6d3lBOEgwdTBPaXR6Vlcx?=
 =?utf-8?B?TnlIUTVrSFYxOW5aTUkrMGQxcXVSTWZyU1E3d0tjWjA1Zkp0UFh1em5CSkNz?=
 =?utf-8?Q?vP8d1kBWyl5sfdmDpr9K3ChPE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4173925CAA98D4588EA8EC0DFB14CF2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0128579c-bcaf-4431-34ae-08dd76ba9d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 16:30:02.8958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvY0U6IUr/xvnBpQF3bFTqXVkwpDqftPnNQu36Cok15xicA+UF+0NhOzLoUwvpMI1L1ctTSoHAWH2XSo30Y4eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6279
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

T24gVHVlLCAyMDI1LTA0LTA4IGF0IDE3OjIxICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IElmIEkgc2V0IHRoZSBCSU9TIHRvIHVzZSB0aGUgZXh0ZXJuYWwgZGlzcGxheSBhdCBib290
IHRpbWUsIHRoYXQgd29ya3MNCj4gYW5kIExpbnV4IHN0YXJ0cyBib290aW5nIHVzaW5nIHRoZSBV
U0ItQyBtb25pdG9yIOKAlCB1bnRpbCBub3V2ZWF1IGluaXRzLA0KPiBhdCB3aGljaCBwb2ludCBp
dCBzdG9wcyB3b3JraW5nLiBJcyBpdCB1c2VmdWwgdG8gcHJvdmlkZSB0aGUgbG9nZmlsZXMNCj4g
ZnJvbSBkZWJ1Z2ZzIGFuZCBkcm0uZGVidWc9MHgxMDAgbG9ncyBmcm9tIHN1Y2ggYSBib290Pw0K
DQpJIGNhbiB0YWtlIGEgbG9vayBhdCB0aGUgbG9ncyBhbmQgc2VlIGlmIHRoZXJlJ3MgYW55IGVy
cm9yIG1lc3NhZ2UuICBCdXQgaWYNCkkgZG9uJ3Qgc2VlIGFueXRoaW5nLCB0aGVuIEkgc3VzcGVj
dCB0aGF0IGl0J3MganVzdCBhIE5vdXZlYXUgbGltaXRhdGlvbi4NCg==
