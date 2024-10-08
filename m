Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C3993E63
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 07:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984910E45D;
	Tue,  8 Oct 2024 05:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="M/xWnZFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2B10E203
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 05:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARGUxIRKYjxgUHGs7NMTZZLuv7GUcsxHBFTHBt8yYFX4KkJiEM6BXOyXrh+5kaN3mHezC/+GHTqNAZL9l58tueQknmdX6Yrkzc/16mUfQraU+SmCEYQCNFPwTz8Byct5ACpxbuEP/hHruBCzgDrGJD3WnJiKrLoq6q9ieuNddE31d3IYt2siwe48PB+cjHhKcg+mXKxQv6BYdaN0HDtqHNXIAaqqMh847kCygziw1WsoO7pR4r6EPpqbXU/h2k72VDcpKWkzSJOAK9skd7ryPjYho6mVS6yHx89QLMTHWuQThxhEqG0Wwv7UXWYSmhckOXw50y6xuJfyqs+aW2Hzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTu9BTiiwFnw//4n4BklJyMLe63pE2DKX2RWcfwsO5k=;
 b=qvavkbWG1CyDnqvuRMIFzDcOLcfCSXGHZnELsbGb12TxcsXtfDAsG9W/0q06BOYDzMn2YhzoLPjrR3rrnIf28bAPTtfzGO4+YEZWmVopvngm6BROEQxaPGKF1avp4lTUwpoGLNGi6qkp7CfKF9Srk332er9ACfmqZ11HMW+z/uTSw3XdJ4e0lmGc8phP1ViYMNyXzz0IPf57oVdVZmunSuo9bo0AVzZJ+BKbrfep3cRgrG8ajrPDYDvovTvT3z3YD9xURJSiTMOS2TWLoE0sdmyTGgetv9cY4vnnl544HQGT1LA7Q6mSoOtNPqOU37rJWMw5/AFwlZubxA3ik+ycgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTu9BTiiwFnw//4n4BklJyMLe63pE2DKX2RWcfwsO5k=;
 b=M/xWnZFsM5kvFNwfITptBc85NnOU3Kik3BnG6fMlP5Wrzdl8OW/QLeg8hrx4Q/X4i1REnh1aRtasdn1PIio9LbImZILbxOYkQLf+6O/1cAl1oAUmcNd6+YO1HdFC5tWQowxoScprQfVSwRczJw014Tx2/xvFzBjX06iJZgoMvOGZ1vvSVCphiWiW3HCvcbZPRu+OTSrOfa1bJiG9x6mCBnel3//PRLeCtb+iYqFfn5EzYyjY6JBm+YiPRp1MDpgMfy0mKO0SGpw62LDqwfqWO4KwaUIHzTGNG6VTOmA/wb8W+FsWCAFBiEK8ItYxPtoAawmyA7UKdObEMrdngLRUPA==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 05:38:21 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 05:38:14 +0000
