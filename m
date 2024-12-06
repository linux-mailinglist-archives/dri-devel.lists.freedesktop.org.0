Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355F9E77A4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B4410F146;
	Fri,  6 Dec 2024 17:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="sI/F+gQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906010F146
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKanBxTRN4X6J+WMTlZQ0A+EKoJ0ozYLotDziq+OzEHS0tbZAAXJM3MWZ/X5F+FbomIOUJfS1Fx3tTq0f9rikBzXhYyr/zQoHBO+gcIFBg4XFn2tTGLUPl0exbD5X7e7PFC84fSMHT1pfWscxXg8JGhpoCoUSmGH4xrDm6HFQehePXWQWdTd5s6ydR9RK+Ot65ASEbCbbMKpx4VGwtcQJtCBPCY4cD+gWYz6fooCYapp8CAbyvNN1zemSXqeiGuqa7dWhB4uq90wnnrN49y8c50WFNNkO/mABQbxHkcfPBsrlvqGxvg1DzWb4wg3pZPs6bZOgU5a74fnhTKouWxXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbVUNF9gLwzsSanJbSJ/LeYvrzfVRzGogL+Fc9mo1UY=;
 b=U3RGAEUNGdVcgwJqOCGo7Tcf3sJZ2Z5WjVT/+Y6dk/89q6O0Mb8YqFEint1j8y97+CDtzVNFtglzP6Peb9BjB36Ka6xEpJjXLusvTqzwZMXmzlTKEt4qDCUJ+CXkYfumt6yhHTK6pQEvab2wed1ffw9gkIkra8iSeT+6FPmjLicMaFKlJwGXCxQ1RNs3weDQ1Ap68CJ6WRiBJTI5QEK1O6txatkXBICS6setwLpRvce6NgNfdFXpW823MukU8DB6vFs6yJ7mPfabkZkJO9XFW3Kx9/t6v0Rt9wmWasdm9hDzkpFLvSL54yFVWy6TBlJGXaO1tJ2rz6A45qE9i6236A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbVUNF9gLwzsSanJbSJ/LeYvrzfVRzGogL+Fc9mo1UY=;
 b=sI/F+gQOUk4ysI4pIvW1av/gyr6UgA99QZVHfkijkPcXzIzbVl6wl/Y3tHqk41LQT5WW7vs3RVY38pCERdQAaqPk1Z8uP+je95O9Ve8eQANJEMFUWJKaJELCYPFD8zVyqduIGcTWYi6IuEl2v0/GW3ojbathC0LVCf9nfg3whuNncTMnOs7SWRLv0P/+yQ2MmAsdMrYj3em8D80QVx+8Vdv8OmDv0fXvFONx5y+Lo5X00BItUzIdzIl66NaMZkytGdvjL1INJ4nLMic8jzCEviL/woTx02xn9xS8ctInFhJI0J3BK+Ht0ReEOEDjTkPHgGiXEDqeardiVEyQYzwyKw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB8696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.8; Fri, 6 Dec
 2024 17:44:15 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%6]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 17:44:15 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "dmurphy@ti.com"
 <dmurphy@ti.com>, "lee@kernel.org" <lee@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "danielt@kernel.org"
 <danielt@kernel.org>, "linux-leds@vger.kernel.org"
 <linux-leds@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "afd@ti.com" <afd@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Topic: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Thread-Index: AQHbSAGBEMaUwfNdP0eL2sDtSNwXIbLZdIYAgAAIYYA=
Date: Fri, 6 Dec 2024 17:44:15 +0000
Message-ID: <bea002a5838181ad5d8e1588643110ecb7c9674d.camel@siemens.com>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
 <20241206-brim-talcum-f5e8c504c572@spud>
