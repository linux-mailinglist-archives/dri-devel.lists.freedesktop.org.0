Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57CD3B658
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 19:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54A110E26E;
	Mon, 19 Jan 2026 18:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DuvSWEoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C3B10E26E;
 Mon, 19 Jan 2026 18:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjwt8sCAA4lp9JqSARAIZoOV5qYIeyHcF79Ht4uDgyS78/9qF5GpmP59g3wL38G+ufLzwlqlZt3wGZoi/LR2lfJiSjf1qqqDnHqUBP0bGXbsSvboQkf4JY0F5+7wfdMaop6TiOumRV6dHW2CXuAO+XgD1IstEBfaTSZVVCPt92/P0FxJSeVbA4SUzpt9Wd1OOvtkDFE25BLlr2850haWCT6+uMCl1c7dchWpo01mLESTbwwjEviwzhg9ypv9a1pqcoMxbnl6YSrjtBub/XGglI6ln214pBzoMoIh/ATjZA1RS6Ee2YdgC4whAB/jj6bV2wENCnWHWkBWYFHAecTUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBfDxIeEpqP+jerf3AiR/epQ7IFdK0ymimj6Om7F7T8=;
 b=kMgMA25lGlDvEyS2nAJuLEj8Yr0hBKsEdKXbC7hiwJLep3A8BpbEdHPJHuniKy3P2Oplb+dkEI0ECpeunxAd7rxGee87EO2f9nqshjzrwTaoJniwiHuj0yVhCfV7/ZQ40VeUR+3hbuPGfYqKGdsCyC09Wt5vZr/HMoSiC1D01ojcPBthdaDhmbudOQui5iPhdl+XIkqbJ+hD4LPCpgJGAVlKxA4B25VM+cLVuOcVpRvDZRYc/wLcg93ynsmAQWA5SCnvcxlYBEvQXYRHVMvEGS7koe+youOwFKwDdJ36Cs/tm3jL/2yuPlr2pJX1FvmWFC5abbbyhiuik1tuigX9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBfDxIeEpqP+jerf3AiR/epQ7IFdK0ymimj6Om7F7T8=;
 b=DuvSWEoGOfbHVwSq/7VEbJRuGrPdIagNdX/k/ALv6MQAzdo3IerXm/ZBOidgf4FUhQPoO2Va3mfUZzCaMhl4UT2PnwQCkD/RZcNq64yGomHI27ERQV9gwIJ8KGxNM6f2MOsP8vH1dgmpX48iCmvVk5SalW6uuGbaELEjg0aE3mKGnUMCR436tH+JGmYrYsQK7ZfQYfGga3RDcRu/Z/m/8c+5DvDvyS9wsoks+SfDvoRNSIPsytcJba6R6rHVXTX3i3oTnJumfmzmy+IZqoS1T0mUkkD6mzerdXhfY/9QIQl3BCDhNCtXJg31OccMmwUCvZ7sbACOt/yZJWCgbPEhvw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA5PPFDC35F96D4.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 18:57:26 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9520.005; Mon, 19 Jan 2026
 18:57:26 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] nouveau/gsp: use rpc sequence numbers properly.
