Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8B8C1CEA
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 05:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D4E10E21A;
	Fri, 10 May 2024 03:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WdkaeOYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B44110E083;
 Fri, 10 May 2024 03:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEraAdtkd59z0ECmUEkkb2QVV5S+gDMA7c/t/M8RCGhdBz98edIIAywQVcHOmMB0MtaSf0ZOZ2PEoGx3SFzh9/ksbYaPRDTtZH40AY2hiZ5nlbKw9p1wuMaC5Bv52zouUbMos5hhDPyvopPO562VHx/aE1A/E+dn3zjNnbVl4tWamB/ZS0vxkdhEs0ELYCd4v1E2LOzILssAJnDAhqNOJ7306XCYAuOxa7m+UXgPs23MICq+Rn9IW665gPKFc2joIEORk7YsnAldaKJP5ADhONs5/8NVm5JipOEWT1wmYJi51CvFyK4BSajTlwnNfOt7/kWaHY/Zhwkxd6SFIeA38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyKgn58s2GGBWxcdOylRGaNeI9AOizSF1xpVaeT+GXw=;
 b=intD9eAlj+6Ms1wdA05POdzQj1BQBo69zcHSMPwmVyua/IDu+wc4I0RsG+pZBdpGLYftTHb+RPVZeOImeXoxGmSZ5XwKiLlyez6iMgBgX2OjNCr1XM7J6N6QlY0RuAsrt3DFqxVvGYxpLg5HojQHW4AiwzhynZj+AoISvF20rk40GeUd9O8iVvemX5zRHYH3lKp6sN/dw5UGVDeEFhmFnxlqAJMdJrLcYsR3wxfzerOnBmtKOQTM9WZuneZjo1Sd9L0CsIHTTy/kLWDa+a5MKM1cZORSyIC1CKDMcAZ0qJzBRzAjzn4wWBhmNuCNcL8DcZzTKySAbAwPB/koR34Bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyKgn58s2GGBWxcdOylRGaNeI9AOizSF1xpVaeT+GXw=;
 b=WdkaeOYlDipgkBgf6wSVu44qkBdZmaEaxY+0XDHNSc6KTJqfZ16XZk6o0EDfR6BZg29PnJFSJ/I5YzSb/U2G+dVt99ANyT92YYjpQ3R3dgYyXmTRPbHXhgtph7QFDJ4UZ5wIAzXZGyfESMfsIqTxcXv+UZve2xMzuVhdhyPFjm0=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 03:18:35 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 03:18:35 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, Linux regressions
 mailing list <regressions@lists.linux.dev>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
CC: "lyude@redhat.com" <lyude@redhat.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>, =?utf-8?B?TGVvbiBXZWnDnw==?=
 <leon.weiss@ruhr-uni-bochum.de>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
Thread-Topic: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
Thread-Index: AQHacFj2giCMd8JLWkW3Q37cghjqLbFusMYAgCCLdACAAG5MAIAAhOyg
Date: Fri, 10 May 2024 03:18:35 +0000
Message-ID: <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
 <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