From: <Manikandan.M@microchip.com>
To: <advaitdhamorikar@gmail.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <anupnewsmail@gmail.com>, <lkp@intel.com>, <error27@gmail.com>
Subject: Re: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
Thread-Topic: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
Thread-Index: AQHbGMrnPh7ADRINx0aup/NKvJIy0rJ8VvEA
Date: Tue, 8 Oct 2024 05:38:14 +0000
Message-ID: <a3f22647-fef3-45d1-b8b7-52b0a988d0b3@microchip.com>
References: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
In-Reply-To: <20241007150904.9840-1-advaitdhamorikar@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SA0PR11MB4669:EE_
x-ms-office365-filtering-correlation-id: 7f0133b1-8239-450e-aa7c-08dce75b679e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?TFdHamRSK25RZmpadmFIaDdUbmxxcUtvSzRydm84UTM3bW5RcVNHL3FjdXNo?=
 =?utf-8?B?c0piTytJRjFmd2s1dVozR3JVOERrZkJ4RHQ4R0RTZnBBNDY5TExsZEV4bG1x?=
 =?utf-8?B?emczdnd1QjFwamhQMFhNV1gvQmVSNjUzVEpZMmxLeU0wd0Frc24zMmY3Tk1r?=
 =?utf-8?B?Mml5L2phU253cE05MXBQeEtWczhqSGxicFN5RHRjdld4cU5jaEVEcVJPdVNR?=
 =?utf-8?B?NFIvZmY2aDFxSVo2OW4vT3k1c29SMjZ5T2Q3aElPbFZRV2pJdUpFZ1ZaMkVz?=
 =?utf-8?B?dnpKWTRJQmhEVkQyc0NHd3pkcDVyOFArQ1BodWt5NlB4Uy9MWk9mamk5cUk1?=
 =?utf-8?B?ck9BNzNyaVVUNlNpNk5FWnFpRDc5cjRzMS9GRWI3UVJOM0NNS2Yyc3IzeXFt?=
 =?utf-8?B?M2dzQXZGQXdhL2hLMHAwKzhkbWNMOEMrV1NVMFllKzEvcklrZmdibWl0YlJl?=
 =?utf-8?B?OWtqMUthbTdNeUQwUzhoVnFzR0FiTDh6R0ozWGJUVStKMEl4cWNaSmc0UWh0?=
 =?utf-8?B?OWlDU2dLYnNtTk91Qjk0cmNCcVRDM3NENkVVNDRDTFpMUTZTTGxjYjBBUklW?=
 =?utf-8?B?aFRtNThPTW1qZExpMlJOcW1BeEVoakhRWGtQVm9Sd2hyaVAzMVNuZXpXQ2x1?=
 =?utf-8?B?WWtiZUw2VTNsT2ttaUQ0Wm9OVkJTODNmM1hzREQrbVB1ZlNBRVoyVmcrSnlO?=
 =?utf-8?B?UE5UM2k5Z3lyQ2ZtNTl2UGRmaG9KblBuUmVuNG10VkFOSnJ1U2ZZRnk1YmZj?=
 =?utf-8?B?NU9EcjhrVU54MllWZXdjUThmanJTcDlIaVY5eW9LVDV3Z0VrSlROYzNnMWZt?=
 =?utf-8?B?dzloS2dhdXR2VzY0QzJuQ3BPb0NhVVlFanJPelArbE9nZ3dVSEZCNE1FQnQx?=
 =?utf-8?B?TVU1SncwYmliaWo4S285ejZBRHpFRWlab2pMWE1LTkViMW44WE9zRGNrOHlw?=
 =?utf-8?B?bjVIL2hBSWtVUXBtVzRRNks1YlREamVpYUI3SHk5QjZ6K2J0MndkcWRxQitG?=
 =?utf-8?B?N1FjdDN4aEJ3ZGUyWEVXenMxQXNwakhGUjltdDdlelVpWXZQVnkyQkRoc29k?=
 =?utf-8?B?NTBJZjY5MkxoRG9zL0haeHVxaHdGcXVSVHhvREl5bzBURlFyeFFaMEk1SlRK?=
 =?utf-8?B?Y2Y3eHpmQ3d0ODJSL2xwRmlGVUxBYlVFM3h2WkpIL1NUdVBEbUlUbHZTYzds?=
 =?utf-8?B?RmtNOFZzMFFBdGRqQzI1NkhTQVRhVnh5a0VUL1ZEbFlNbDdpUSt0WGVFa2NN?=
 =?utf-8?B?MlF0a25mb2JYcktjZldqYjUxSC92WTcwRFdTUE5aUmZVeGhGV3RGTDQvOGRh?=
 =?utf-8?B?Ly82WGdXUy9xc1pjOVJtN0J2RkxuZHVpenE2Y0xCOEdtMVAxTjZ4NGZkZFJs?=
 =?utf-8?B?cHRLOGwyb3dFN2Q4QzJabisrWGJScDdjMVAyYUp6ZFZTUUZXV1ZzTFdzdmdL?=
 =?utf-8?B?VUN4MnpqNGRib1lxaTlhN2hSOFpwUEFlVER6ZkxyaC93cE1CVW1LZmhBU0lL?=
 =?utf-8?B?TlFoWUhmb3l4em55bW1zbnh2L0xMOUNsbTIvMGNCTWxBMkg3UURVSEJjUlFW?=
 =?utf-8?B?T3JXQStpbGswaVdzWlY0bExCOEIwL2FtYktqQ2VHR3ZsYVBRb0pmVi9wY2ZH?=
 =?utf-8?B?Tnk1SDZ0MFNZSEM0MjIyV0drRGRlU1NJeCtxUi9LY2JGWi9QNEFqUGhGVjky?=
 =?utf-8?B?eXFneEZhc01TR1JQeWEzdTZWdlpsSHZQTFFYRDVCdlc2WkdkMG5PWTRYUzd3?=
 =?utf-8?B?RFZWWDNhM0Y0aUs0K2dBRkpOQWY0U3JuZnNnVVMySjJ2b1N1VER0UktNRnFP?=
 =?utf-8?Q?OgFv7V/9JnXL07vcZ3X8NJJOqzZ6osFaSnyHk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFhQcG1sQjhyS1ltWS9tSUlDTU9qZlBoYzE2THo2RFdQOHpUTkdkY1RUczIz?=
 =?utf-8?B?TllaaGJtYlZNRGYzcko5ME9iODlLUUV5WFdxVUdkbW54TUMyb3V0VnJaaExJ?=
 =?utf-8?B?ZlNyMXhDWGsrMm1uekVVWkRVY2NZSTBtNm1ZRm5ueUFhd2dESDFnZk4zY2JW?=
 =?utf-8?B?bWtEMjdLZHNXR1FDUmEwREgzY0d6VEU2a3VoUE81RmQ1U3lObjY4dzhEVlBT?=
 =?utf-8?B?V3ozK0NjMjQ1MmpybVc3UzFNTmFPcjRvS09RT09UbTJybHBXVWk5MkZiQ2Yr?=
 =?utf-8?B?aC9RTmVXb1IvOFNOODBWTUFZTUhkVGtReWRFcWJiMURvTVRmRzFobmFualI2?=
 =?utf-8?B?TDRIUStHaTRxT2xVaVpML21oaElKZ3Nha0lSQzVzWGZ0Nk5RQW9QUzRwdXA0?=
 =?utf-8?B?TnY2ZWk3TXBtaW5iNXRWYzFCeVNTV3BIVXFOc1ZPS3FFVFBNaWJ4WEJDMWVv?=
 =?utf-8?B?MWV4MzFHc1ZRV3dsVkRtRXluUVlGempGNEVuaHZ2eWgxTkxpeXVXTGhxSkU1?=
 =?utf-8?B?dUNLdlZXRTB2Y3o0c2NPWVQvdXlzZDdtbGFoN1dOU25DVzhRUVdrRGd4b01T?=
 =?utf-8?B?MXp6d0FHYm84R3JQTzY0SXJWbjNEZ0t1SnBPcWp4YzhzSEptdXQyWEZaMmxz?=
 =?utf-8?B?ZUh6V3owYzFuT1RaeGJzQkdxWTJvRUhRenBYeTFrT3NWYXdyTHdEOHgvUGNX?=
 =?utf-8?B?bVpqS3UzQi9kTXJOcklQdWxGWmxuK3dYUldNQkxscmR1TTBnZEJ1eVRQaXZh?=
 =?utf-8?B?blZYbFdHc2d6OUpoT1hZeGZ3WmZDY0tJU2l0Nzk0aElpV1pRblpRTU1VeitT?=
 =?utf-8?B?RkRIZnhKUjNSNkNPRWlub0tqdWQrNWFMTGFLbzRuRHBrZk9ubGpuWHZYS1c2?=
 =?utf-8?B?SGM4V2h4akFDRHY5TTV1VkxTbUkzS3VKMjBCZm16VFhwc1kxOVdlM2VZQlJQ?=
 =?utf-8?B?clBsOHphMjIwbHB3dHZIYjdJc2VKNzdjZ2JENXhrTVRvbHNZLzZKNGdtck0z?=
 =?utf-8?B?NURkRGxITVBud1A4anNXUGNvWjdQc2RkRGZNdS9iTWdNRklWbHdtNWsxV3Fw?=
 =?utf-8?B?dDFTYkhtSW1meHZtVnVvTXA1d3pnT0FIeWRMYmFRNEtMc1BjQVpSeUpMSXZP?=
 =?utf-8?B?eGZVeU1rZEJzQ2Y0Ujg0L1VFdXBJK0NYcURsQUpWSGFMRGZ3bGF0NjQyVldl?=
 =?utf-8?B?cnE2NXJyNUs1R2pGREpkMXpsVWZtYjkxWDlBVW1xb1B2NnpLSWpKU1Nhc2hX?=
 =?utf-8?B?Mm1JYmR5VWtYS3Z4YVJjbEtFckwwSWVpZlpYb3MrRVhEdTlNdEs2MGhCa1dw?=
 =?utf-8?B?aXVCQnFsZmpLWG9uYkpFcjc2QkJBNm5OTlBTL0hjamlJWm9HdXlvUEhFMXd3?=
 =?utf-8?B?SDFESjlSN0U5OThVcWRsbWYvcE5ZR21EVzdYS1FzbXpLRTMybUNJWTFiTDBZ?=
 =?utf-8?B?Z2lvRWJ2TzU3OGMxbTIxb1ZGVlhNTmhFNFVyNldLRGZWUnFudjd1RTZTNWIx?=
 =?utf-8?B?dGt5endSQW5GY09ZUHhxdDVqbFROOXo0VXpvdDRSWk9OU0F1Sys3NXhSem0w?=
 =?utf-8?B?VjU2bjZ0Wmozc3dVVktlQTgyK043SUcwcFBqQ2J2TWJ3QWFrc01KOGx6ZTFZ?=
 =?utf-8?B?OCs3YkszaEJzMkdEd3ZQTnV5WWZYUWVMbm9IZStpeS9xeFF3a0VzVHU4Mm8v?=
 =?utf-8?B?bzV0WVhmZ3RIV3BVWnZscFBjUTJJNkxrNUVRcFRGZXlMS242cEdGVDlBdVZG?=
 =?utf-8?B?bXF5aE1zNlJyQVVtekVPTE1DQk5lbkpFTGkzdnhuUXBFUUJvVG1TNDd2d3NN?=
 =?utf-8?B?Yll6RFczV2dVd1FycHI3amJzR2lNa2lxYnB6Z3VEUDdRTGcxMUZCd01BWVFR?=
 =?utf-8?B?eTVLVlRDNTdBV0o1L2Z6RmZMVlduNXQ3NGt0L2tqTVF6ZDV6ZVhVVjFuakoz?=
 =?utf-8?B?bDgvVktXMGZrNTkwMnIxdTdJQm9ZUkZuUUJPNzM0SU12VW1PMG1SMlU5K005?=
 =?utf-8?B?Uk93Tkk3NXRnMGFpNXZXcXBlSEUxN2ttdmp1dUFlM0FrSjYweENENXFQZy9Q?=
 =?utf-8?B?djZUcThUaUhOb2JDOTExYjNlNGZhd2ZOdGJDQ0ladndocHEyWmEzakZkRzUz?=
 =?utf-8?Q?R5/W2xUItg2fif/a4FCIvBYyO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <151EDDB84638FD45A066ABCC92E3E55A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0133b1-8239-450e-aa7c-08dce75b679e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 05:38:14.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbNSkXd9C9jk2fPS803RlBIR+vx3r6vKm81FJ2k8IJWzVMZTCbZvgdPGNdhAnxn75HIax1YSRGwT9hhRUmxGC0JfrMmUN0lH5W91gROeD8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