In-Reply-To: <20241206-brim-talcum-f5e8c504c572@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB8696:EE_
x-ms-office365-filtering-correlation-id: 54228108-569b-44a7-e3cf-08dd161d9a0c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RXFqTDk3TWVVNDdCV1hobDlNMVhsWlE1R1l1ZzZLNExTcFBuRzFobFZuTEV0?=
 =?utf-8?B?YXNuWnYxTXhhMW56bGVKdDBjOXlxZTBKVzBwMWRBdEl4MGVMWTRLWis4Wmlx?=
 =?utf-8?B?QUp1NHRmMVFUS2NldmkwdXQ4VlN2TldJWVNnbGhYNW9sVG9FaTZMckUyYmF0?=
 =?utf-8?B?ejAxM2NhTmxUSzdFVWNxQm5GYU41OFhHVFowSDJlWWp3b2Y1bWhTVUowOHhm?=
 =?utf-8?B?SERnbGNHMjY5NkM0Y0F6YXNHdjRiSGZGQ3ViNW9aMjdYcjJRa3ZUaGlDQitS?=
 =?utf-8?B?ZHl5L0xvOFVyekhNQkhlR2FDSjhaSlJUZ3FXRWhUSEJJallBZWVCVXltT1lr?=
 =?utf-8?B?Y1VSQmdkUWNIU29sMjR6Z2tTcGFxbWhKWGpVeXljWEpTaDhyenRsa25aVTBS?=
 =?utf-8?B?UGIxS29jakVkZHludG1yaDd1TzVBeExxOUlhOUVudGs0cFVjcERZck1jdlJX?=
 =?utf-8?B?cUZORTZlaHdEc2Nvcit2cXY2dllhdDVGOGR6Nkw2c1Q0VE5iSHdwWGYzbWpN?=
 =?utf-8?B?akhjVlFyUFhXQW1iUlFWY1pHVWo1QnVLOG9mR2Z0Vys0VXhrUlk5K3JrL2Mv?=
 =?utf-8?B?ay9wODRXazlnNnFhM1JMd0hZbGQ2NW8yTllGazRkOC80OExPWmEyYkxkZnlK?=
 =?utf-8?B?SmcwSVFrV1gvbWxueCtEc2tIcWpNMXlyRlRiT2RCWTB3VCswM2ZTdElFcTZ0?=
 =?utf-8?B?MG9jZExBTDV3SnhGd3RIbEhVU0ZrbmlVejYvSmFnQkFvUmtYNmRNdTkxQ1Iy?=
 =?utf-8?B?ZU1Mc1RlNk5GODdHVlhxci9CcnBpaWYyN1dRcnpUUDFWd1VWL2dRYXNXSjBK?=
 =?utf-8?B?dmhvR2NxeHU2TDVjRHlEdW44d09MSHZ6elJOZ1VzcUQvMVUwREFHS2M5OFkw?=
 =?utf-8?B?U1NucHpMcmZ2cXB0ZHFMcXJPTFZYVEpUMGpPdmNJN2hlaUxCeUZnYk1TWTVP?=
 =?utf-8?B?R2o4MnRrOWJhT2tXQkVnKzZ4bEpQQTdEYVgycWhqajlnc0ZuZExkMU5YQVlK?=
 =?utf-8?B?aiszMURVbnZkR0NBR0ZjRTU2SWVwZkt4RU9udWFxaHFBQUsrSk5aMEE3VEp3?=
 =?utf-8?B?ZkNTTWc2VUlnOFRmblhpV3JYcmN3Z094RHFrU3J4M2t3RThQcXdUVXhjK2hR?=
 =?utf-8?B?TWNqaFN0a2NGOXk0UFU5Mys5SHBOMWRUVjhZK1NlREh2cVp3eVlWeDNIZ1pG?=
 =?utf-8?B?QVNrSkFWVDhBclJvdkpLaUF1a243TWQrMHg3ckxNU0QxRS91TEVTQ2E4VXBm?=
 =?utf-8?B?TUJWbUpWUE1ZM2JpMTlkTy95eDlxdVl2OWpqNWpKTUhZSHlHM2FJUjRWdnor?=
 =?utf-8?B?M2Y5ZkY2SGg3R3dtSUZHQ1Q4NzFod0xZTitNK0Ixam1yakpPdU01Q2J0V2xU?=
 =?utf-8?B?dU9qRmtBWWxBT2FsNy9yY3BGWUVPU3k0S1JmT0p2ZnBOVFlCMHBYQmNaT25v?=
 =?utf-8?B?cUVpTE1kcmg4cC90aWM2dW92RFNyNk9GYXQvWU0za3VXR1l2T3FPbyt3SEd3?=
 =?utf-8?B?UzIwc0xKNHdZUEpLU1BDSkUyM0haOVhKOVJnUmIvcjBJUU9Pa095blRYT1RP?=
 =?utf-8?B?bzBIbDFqb0N0dkNtd3VMenB0SXhtWlRBaEVlQVRFTE5pUkZhMlZoTkZtNlpt?=
 =?utf-8?B?Rm9uaUFyS29FaEFRYytyT2QrUklEbGRGOVR5SmdMVCt6LzYzUEFBWGNXdWlP?=
 =?utf-8?B?UG9VSEg5b3ExTlZONDRUK0dYcmhyd2dsMGtmZnFvYVVDMXdmc21EdmxnV0tu?=
 =?utf-8?B?RUcrQzhwTkVqbnRaQVB6TU9zeVdqSlo2bXBKUEp0d0tobWt2VGhHZWFIUnEw?=
 =?utf-8?Q?l+wQAynPGUOK8PiFiyXiDp9fEkihh5TvTnIyg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2UrT1ZNWGU5Vms0dDgxTE8zZ2hGejhydTIyNEE4Vm03aHJ0YjhjZTdFWGhD?=
 =?utf-8?B?S3R4MVByZ1hrK3RneU9qOCsyUGxqc1BobGFzb0w3bDBKRXdnak1vRDdDcTZR?=
 =?utf-8?B?cW15cy9QK1lnVjhyc29ickxHRi9NQjZGWjN5Zjk4dlQ2WEd3eUhTS3BoeGNF?=
 =?utf-8?B?TWR6cFV5bUlobVJianYzRUU1S1RIMlhBaEpsaHMzU3RPUy9iY0s1aTRZTXZ2?=
 =?utf-8?B?Y2YxTERaaEg3bGVnUEhjRVphcFdnNnF1ZlBSeHVlN2w3eTBJbmpJU1NvMXU2?=
 =?utf-8?B?UVFqNjEvR2cxZ2g0dnJ2empyM2trekNvVFVJOGlwRmZzMFRvTHovUlg4WmdH?=
 =?utf-8?B?ZTV2Y1lTRGNGUjZkQUV5ZDBleC9nS2lqR2J2YmdLL1ZLWXQ1dzh6Zmo1aVFy?=
 =?utf-8?B?TlBwVnVpcmZOSktCc0xOY2Y3Tm0rSkUyQzg3NHZJSkprMmxKbDhpbHlqZW5Z?=
 =?utf-8?B?b3RXelVTQ0FtWXVvVld0TExVaXo5dGlMczlVTFhta3hxNEZST0gyemhvUHRX?=
 =?utf-8?B?dDR4VVdUalMwQ0tJOHYvcytnaXptV1IxRlJuR3NkRXNsTGhnak1aOG1vUXg2?=
 =?utf-8?B?UVpwMytTNzNRNUJhVkZKcFRVK3lrYUVOL3VVeDhSajFNdE4wWVRDQjNVZFAy?=
 =?utf-8?B?SStWS3Bncjd2S1dvVDJiNDJhTnRnSVBBUVRxN3BpZ2ltWFZGZDk1c2tjanZv?=
 =?utf-8?B?T2VlcHlIanNHRndJT0RDUHRLREZQcDhjRVBaUFArdUxYUVZ5bUk1enZQczha?=
 =?utf-8?B?QzlEQTJDNFVZOU0wWFdOT3Q4bXhNSGRIOStwSGdxSm00QUx3Vkw5RXVOcXFR?=
 =?utf-8?B?OWJHRlhaeis1bGVPa3RyN05ieWV1STNnazhtZkorYXdYNjR1Z0tlc3pVZTgx?=
 =?utf-8?B?b2Z1RE1zaEJHOUt4a1krL2wvaW5WdXNabVRKMTA2MXhMRXpFS0NCT3pEU1hO?=
 =?utf-8?B?MzBVU1Boc0JyVDc4MWd4Z0w3TnNsWDR0cDliV0JvYVFKQTluR1JoMWxUOGU1?=
 =?utf-8?B?eWQzTTE5NWc2L2tkL1F3RUFFNExmRWhlUWlFdjNCNllwRGVSbnoyOUo3WVRV?=
 =?utf-8?B?Uy8xcXA4MFhGSk54aTh4S2RTbUpyMlZEM2VleUVRdHIvM0xZaVMraTZaYVN4?=
 =?utf-8?B?N1JleWQwRmxNTjUyZWVYSnBVQVpMZ1BBc1kvaUgxTVF0Sk9OYnc4ZFhHaENF?=
 =?utf-8?B?TEVlRmZ0QVIraStsc2NDajlYSzhFWUF0ZmFneGQyZXA0NUJMWkpyaFNrRjQ2?=
 =?utf-8?B?Z3JneHJibVp4T0NKa0hCd3hmYUd3clJGMlVhM0Rvb2kzY0QyZVROUWcwU3d4?=
 =?utf-8?B?V1NvVkZQcmRjZjhMZE9yeTloN3drbEhaeHN5MWV3SkdtY0grekVzWU1tRHc1?=
 =?utf-8?B?ZWxDZUZjVkRKZ1IyMm1Ca1NNdWJTSjdyQjlZcDlhU2RXT0kxSFlPZndQREwx?=
 =?utf-8?B?U2xiSFh6ZEdiUnRjNFN0c05HNEJPRXlFa1d1TUFvNzZISEs2ZVVCTGJpejVR?=
 =?utf-8?B?RUEyODVZcDNSMGUyM0hobUhsOVVtVjRtL1M3dERsSmRMbnU5eDJLM0hVS1dj?=
 =?utf-8?B?Ymp5dnNPYzFSd096VjYrU0hzSS9LSWpUYXFSclFJb1pQUFZnZUZQcFlyM1hY?=
 =?utf-8?B?Ukw5eWR4Ymx0VjJyTDNadEdHVDZVVEorY2FlYmtFY1FPMDZvKzB3NVhtaWtk?=
 =?utf-8?B?Z3A0UDNmM2I0U3ZJTCt3YnZjaG5lc0lWNVlkam9xY0xmZFIxdEZLWmx3RnNO?=
 =?utf-8?B?ZEg0WUtQSkY5bFZhVUFQbDA4U2JkYVZGd1Rxb1ZsZ0ozTWQ5S3creS9BTi9J?=
 =?utf-8?B?c1hGQlowMDF4U2IvUDBVbWkzNDZ4dTAxb3hYVkVIT2FRNFRmQ1Azd3JKZFQr?=
 =?utf-8?B?UStKZGZSazdsd3NPTTRPZnlYWGFPU0xoSkNtdE15N3pRaGpINTNGQUlrUFBq?=
 =?utf-8?B?Ung0WDJSRzBkRXp1Q2NnVnhOSFl2WE90OTE4Ty82UENydHdEdWxpbXYxajUv?=
 =?utf-8?B?cUVrMURtWnFnZjl5MGpCcmRJbjNZUmluR0NWV3BybmVtN29LNGFKUWIwVUFy?=
 =?utf-8?B?VGdQdDhRbjYrL2pWWHpCZlZwSk93d3VXd210aDRVRnRIUG1LaFUreVdqN0My?=
 =?utf-8?B?anhRWjBmTUNTS3pLK1J1U1gwL1lqTldXcXdPYXJVeWl5WTFBbEc0WkdDVGZ3?=
 =?utf-8?Q?4kKMmtMWom4E3iIJwXQHv+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43477A2B37CD354D925285D516B0C4C7@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54228108-569b-44a7-e3cf-08dd161d9a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 17:44:15.0622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrxE0vi8zX6Q6UA20E5sQVcTTk28cvgVQrtgiktYvM5QycQtgI/B77miHP2+9o5QmEwjHp/fy14oQIqtXJDjNB5iGBQ6VE1LfRJF9UIfEuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8696
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