In-Reply-To: <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=442cfa19-9a37-4fd0-b3fb-b8ad44f4225a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-05-10T03:13:57Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB7650:EE_
x-ms-office365-filtering-correlation-id: 5c27c361-4139-44fc-93a0-08dc709fe0fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SlhmVVBkUzlaU1h4c1QyUE1XUFdxYkM3YkF1SWUvYUt4VC9LY0kxMTdQWFkz?=
 =?utf-8?B?YldqclNQTWZadHhWeW9xUUtsdmFWK2lpRURyMW5YVHBrUWNNdlFENWVXcXFP?=
 =?utf-8?B?Nk4yRlYvS3hMb2RzTVpEb3oycHI5czBOSGE5MGs4Q0lrNHhPQkozcEI3ZlpF?=
 =?utf-8?B?aFlJeXh3cTJrSm9JMGlUVk5DZTNpb3NxeXJyMGxpWEptM045cUFoYk1kam1Q?=
 =?utf-8?B?bXJGS1hBMnA1MklLRE1YREF6Rm5KSXl1M3NzaFgrOFhPSFFhN1ZiQ3BUMkZv?=
 =?utf-8?B?REN5VzZ1YlYwcTVwOU5rUmh4WTRrY2NodmdCR3dIdmhmaTJFYkpwQlJWbTZZ?=
 =?utf-8?B?dVFBb1dabHczSVNGUm90elZ2Z0ZxZUNCeEZaSDQ0cndKY2VrOUVGVFJKWHZK?=
 =?utf-8?B?SVZxMG8vbHB3MzY3NEpnd0dOQUoxbU4zaXcwRWJ1eDRIRUZmelNLU0FESjZl?=
 =?utf-8?B?NGZLY1gxdW9kWjdTVjgxMW9vRTlKZXFpa0tPQnE0Rit3ZC9XTVdjcmU1aXp6?=
 =?utf-8?B?THdpdWJDbm5kaWtIQVRsanF6Q0RJUTNmRGlWMnlySnpyNUdrNE9zaTc5c1Rk?=
 =?utf-8?B?akliSC93OUkvaDRsZ0JCWFhGSW9KWUlteEI3Y1phc1AzWXI0d0tuNE1JOHpm?=
 =?utf-8?B?NS9qVEFWbzhmRGt0UFoxdkZudUFRaFdqM00yUEZ3WG1LMWE4aHEwYlJNNnJ6?=
 =?utf-8?B?U2ZBQUlQWm9iSFVrbGZDelJiSGFLYlNJRzJkOVhOSmdzcEtySlZvTk8yeHpG?=
 =?utf-8?B?MVFxeW5sSW1wME9VaDYyV25xb1ZWbGlzanhSanU2cncrUEc1ZlR4VTdkL0Qr?=
 =?utf-8?B?bGlxREtINUxWUDNOYVpTYW16eHh2NmRxNjBDUk5rdm5IS0RjSmdCOHRCUGlw?=
 =?utf-8?B?WjR2YU95R2NoblIvUENvZTNtbUw5M0VUY2l0SVVUa0ZucE1uRFZReE1ZcUlp?=
 =?utf-8?B?UnRXditieVY1WFlGbUdob1pKR2syWTkwVTN6c3gzV1pqRnNNOFJaK0xxeHJy?=
 =?utf-8?B?aUJZaFNRc1hUSW9POCsyWktLejlzMCt0Y1M4T3k2d3dITEUyeVZrZG5UNGFx?=
 =?utf-8?B?bUIrbE1YdjlOSkZldi81OVU5UHpBUEh2NkVOdmVQdnlPWDJ0c1JJQkR4T3RP?=
 =?utf-8?B?UmV3UGJlRDEwWVBsNmM4SEZtNmFYQmhyRVVSQWM4bldMUUE4TEFscVZkWnQ0?=
 =?utf-8?B?VXo2RFQ5bVF6S0VoZndkd2NnazVFbEVOWFhWY0JOd1hhQVl2MFlVbk5WcWpW?=
 =?utf-8?B?aUNpand2MERhbTFQQzRSODhvU2o4WHJrSDJqSWVoSE5RUVJGR0lRV0tod1VF?=
 =?utf-8?B?bEdPQUlsZnNIZk5xbk9ybmh2ZDdlV3ZDUlFLMGIrUmlVb2F0YVZzREQrc0dy?=
 =?utf-8?B?RDgzZEJ1b3hzc21EQmdKcGJVZlpXcGxjeHRVL3NpNi9kcThxVnRPVVU5eDFn?=
 =?utf-8?B?emk0TTlUejRIbEhqQ09KWC94TG44SlBtUWx4ekFJNVpkbGtPYjlIVng4OTJF?=
 =?utf-8?B?eGQ5aHQxVXdvR04xbzBsR1BJaERQQlV4RzhrbzhTRHBMbjRwNm84eitMTXJB?=
 =?utf-8?B?TVZCL3hvZlIrVTNyNnJhT1BVc3JhZ3RNc2FxSGJPUEhEdFVFUDBWTTNuWVUx?=
 =?utf-8?B?ZnRIY0pCd2E3UVZmdDZBcnUrY3F5amZMc2xhUFB0YUhyTE9taHIxQ1h6cTlM?=
 =?utf-8?B?aENoQnFFeDhKZGJaMG1WSVpYZUdvSnh2WTdLU1ZDUzUxTnYxdCtBZDJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjhzYzRtNHczcU1kTXliSnpsRTlKcXljeW1vZmYxUnN6Zm9pbzIya0xIdTBB?=
 =?utf-8?B?RGF1TzQyUmhvTWVGQTJaNlpmaThpZ1kxbmloT0tzQTk0K09HM2REUzdtdXF3?=
 =?utf-8?B?ZGZyM2QwS0tiajZwMnZUUlZHZmpjYmhKREhVSXJQUENMRjZFVHRLL1FoSUdl?=
 =?utf-8?B?dnRpQWNwM25yQXBjWGVkV2VPdXgyVkp2VmpqOThHcHdxWEl6NVdHazkrLzFU?=
 =?utf-8?B?U1c1K3MyTUU3UXNHY3I1SkpaRFVnNHRKNE8xQW10aHdqQUNaZEVLbjhXTmxk?=
 =?utf-8?B?Vm8zVmM0VWVSUmd0RS9ISDdyQS9wbjNIZnRHRGNJbnRuWTFjK2F0bURJa0lI?=
 =?utf-8?B?b1NUaXo4Q0U0dFRPNnVneEpBMS84SzZCa2xiRGpGdWdkZW5TV3dvU1YzL1k3?=
 =?utf-8?B?Smg5eVpVdEd2bEJvMktabERkVm4rR2JSNmY2YXdVOS96bVgwVjRDaHVObC94?=
 =?utf-8?B?LzVVMVJUNUlYY2JHdE1qdWl1T2lwYjU0SzQwZWZZd2tDbVJzZHg2TVRzMjdx?=
 =?utf-8?B?bzhnZnQ2RWlJYmpYNUs0Qlp2Q25USUFwMzE5S2NyNDFha1paWUdGZ25BS1RF?=
 =?utf-8?B?dnFOSmtNeTNoUXgwZHZSbkx3OC9Dd0ExcDRiRzMrVGlxckFVZEFrVjdZZURu?=
 =?utf-8?B?bnhBaHdTSlVoRmdqTXp3OHBzOWFGT0FRSHRJdVhROWpUQUkyeFVLRE5VZlp2?=
 =?utf-8?B?cnZjMDdiOUI4Q0xsUmFaS3NaQWdEaDhkUFU2akE4MVpKcnBoTU96MTVwRmhZ?=
 =?utf-8?B?SmdPZjhkYkFNSWd3dUUzSFBNNnRCT2VtbHdHdWllRGR6V2xPWCsrVlhyNWRL?=
 =?utf-8?B?bS9qQThhOEFwaTFuazdmQkQ2Q2NSSHUzNHZXSzFoQUIyUmJyV1JFSUNDRlpY?=
 =?utf-8?B?NGlLbnA3NU5oZkFYUzlYZmVyQkFGMWN3NVJ4MklNRnBnYUJiMnJxNnN2eGtI?=
 =?utf-8?B?M0ZrbStkM2lNNjV6ZHViSGs3dVhnNk1MN2ptTXYvWmlJMUh5NXUyUmhialVS?=
 =?utf-8?B?c0daZnI5M2F4UURQb050U05IZytORGN3YXpMOTczSmM0TEtoSlRLQkI1aG9k?=
 =?utf-8?B?dUoyb3hRQWRpcVliOWZCMmFkMEt3c25mYUpObWtVQjFwS2RPZXJ0VjZCY29a?=
 =?utf-8?B?ZCtxV2NPbHJPVWhsMzRwckwwZCtWdUljejFUNisraE0wVDBQQjNaKzM2VHBU?=
 =?utf-8?B?NHFLQVFkRGo4K09iVExqN2s3ekhORWZjRmRIVVVRcm5wTU9QZVJ2a28yWXkr?=
 =?utf-8?B?ZmN0SzlSVGtueGdyRWRHTzVjb2NTVE9WekYyV1NjaUUwOHA0TXJZMHczeFNB?=
 =?utf-8?B?eTJJdHpVNzVwZFBxTDBRR2IycDNxcEphMkgzMllUNEgrem1tMk5jQjVlejRy?=
 =?utf-8?B?bVpsQWpTVG90c0dsaFFDaVhGZ24xMlVrYlRDTW5INFlnSVJlVU1CSHNrbHVl?=
 =?utf-8?B?RnE5NSt5ZUl5TFJDS200Sk1mdkR4MVpvT0hqOTl1MzFrM1ZxT2xMZG5TcndQ?=
 =?utf-8?B?V0QzZ2YwN2VDYkhoN2JkUEhlWndpbkJxNm80MGJVSnhOczBvYlZIb0IvT2g2?=
 =?utf-8?B?TXdWTWR2UEFjZC9SRzZVb0FxdHFSY0szTUJQaWd0T0JVa0hnd0JOYkVBUjk0?=
 =?utf-8?B?SVRNRU5EMkR2NEZWRUg2NUNoVGRkZ1hmY3RQbEhiNGJtejhnRmIyeDNOQ2ll?=
 =?utf-8?B?bnVhdlROZ201VmljL1cvekpvaGpJVVY0UE9nSWFFMUZwQmtZZGpEQnY2bkI3?=
 =?utf-8?B?QjNWSjlvTE1BVXRkMTF1bHRzaTBEWnRndDhmYW0yOW5FTDYzWFZtc3NiZ3Ro?=
 =?utf-8?B?d1ZRakI3R0ozYkhLVGwrUmd2NThrVFFkb3dyMnF5Y3h1NHczUlBsUDFIZ1B1?=
 =?utf-8?B?cFZhRVIzZk5MTmRBMEcwWjZUTnBRMlNwbE9PZE1GNlFZSmhUYllvck5nSm44?=
 =?utf-8?B?dkcvU2FHUTRaM0xPdy8xS2hFZzgvL09rT00wUnZMaTI5VXdhT1BaS055VjBu?=
 =?utf-8?B?TmdPMk5lQk5JY1QwbUxiOEhZUUw2ekhoMnVHeWk5Zm5HaFVrS1NHT0tmUUwz?=
 =?utf-8?B?a3gwWDVFUDFXQjVHb2YyNUpXbXR6SmJJVFY3a2w3dWJGbkYvN1ZWQUhVbDZh?=
 =?utf-8?Q?BXMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c27c361-4139-44fc-93a0-08dc709fe0fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 03:18:35.6441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pa4gJBtkIFIVCh/AFBfpyP66q1YTTcwU1Z5Puy6oydyneNy1dAM3JlXshRTdjJgrhUwKrZyk2Wkj7lHI854e9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW1vbmNp