T24gMDcvMTAvMjQgODozOSBwbSwgQWR2YWl0IERoYW1vcmlrYXIgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gYXRtZWxfaGxjZGNfcGxhbmVfdXBkYXRl
X2J1ZmZlcnM6IG1heSB1c2UgYW4gdW5pbml0aWFsaXplZA0KPiBzciB2YXJpYWJsZSB3aGVuIHRo
ZSBpZiBjb25kaXRpb24gcmVtYWlucyB1bnNhdGlzZmllZC4NCj4gVGhlIHZhcmlhYmxlIG1heSBj
b250YWluIGFuIGFyYml0cmFyeSB2YWx1ZSBsZWZ0IGZyb20gZWFybGllciBjb21wdXRhdGlvbnMu
DQo+IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+
IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxlcnJvcjI3QGdtYWlsLmNvbT4NCj4gQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwOTI0MDMyMC5NWlBnaTNVcC1sa3BAaW50
ZWwuY29tLw0KPiBTaWduZWQtb2ZmLWJ5OiBBZHZhaXQgRGhhbW9yaWthciA8YWR2YWl0ZGhhbW9y
aWthckBnbWFpbC5jb20+DQpSZXZpZXdlZC1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1h
bmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gdjEtPnYyOiBhZGQgcmVwb3J0ZWQg
YnkgYW5kIGNsb3NlcyBsYWJlbHMNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2Rj
L2F0bWVsX2hsY2RjX3BsYW5lLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwt
aGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYw0KPiBpbmRleCA0YTdiYTA5MThlY2EuLjQxNTBjNGQw
YjRmMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX3BsYW5lLmMNCj4gQEAgLTU1OSw3ICs1NTksNyBAQCBzdGF0aWMgdm9pZCBhdG1lbF9obGNk
Y19wbGFuZV91cGRhdGVfYnVmZmVycyhzdHJ1Y3QgYXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0K
PiAgICAgICAgICBjb25zdCBzdHJ1Y3QgYXRtZWxfaGxjZGNfbGF5ZXJfZGVzYyAqZGVzYyA9IHBs
YW5lLT5sYXllci5kZXNjOw0KPiAgICAgICAgICBzdHJ1Y3QgYXRtZWxfaGxjZGNfZGMgKmRjID0g
cGxhbmUtPmJhc2UuZGV2LT5kZXZfcHJpdmF0ZTsNCj4gICAgICAgICAgc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIgPSBzdGF0ZS0+YmFzZS5mYjsNCj4gLSAgICAgICB1MzIgc3I7DQo+ICsgICAg
ICAgdTMyIHNyID0gMDsNCj4gICAgICAgICAgaW50IGk7DQo+IA0KPiAgICAgICAgICBpZiAoIWRj
LT5kZXNjLT5pc194bGNkYykNCj4gLS0NCj4gMi4zNC4xDQo+IA0KDQotLSANClRoYW5rcyBhbmQg
UmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