SGVsbG8gQ29ub3IsDQoNCk9uIEZyaSwgMjAyNC0xMi0wNiBhdCAxNzoxNCArMDAwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOg0KPiA+IEFkZCBUZXhhcyBJbnN0cnVtZW50cycgTFA4ODY0L0xQODg2NiBi
aW5kaW5ncyBpbnRvIExQODg2MCBjb252ZXJ0aW5nIHRoZW0NCj4gPiBpbnRvIFlBTUwgZm9ybWF0
IHNpbXVsdGFuZW91c2x5LiBXaGlsZSBoZXJlLCBkcm9wIHRoZSBpbmRleCBvZiB0aGUgImxlZCIN
Cj4gPiBzdWJub2RlLCB0aGlzIG9uZSBpcyBuZWl0aGVyIHVzZWQgbm9yIG1hbmRhdGVkIGJ5IHRo
ZSBkcml2ZXJzLiBBbGwgdGhlDQo+ID4gKi1jZWxscyBwcm9wZXJ0aWVzIGFyZSB0aGVyZWZvcmUg
bm90IHJlcXVpcmVkLg0KPiANCj4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgYSBjb3JyZWN0IHRoaW5n
IHRvIGRvPyBUaGUgbHA4ODYwLXExIHByb2R1Y3QgbGluaw0KPiBjaXRlcyBpdCBhcyBiZWluZyBh
IDQtY2hhbm5lbCBkZXZpY2UuIEV2ZW4gaWYgdGhlIGtlcm5lbCBvbmx5IGV2ZXINCj4gc3VwcG9y
dHMgaXQgYXMgYSBzaW5nbGUtY2hhbm5lbCBkZXZpY2UsIHRoZSBiaW5kaW5nIHNob3VsZCByZWZs
ZWN0IHdoYXQNCj4gaXQgaXMgY2FwYWJsZSBvZiBkb2luZy4NCg0KbXkgdW5kZXJzdGFuZGluZyBp
czoNCi0gVGhlIHdob2xlIGZhbWlseSBpcyBtdWx0aS1jaGFubmVsICg0IG9yIDYpLCBidXQgdGhp
cyBpcyByYXRoZXIgdXNlZCBpbnRlcm5hbGx5DQppbiB0aGUgY2hpcCBmb3IgcG93ZXIgYmFsYW5j
aW5nOyBzZXBhcmF0ZSBkaWFnbm9zdGljcyBpcyBwcm92aWRlZC4gRnJvbSB0aGUgdXNlcg0KcGVy
c3BlY3RpdmUgb25lIGhhcyBvbmx5IG9uZSBicmlnaHRuZXNzIHBlciBjaGlwLg0KLSBUaGUgbHA4
ODYwIGRyaXZlciBkaWRuJ3QgYXR0ZW1wdCB0byBkbyBhbnl0aGluZyB3aXRoIHRoZSBpbmRleC4N
Cg0KSSdtIGdsYWQgQW5kcmV3IERhdmlzIGhhZCBhIHRpbWUgZm9yIGEgcHJlLXB1YmxpYyByZXZp
ZXcgb2YgdGhlIG5ldyBiaW5kaW5nDQphbmQgYWN0dWFsbHkgc3VnZ2VzdGVkIHRoaXMgc2ltcGxp
ZmljYXRpb24uDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2ll
bWVucy5jb20NCg==