Thread-Topic: [PATCH] nouveau/gsp: use rpc sequence numbers properly.
Thread-Index: AQHciQXRw4teXrnuuEyjZIPdULSXlLVZ2NqA
Date: Mon, 19 Jan 2026 18:57:26 +0000
Message-ID: <5b6715f8f096ee6ea180b6d12e56bdee590c1d7a.camel@nvidia.com>
References: <20260119053701.181329-1-airlied@gmail.com>
In-Reply-To: <20260119053701.181329-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA5PPFDC35F96D4:EE_
x-ms-office365-filtering-correlation-id: a42336dc-5c1e-487d-f76a-08de578c963f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SG9iL2J2ejlQOHFWT1lDay91VysxcWVXbzJtMG16Yko5YWRYdS9uVHRRY1Y1?=
 =?utf-8?B?QjJnZHNKelUydHk2R0RTLy8zZzNaSXNqWFVHeVNUMlgrellId1ZyLytXOUdx?=
 =?utf-8?B?U3BjRmNWVzRoRVhPdER2QTZKdkZNZndGcm5LWE1ubjVvVkhEeWd3UWdQaW1B?=
 =?utf-8?B?ZW1YNU1LSVl6ODVTWnc0RVY0MngyUXNBZFpDazlxTnlHalVzNFlsL3o1Q2hG?=
 =?utf-8?B?T2tzVHpBWFdFbW90S1Q4eER4SUxsNEN3a2tBSnRsTklXRXVZRStheTRnZEZJ?=
 =?utf-8?B?RkdzQTlVVXJ0ZDYzd3lKZ2ZUU1p0UnB3blgwQlJMOTZEaWJ0VUNGTlA2NDZK?=
 =?utf-8?B?OVBobWFtdkxvTXQwWTZlL3I2ZEUvK3N5S1l5OGF3VnlBV1pOUldidjZnazNW?=
 =?utf-8?B?SE1UaEpvWEhLL3lLdEtkN3Z2ZU9JcDFqNTgyTjZqaTIxV2dHTk9ZM3pBSDhY?=
 =?utf-8?B?UHZJZnhKTlVUWXlHaDc5Q2xaSHdVd3BuVTlaRnkxbHdSNEtaSXNsVkFkTEVC?=
 =?utf-8?B?b3JOQ29XaFpnTUVzanhWbDN6SUVDTngyeWxzaml6d1ZsczV3ZnZ4a3hVa25M?=
 =?utf-8?B?ZExuWmhKZ3NOb0VmS2F0VmZDMFFWeFBnSkYzT2NNRG1rVzdmdThxTlVhTGsx?=
 =?utf-8?B?a3pGbHI5M1llUnFrQXZId2xuU2lLQVNFek9FMTF3SUtWdkVkZDF1MnNIdFYr?=
 =?utf-8?B?TEhzTDV5VmhEbXdEaFpxYjF1cWNwSWVja21ldEhHT04vdDNiUjUyMDRmRkgw?=
 =?utf-8?B?UkU3a3R3SFJCbGUwczlSUnl0N3ZUM3JDQ0NNb1ZvMFhWMGljcERrZ1R4QVRX?=
 =?utf-8?B?OXNMVkNDQUlOM0tGb1pjdWJNdGh1bnlPMFVMeVFvb3JocTdKT1EzeDlRdk02?=
 =?utf-8?B?MjhyRDBQMmY0U2o5YlJDRnNrL2lzOStQeDNWMWRiUzEreVpBN1ZlZllHTmQ4?=
 =?utf-8?B?TjNLcnpIcjBSZm1wa0E5bFRrdzVvc2hnYVRwVWRsSmpwN0ZkNXBNbVVWb29C?=
 =?utf-8?B?ZGNsN0c0TE1vREt2K20yMHZKMVFrVytxNkI3TXZvR3pOK3h2ZklUa1AvTjlV?=
 =?utf-8?B?UE9NTEM0Z1hycWFCL2FucHFmdXRibHR6a09xdjdrdGx6NE1HcGVsNWU2R21s?=
 =?utf-8?B?WHdpMlVaM284eWxPSVQ2alZrZHlxVU5jT2hqcno3d250K1d4YzBRV01STjda?=
 =?utf-8?B?aldWc3pzUHFWQTBVaFZpcmppT1Y3dytDY3BjZWdVZ3NTUEs2YXZHMXpGS0d6?=
 =?utf-8?B?MW1qdW56QVM3VXQvSnEzLzlycUtNblMya1NUNDVOd0wrMnBxQllKNDdROXdV?=
 =?utf-8?B?c1dkaGRLR1MvMlZ3OXVTQUpFVi9lY3BJanJFbkkweTUwR0tiZEovSWh1c2N3?=
 =?utf-8?B?YlR5OC9uV2ZKUXJhanQ4ZlFNTUpJdktqSmdLWGx2Z2pNdERVeHJhd0ZBL280?=
 =?utf-8?B?TmhUMXJZS0RqY2d1bW9yNjFYSC9KWmcrcDlEVFg1c3lyeWg2bnlXaUVJQy9z?=
 =?utf-8?B?RUJZUGhxOVhmb1RqbWFXREp2WEx5TmpSNDlocktMaVBQOE90dlBjYm12WEU5?=
 =?utf-8?B?WmdOR1J3a295bHkyRkdCWTRYQnVlKzZMaXNXeElUSFcxZy8xS1dCdDUxZk1n?=
 =?utf-8?B?aEZwNHh6OVJnSGxEY3dxYTdBQ2U2a3lCditiU3EvRGw2U096dnB0d0YxY1Rt?=
 =?utf-8?B?WFk4cHNUNStQSkMzcXpHUWRvQ3lBOC93YTAwTkxXTnc0VmV5cXpyNDROWjJn?=
 =?utf-8?B?S01KYVZVNHY3c25VSjJqNjR3eml6a2RwT1c3c0E1OXNMa24vMHkzZTFlL3lC?=
 =?utf-8?B?aXd1MEFINU9zZ3NTS2tFMlZ0TFk0azhzZzBId2twbVlQSlh3Qi9PMHFBVFNa?=
 =?utf-8?B?VnV4cGVIZ1F6YzZ3aXpJRGVOS2xNUUR1OU5ldzFpTzVaci9oNThheWV0cWFQ?=
 =?utf-8?B?ZGhidWdnOFF0U0hSRU5VbUlKQXc3Z1JLWU1DT0QrcFVEaUpSLzd0TXE3V0NY?=
 =?utf-8?B?Rzk4ZzVudEoydlNsbTVXMVRMSGtIQ3V6K2pjN0lRM0h5dVBTK0NJTklPNmpH?=
 =?utf-8?B?ZER2MTJ1RHBjbXBCay9yWk43REFsYnhRbjUwbmkyNElyeGJoVU90MUVsRkpr?=
 =?utf-8?B?a3J5VkRPN29EK2NGaUFSSUIvSUV5aXBrQm04MFVITXB4dVNqR1hObnkwenBs?=
 =?utf-8?Q?/xG27nBWREin43x1fSpX5XE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGdna29TTGhkS25sRmZjZ0hNR3c1WDhKaGJUM1VNVktqdTkxMHJNRnIxU1Ry?=
 =?utf-8?B?ZnppNk5Qc0hkMmo5WlA4OThNL2IxVi9aWUtDeFJ0c3pMS1QvSTVibi85T2gw?=
 =?utf-8?B?L0RMazNGeUY3cjhmWWpzSGtVT3A3M2VWR3ZIcm1IbUZKM3kwUXNWVS9SZFZS?=
 =?utf-8?B?UEdBSlJLY2pwL2pWNFZBREpDWXBGSVFXVGp3Z2ZQVjFOVmtWSnFNYXhPL1NM?=
 =?utf-8?B?dHllS2tCVm5ZK2Q3Ty9ZaWlHb2ZMSjFnUWdnbHNrTTJrSU5jVnpvaFUweHdo?=
 =?utf-8?B?UjZwOVBscmNnZDVUVmNKRFpxNWpvcGp1Q1RSRzB3VlpBdkxMUW1rdVAzVjVE?=
 =?utf-8?B?QkROMmdVY2dXVjFMeENMMjZTT3pqS1BIMklIeE5ua0FaNmVOUGlxdWkvd05z?=
 =?utf-8?B?byt5eTlYa29BelBzNEtOVzJycERBV2M0MXN4OE5EOTQ2NDM0aWd5QzZBQW4r?=
 =?utf-8?B?TFhmaHRsMlVBemtTZ2tvTUlEWjZyZkZWejVLN2N1c29SOTFoQXo3cE9pVDJm?=
 =?utf-8?B?d1FCUHRIVDBKWDY1MkMxSmN5ZFBPdlZVc294S1ZGQkZPSzltbmExeEg1bzla?=
 =?utf-8?B?bE5lQUlTUmlYVHpoTFJ5TXJVZ2JTbGpHNXlPZXBhcll3YTJCaFEzUi8rNFIx?=
 =?utf-8?B?VzF4cW9peXBWeUZKRVJmcWtFUFpxTHhnWDBMV2VSbCtkTVlOQXI0ZmUvYjlH?=
 =?utf-8?B?djV5MExlSTdzblNTMlBkNzE0VWd3WFZZb1l6WmtiSFRxNTIyRnhiVE5SSlZQ?=
 =?utf-8?B?QVBxNGJ2ZWhLQU1TanB5QzVMZ1RiNWYwTTd2Vzh4VjRNUk1Cc1UvUGhUai8x?=
 =?utf-8?B?cUVySjVBc2Vxb09JSVdMcTJEbTRSSXB2aGcvRXIwUXF3WVR3WWhVOHFRVGd6?=
 =?utf-8?B?THNjQkNTaWFFOERwMDRIVjJIYWZjTjdTaWZkSWNFVlVKSHNOZW5xeDBNYWww?=
 =?utf-8?B?WFgzbDZacmFDWlpVUEJYbTI5NVQrcGtDcmF4Vm5pZ0tvc05jaC9WVHYzSG1p?=
 =?utf-8?B?K3VOblhEYUR6YWdNUkUxUk5VRUh0YU9rck1vWU9uUm8wSVQ2NnNJN2p6ZjJX?=
 =?utf-8?B?akJkdzBqakMzb082RDBuVEIwRHJjT2NPdXlKUitTcHhiRHVmL0JxOVltOGwv?=
 =?utf-8?B?UlczM1hQTEljOW5ZcnkrTWR1R2U1WldSa3k1VWNLRmpDOE5HNjV5TzlleUlW?=
 =?utf-8?B?a0FUb1ZleU5jTklOYjR0STd2M05PRm81SG0rZEVPK3doeUJKRWtqcC9lL1ZB?=
 =?utf-8?B?V2FPQVNQNVNmQUcvbU9UU3p2OWVCQWFrdUpXZkpYcUJrdjNBRU96QlU3Mm1U?=
 =?utf-8?B?SUpHeHRBVi9qblRUdzMzbnhUSEhyK3NBQW52QndXek5EZ1N4NUtUa3FXbHhS?=
 =?utf-8?B?MFRMYmZOZmUyRGJCOFFEWUIvdEZvUGtZajBFL1hibERzS0hVYmQ1WjhNNUFz?=
 =?utf-8?B?Z1BJeWkwbDE1b3FONENqb3Z2N2Q4blp4THFveVpTQkRjOERPYTFRcVRnbE5B?=
 =?utf-8?B?WHVnQm0xdnhmZkFhNGZpdC9iaUVUcFNQclUrMHloR3B0YjBobU5NelRNKzV6?=
 =?utf-8?B?MSt0cVZTWHZNLyt5UGdURCs1WEc0MmxaVUozVGZGdVlMNXQwS1VYSlJoTjVw?=
 =?utf-8?B?Mk1YVnkyZUFod0tKbmh4YmZFTDZYK0lOQXRmVDBMQWFpTi9sSVdHS2NTTEhV?=
 =?utf-8?B?OEFPQ0ZyQ1BvU3ZVOS85SFd2RlZXRStKaDd1cFpOVUVUclkwMVJ6NzlBRTFZ?=
 =?utf-8?B?ejJuMFgwYi82WExCb1VzaHQxK0ZuTEp2THFWcmlDNWgvd2ZYNkdhUnlJTy9i?=
 =?utf-8?B?V2k4aWdRS1FGUjhmeXZkeGl2L3JiRTRMNHFCbFdqVmpndEphYm1zNUxvT2hX?=
 =?utf-8?B?TFpDM1MwZmRpWnNaMFhZTDdCM2tuL1lVK0NpM0dsblFNZWd5UHhnQzMrT0xo?=
 =?utf-8?B?TEVDYkF0NnRncDlaQXM0MnhSamZvY2Y1RG1jMTZlL3plbXEzZVJxWWJZMk9N?=
 =?utf-8?B?Uy9pV081OWJjNEVhWkZoZ1g4ZFlQZUpHSnZBc0FOOEhicGxKaW85d2ExelhT?=
 =?utf-8?B?bC8yNXF6TG5FQ2FzSHFzaFgvQ3hESDI5R3MyOUZ5dndNeC9sTGFBWS93SUNI?=
 =?utf-8?B?Q21oVEpmR010NEpiWkx4L01JbEVmMVdLUHBBR0dkZENaRjkyTW4vUlZIUTZ5?=
 =?utf-8?B?TVBKc3BMVWQ3czdac0lhYjJxS016U0pYdkNlWjljYXA4ZnljSzh3bjhqcEZR?=
 =?utf-8?B?ZXNvTlQ4eVFQQklLdWhUV2tFbmlQUWNiQnZCZU1zbWVSVVdleWpPVEdXU0VD?=
 =?utf-8?B?MGZ1Slp5QjQxZHpJbTJzdEc0MTFhM3R6MHBjdTRtdFZEeTN2M0d3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FE54802CCE4944B920B040EED2B6364@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42336dc-5c1e-487d-f76a-08de578c963f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 18:57:26.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDaVcuaSCgAklK1zQtqkC+5RGZZBOqhBTR3lHvARN7YVuSyrB53jwtxq69IrdlzP6+lzmonJBMBLIDdwPPa+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFDC35F96D4
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

T24gTW9uLCAyMDI2LTAxLTE5IGF0IDE1OjM3ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gDQo+IFRoZXJlIGFyZSB0
d28gbGF5ZXJzIG9mIHNlcXVlbmNlIG51bWJlcnMsIG9uZSBhdCB0aGUgbXNnIGxldmVsDQo+IGFu
ZCBvbmUgYXQgdGhlIHJwYyBsZXZlbC4NCj4gDQo+IDU3MCBmaXJtd2FyZSBzdGFydGVkIGFzc2Vy
dGluZyBvbiB0aGUgc2VxdWVuY2UgbnVtYmVycyBiZWluZw0KPiBpbiB0aGUgcmlnaHQgb3JkZXIs
IGFuZCB3ZSB3b3VsZCBzZWUgbm9jYXQgcmVjb3JkcyB3aXRoIGFzc2VydHMNCj4gaW4gdGhlbS4N
Cg0KSSB3b25kZXIgaWYgdGhpcyBpcyB3aHkgSSBzZWUgc28gbWFueSBOT0NBVCByZWNvcmRzIHdo
ZW4gYm9vdGluZyBHU1AtUk0gaW4gTm92YS4NCg==