ZWxsbywgTWFyaW8gPE1hcmlvLkxpbW9uY2llbGxvQGFtZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
TWF5IDEwLCAyMDI0IDM6MTggQU0NCj4gVG86IExpbnV4IHJlZ3Jlc3Npb25zIG1haWxpbmcgbGlz
dCA8cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2PjsgV2VudGxhbmQsIEhhcnJ5DQo+IDxIYXJy
eS5XZW50bGFuZEBhbWQuY29tPjsgTGluLCBXYXluZSA8V2F5bmUuTGluQGFtZC5jb20+DQo+IENj
OiBseXVkZUByZWRoYXQuY29tOyBpbXJlLmRlYWtAaW50ZWwuY29tOyBMZW9uIFdlacOfIDxsZW9u
LndlaXNzQHJ1aHItdW5pLQ0KPiBib2NodW0uZGU+OyBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL21zdDogRml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdA0KPiBkcm1f
ZHBfYWRkX3BheWxvYWRfcGFydDINCj4NCj4gT24gNS85LzIwMjQgMDc6NDMsIExpbnV4IHJlZ3Jl
c3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExlZW1odWlzKSB3cm90ZToNCj4gPiBPbiAxOC4wNC4y
NCAyMTo0MywgSGFycnkgV2VudGxhbmQgd3JvdGU6DQo+ID4+IE9uIDIwMjQtMDMtMDcgMDE6Mjks
IFdheW5lIExpbiB3cm90ZToNCj4gPj4+IFtXaHldDQo+ID4+PiBDb21taXQ6DQo+ID4+PiAtIGNv
bW1pdCA1YWExZGZjZGYwYTQgKCJkcm0vbXN0OiBSZWZhY3RvciB0aGUgZmxvdyBmb3IgcGF5bG9h
ZA0KPiA+Pj4gYWxsb2NhdGlvbi9yZW1vdmVtZW50IikgYWNjaWRlbnRseSBvdmVyd3JpdGUgdGhl
IGNvbW1pdA0KPiA+Pj4gLSBjb21taXQgNTRkMjE3NDA2YWZlICgiZHJtOiB1c2UgbWdyLT5kZXYg
aW4gZHJtX2RiZ19rbXMgaW4NCj4gPj4+IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0MiIpIHdoaWNo
IGNhdXNlIHJlZ3Jlc3Npb24uDQo+ID4+Pg0KPiA+Pj4gW0hvd10NCj4gPj4+IFJlY292ZXIgdGhl
IG9yaWdpbmFsIE5VTEwgZml4IGFuZCByZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGlucHV0DQo+ID4+
PiBwYXJhbWV0ZXIgJ3N0YXRlJyBmb3IgZHJtX2RwX2FkZF9wYXlsb2FkX3BhcnQyKCkuDQo+ID4+
Pg0KPiA+Pj4gRml4ZXM6IDVhYTFkZmNkZjBhNCAoImRybS9tc3Q6IFJlZmFjdG9yIHRoZSBmbG93
IGZvciBwYXlsb2FkDQo+ID4+PiBhbGxvY2F0aW9uL3JlbW92ZW1lbnQiKQ0KPiA+Pj4gUmVwb3J0
ZWQtYnk6IExlb24gV2Vpw58gPGxlb24ud2Vpc3NAcnVoci11bmktYm9jaHVtLmRlPg0KPiA+Pj4g
TGluazoNCj4gPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMzhjMjUzZWE0MjA3MmNjODI1
ZGM5NjlhYzRlNmI5YjYwMDM3MWNjOC5jDQo+ID4+PiBhbWVsQHJ1aHItdW5pLWJvY2h1bS5kZS8N
Cj4gPj4+IENjOiBseXVkZUByZWRoYXQuY29tDQo+ID4+PiBDYzogaW1yZS5kZWFrQGludGVsLmNv
bQ0KPiA+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4+IENjOiByZWdyZXNzaW9u
c0BsaXN0cy5saW51eC5kZXYNCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdheW5lIExpbiA8V2F5bmUu
TGluQGFtZC5jb20+DQo+ID4+DQo+ID4+IEkgaGF2ZW4ndCBiZWVuIGRlZXAgaW4gTVNUIGNvZGUg
aW4gYSB3aGlsZSBidXQgdGhpcyBhbGwgbG9va3MgcHJldHR5DQo+ID4+IHN0cmFpZ2h0Zm9yd2Fy
ZCBhbmQgZ29vZC4NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPg0KPiA+DQo+ID4gSG1tbSwgdGhhdCB3YXMgdGhyZWUgd2Vla3Mg
YWdvLCBidXQgaXQgc2VlbXMgc2luY2UgdGhlbiBub3RoaW5nDQo+ID4gaGFwcGVuZWQgdG8gZml4
IHRoZSBsaW5rZWQgcmVncmVzc2lvbiB0aHJvdWdoIHRoaXMgb3Igc29tZSBvdGhlcg0KPiA+IHBh
dGNoLiBJcyB0aGVyZSBhIHJlYXNvbj8gVGhlIGJ1aWxkIGZhaWx1cmUgcmVwb3J0IGZyb20gdGhl
IENJIG1heWJlPw0KPg0KPiBJdCB0b3VjaGVzIGZpbGVzIG91dHNpZGUgb2YgYW1kIGJ1dCBvbmx5
IGhhcyBhbiBhY2sgZnJvbSBBTUQuICBJIHRoaW5rIHdlDQo+IC9wcm9iYWJseS8gd2FudCBhbiBh
Y2sgZnJvbSBpOTE1IGFuZCBub3V2ZWF1IHRvIHRha2UgaXQgdGhyb3VnaC4NCg0KVGhhbmtzLCBN
YXJpbyENCg0KSGkgVGhvcnN0ZW4sDQpZZWFoLCBsaWtlIHdoYXQgTWFyaW8gc2FpZC4gV291bGQg
YWxzbyBsaWtlIHRvIGhhdmUgYWNrIGZyb20gaTkxNSBhbmQgbm91dmVhdS4NCg0KPg0KPiA+DQo+
ID4gV2F5bmUgTGluLCBkbyB5b3Uga25vdyB3aGF0J3MgdXA/DQo+ID4NCj4gPiBDaWFvLCBUaG9y
c3Rlbg0KPiA+DQo+ID4+PiAtLS0NCj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIHwgMiArLQ0KPiA+Pj4gICBkcml2ZXJzL2dw
dS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgICAgICAgICAgICAgfCA0ICstLS0N
Cj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyAgICAg
ICAgICAgICAgIHwgMiArLQ0KPiA+Pj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMgICAgICAgICAgICAgICAgICAgfCAyICstDQo+ID4+PiAgIGluY2x1ZGUvZHJtL2Rp
c3BsYXkvZHJtX2RwX21zdF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICB8IDEgLQ0KPiA+Pj4g
ICA1IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPj4+
DQo+ID4+PiBkaWZmIC0tZ2l0DQo+ID4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMNCj4gPj4+IGluZGV4IGMyNzA2
MzMwNWExMy4uMmMzNmYzZDAwY2EyIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jDQo+ID4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMN
Cj4gPj4+IEBAIC0zNjMsNyArMzYzLDcgQEAgdm9pZCBkbV9oZWxwZXJzX2RwX21zdF9zZW5kX3Bh
eWxvYWRfYWxsb2NhdGlvbigNCj4gPj4+ICAgICAgICAgICBtc3Rfc3RhdGUgPSB0b19kcm1fZHBf
bXN0X3RvcG9sb2d5X3N0YXRlKG1zdF9tZ3ItPmJhc2Uuc3RhdGUpOw0KPiA+Pj4gICAgICAgICAg
IG5ld19wYXlsb2FkID0gZHJtX2F0b21pY19nZXRfbXN0X3BheWxvYWRfc3RhdGUobXN0X3N0YXRl
LA0KPiA+Pj4gYWNvbm5lY3Rvci0+bXN0X291dHB1dF9wb3J0KTsNCj4gPj4+DQo+ID4+PiAtIHJl
dCA9IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0Mihtc3RfbWdyLCBtc3Rfc3RhdGUtPmJhc2Uuc3Rh
dGUsDQo+IG5ld19wYXlsb2FkKTsNCj4gPj4+ICsgcmV0ID0gZHJtX2RwX2FkZF9wYXlsb2FkX3Bh
cnQyKG1zdF9tZ3IsIG5ld19wYXlsb2FkKTsNCj4gPj4+DQo+ID4+PiAgICAgICAgICAgaWYgKHJl
dCkgew0KPiA+Pj4gICAgICAgICAgICAgICAgICAgYW1kZ3B1X2RtX3NldF9tc3Rfc3RhdHVzKCZh
Y29ubmVjdG9yLT5tc3Rfc3RhdHVzLA0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPj4+IGluZGV4IDAzZDUyODIwOTQyNi4u
OTVmZDE4ZjI0ZTk0IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkv
ZHJtX2RwX21zdF90b3BvbG9neS5jDQo+ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxh
eS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPj4+IEBAIC0zNDIxLDcgKzM0MjEsNiBAQA0KPiBF
WFBPUlRfU1lNQk9MKGRybV9kcF9yZW1vdmVfcGF5bG9hZF9wYXJ0Mik7DQo+ID4+PiAgIC8qKg0K
PiA+Pj4gICAgKiBkcm1fZHBfYWRkX3BheWxvYWRfcGFydDIoKSAtIEV4ZWN1dGUgcGF5bG9hZCB1
cGRhdGUgcGFydCAyDQo+ID4+PiAgICAqIEBtZ3I6IE1hbmFnZXIgdG8gdXNlLg0KPiA+Pj4gLSAq
IEBzdGF0ZTogVGhlIGdsb2JhbCBhdG9taWMgc3RhdGUNCj4gPj4+ICAgICogQHBheWxvYWQ6IFRo
ZSBwYXlsb2FkIHRvIHVwZGF0ZQ0KPiA+Pj4gICAgKg0KPiA+Pj4gICAgKiBJZiBAcGF5bG9hZCB3
YXMgc3VjY2Vzc2Z1bGx5IGFzc2lnbmVkIGEgc3RhcnRpbmcgdGltZSBzbG90IGJ5DQo+ID4+PiBk
cm1fZHBfYWRkX3BheWxvYWRfcGFydDEoKSwgdGhpcyBAQCAtMzQzMCwxNCArMzQyOSwxMyBAQA0K
PiBFWFBPUlRfU1lNQk9MKGRybV9kcF9yZW1vdmVfcGF5bG9hZF9wYXJ0Mik7DQo+ID4+PiAgICAq
IFJldHVybnM6IDAgb24gc3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0K
PiA+Pj4gICAgKi8NCj4gPj4+ICAgaW50IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0MihzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwNCj4gPj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X2F0b21pY19wYXlsb2FkICpwYXlsb2Fk
KQ0KPiA+Pj4gICB7DQo+ID4+PiAgICAgICAgICAgaW50IHJldCA9IDA7DQo+ID4+Pg0KPiA+Pj4g
ICAgICAgICAgIC8qIFNraXAgZmFpbGVkIHBheWxvYWRzICovDQo+ID4+PiAgICAgICAgICAgaWYg
KHBheWxvYWQtPnBheWxvYWRfYWxsb2NhdGlvbl9zdGF0dXMgIT0NCj4gRFJNX0RQX01TVF9QQVlM
T0FEX0FMTE9DQVRJT05fREZQKSB7DQo+ID4+PiAtICAgICAgICAgZHJtX2RiZ19rbXMoc3RhdGUt
PmRldiwgIlBhcnQgMSBvZiBwYXlsb2FkIGNyZWF0aW9uIGZvciAlcw0KPiBmYWlsZWQsIHNraXBw
aW5nIHBhcnQgMlxuIiwNCj4gPj4+ICsgICAgICAgICBkcm1fZGJnX2ttcyhtZ3ItPmRldiwgIlBh
cnQgMSBvZiBwYXlsb2FkIGNyZWF0aW9uIGZvciAlcw0KPiBmYWlsZWQsDQo+ID4+PiArc2tpcHBp
bmcgcGFydCAyXG4iLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGF5bG9h
ZC0+cG9ydC0+Y29ubmVjdG9yLT5uYW1lKTsNCj4gPj4+ICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRUlPOw0KPiA+Pj4gICAgICAgICAgIH0NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+ID4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMNCj4gPj4+IGluZGV4IDUzYWVjMDIzY2U5Mi4u
MmZiYTY2YWVjMDM4IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcF9tc3QuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcF9tc3QuYw0KPiA+Pj4gQEAgLTExNjAsNyArMTE2MCw3IEBAIHN0YXRpYyB2
b2lkIGludGVsX21zdF9lbmFibGVfZHAoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3Rh
dGUsDQo+ID4+PiAgICAgICAgICAgaWYgKGZpcnN0X21zdF9zdHJlYW0pDQo+ID4+PiAgICAgICAg
ICAgICAgICAgICBpbnRlbF9kZGlfd2FpdF9mb3JfZmVjX3N0YXR1cyhlbmNvZGVyLCBwaXBlX2Nv
bmZpZywgdHJ1ZSk7DQo+ID4+Pg0KPiA+Pj4gLSBkcm1fZHBfYWRkX3BheWxvYWRfcGFydDIoJmlu
dGVsX2RwLT5tc3RfbWdyLCAmc3RhdGUtPmJhc2UsDQo+ID4+PiArIGRybV9kcF9hZGRfcGF5bG9h
ZF9wYXJ0MigmaW50ZWxfZHAtPm1zdF9tZ3IsDQo+ID4+Pg0KPiBkcm1fYXRvbWljX2dldF9tc3Rf
cGF5bG9hZF9zdGF0ZShtc3Rfc3RhdGUsDQo+ID4+PiBjb25uZWN0b3ItPnBvcnQpKTsNCj4gPj4+
DQo+ID4+PiAgICAgICAgICAgaWYgKERJU1BMQVlfVkVSKGRldl9wcml2KSA+PSAxMikNCj4gPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMNCj4g
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jDQo+ID4+PiBpbmRl
eCAwYzNkODhhZDBiMGUuLjg4NzI4YTBiMmMyNSAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jDQo+ID4+PiBAQCAtOTE1LDcgKzkxNSw3IEBAIG52
NTBfbXN0b19jbGVhbnVwKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPj4+ICAg
ICAgICAgICAgICAgICAgIG1zdG8tPmRpc2FibGVkID0gZmFsc2U7DQo+ID4+PiAgICAgICAgICAg
ICAgICAgICBkcm1fZHBfcmVtb3ZlX3BheWxvYWRfcGFydDIobWdyLCBuZXdfbXN0X3N0YXRlLA0K
PiBvbGRfcGF5bG9hZCwgbmV3X3BheWxvYWQpOw0KPiA+Pj4gICAgICAgICAgIH0gZWxzZSBpZiAo
bXN0by0+ZW5hYmxlZCkgew0KPiA+Pj4gLSAgICAgICAgIGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0
MihtZ3IsIHN0YXRlLCBuZXdfcGF5bG9hZCk7DQo+ID4+PiArICAgICAgICAgZHJtX2RwX2FkZF9w
YXlsb2FkX3BhcnQyKG1nciwgbmV3X3BheWxvYWQpOw0KPiA+Pj4gICAgICAgICAgICAgICAgICAg
bXN0by0+ZW5hYmxlZCA9IGZhbHNlOw0KPiA+Pj4gICAgICAgICAgIH0NCj4gPj4+ICAgfQ0KPiA+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF9oZWxwZXIuaA0K
PiA+Pj4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9tc3RfaGVscGVyLmgNCj4gPj4+IGlu
ZGV4IDliMTlkOGJkNTIwYS4uNmM5MTQ1YWJjN2UyIDEwMDY0NA0KPiA+Pj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X2hlbHBlci5oDQo+ID4+PiArKysgYi9pbmNsdWRlL2Ry
bS9kaXNwbGF5L2RybV9kcF9tc3RfaGVscGVyLmgNCj4gPj4+IEBAIC04NTEsNyArODUxLDYgQEAg
aW50IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0MShzdHJ1Y3QNCj4gZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1nciwNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlLA0KPiA+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X2F0b21pY19wYXlsb2FkICpwYXls
b2FkKTsNCj4gPj4+ICAgaW50IGRybV9kcF9hZGRfcGF5bG9hZF9wYXJ0MihzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwNCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X2F0b21pY19wYXlsb2FkICpwYXlsb2FkKTsNCj4g
Pj4+ICAgdm9pZCBkcm1fZHBfcmVtb3ZlX3BheWxvYWRfcGFydDEoc3RydWN0IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyDQo+ICptZ3IsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlICptc3Rfc3RhdGUsDQo+ID4+
DQo+ID4+DQo+ID4+DQo+ID4NCi0tLQ0KUmVnYXJkcywNCldheW5lIExpbg0K
