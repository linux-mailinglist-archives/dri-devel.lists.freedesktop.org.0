Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B53A2B983
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9527910EA0D;
	Fri,  7 Feb 2025 03:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="H9tilkeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CD10EA0D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVcqRGZa6YMbq+GajNRSPNygd3CFj33JxGIWaANIjadxJH1r9bhrA4pTU27Yb0cd0WrmOoetPR611Z8eI4QYaEhe1mPi9gj1Zhp/bUnUSKkirwq1VITYgsXV0pGKtczsofhdA+7O2CsT5Cmqn64WdKdBCZGukBKjlI3KueGnu9t9bAB33R5rupOnxKBiNim9rKzLlmQwb8qpTiVPKXJQq4oX5dKVfl4kMeNPzpzZpFImT/HiYQtvCciuQSodnhe9qGENOBqiAPNjV3MlzqGcKC+c+d2gAB8CpEfTlaAABjdu26TlvDs/3V5acrI5sWcG35lV6d1xLW5BtfdfGO8pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiW+b47TYn730uS63dHX90kKH6Puvi5j6e+tjUPPFyg=;
 b=Smil6MFOg2pF9vIhecgdzjLvEMx7EozTi2rHkN/HwiZXwtuGasn5xdMAJpfpSswepYeY6FmjTefZ4Qh+eUg6pkUzUMuTw6YE9hHLP3wr5+ri+6aKQPpQv1Tta/61ARNFFtm/Kq6h7wCVl6u7MTTNpv2NpdlotHb3TG1mY8fsN6OcCNctfYQADi02PsVFUl0+1SWF2ic+5vJ3Txa3/o1ehA5s+5jRkalYpXuV5OpOKGCPnJsekTu1l1td0isYonxtYtx0VQ+ZPCecGdubpHwB/T7O85bgx7RZXqLn9witg4Lm4Wo6MREB3pILwLJaJkN4eqJyImhSlnZd34tO7F+CaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiW+b47TYn730uS63dHX90kKH6Puvi5j6e+tjUPPFyg=;
 b=H9tilkeTsreML0wQeD4uIu96UTzTUYv//WMTg2600Pqv0Mt8vSM2Vr+kQ8XOrGkarMe+rMmLW5fFq0kFYBOzG4P+o5xty68zD6Z1J+j4hNDlcoVjMdzj5Ev+vY9BpXTU8yNhRrEvCtwLr+zk+wB0uGOfiiobQOaUhfKbPraJEdoIfAq/DUosbsPzEMYJCukRdeOlzjwfajPBiHMehUgTFjUJ0drNuEbK7Haa9Qx5LJaHE0ZE8UXmpE8yRZla6PbtWhiGOrPjYV0mMTpXcposf8dHS+j/AuaAokPhCDEVsKThP32qPw28/tnIxfW1pbKyF/XfIMNGP9thZM131InW3A==
Received: from SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 03:13:32 +0000
Received: from SJ0PR11MB6621.namprd11.prod.outlook.com
 ([fe80::486:371f:9149:1211]) by SJ0PR11MB6621.namprd11.prod.outlook.com
 ([fe80::486:371f:9149:1211%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 03:13:32 +0000
From: <Manikandan.M@microchip.com>
To: <mripard@kernel.org>, <oushixiong1025@163.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <andrzej.hajda@intel.com>, <airlied@gmail.com>, <Dharma.B@microchip.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <Laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <oushixiong@kylinos.cn>,
 <simona@ffwll.ch>, <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
Thread-Index: AQHbeGdDx53ybEj09UaCDl120Ssm17M6WqcAgADRGgA=
Date: Fri, 7 Feb 2025 03:13:32 +0000
Message-ID: <01cd860f-4338-480a-b3f9-f57c42e0e023@microchip.com>
References: <20250206071713.180471-1-oushixiong1025@163.com>
 <2310c2c4c9670a776090ebc81ea2aaff@kernel.org>
In-Reply-To: <2310c2c4c9670a776090ebc81ea2aaff@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6621:EE_|DM4PR11MB8129:EE_
x-ms-office365-filtering-correlation-id: e732ba65-af51-4382-119a-08dd47256701
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6621.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?L1JsWGZVV0dPRC9MYng5Um4wRHFqMW9kcWg4a2J2cTVZeUR0M2xidzRPV0N5?=
 =?utf-8?B?djBXU2Z4dFlmOWt5WC9RcDE1NzNSQUs2ZUFtWk9kc1RLTjBkNWtiejVVS1lL?=
 =?utf-8?B?OGJFUlRHUDBQZkJZMUhqTVJOSXo4UzI5VEltK0tHTXBjc3JEcktrVjkxNGox?=
 =?utf-8?B?VGFSc1M1aWI1cDA2ODJQSTNzbzNueTd4R3cvM0lnTEV6c2c1Y1RSYVJhSkNV?=
 =?utf-8?B?bXdOUWJZQmlsaXJ1QzZSYzlNQ1ZTeDhPOFBZWjJQYi9hMks4QW82RVpzclFn?=
 =?utf-8?B?TytodVNBVGw0aUQwQXdXdTF0OHlucVF0aXhkRnVtM2E3Wks3bjAzTEVobDhP?=
 =?utf-8?B?S0EyV3J0cVRpVHQ5N0lubTROelAwWE1iVm9sQXUxZnkwUVVsU2hWdzdaN3V0?=
 =?utf-8?B?K1hzeGxpeXFSVGtNU1NzUGpmNjlTTGJqSVVlMnRtYVBLN2QvSmxrblVqQmNy?=
 =?utf-8?B?OFhoR3U5U3JrKzBaRDZYZzBxRm5hRnc5WVlsOWNHS3h6QlIxZHNKSlpKVEpp?=
 =?utf-8?B?QzRGd1RBZWRQcURWcjBvSlZHemZvVkZOMXp0RlBDcyt1d1RyWmtWOWZLK1Yr?=
 =?utf-8?B?ZVpmbWozbmF3UFl2REk2OE5ZVkZhQnBHVUpQaklLc3pENHVwRUkvQW5LZm5Y?=
 =?utf-8?B?OHFYb1k3M0Z3K04yYVF1eG80V1h3aDFLRFdCQlN6UlZEcjNuZkk5NGVLMytp?=
 =?utf-8?B?dU9JL3FwTWhNd1R1Y3c0WTRpYmo5TkluTDFaei9kM2hlZDBpMDF6b3BXMzhU?=
 =?utf-8?B?Vm91UVU4bm5BWEFWbkcrL3JnVS9ha3VNWmMyZGZqQ1lpMkZ3YW9KTE5tUVJV?=
 =?utf-8?B?dkN5VzB1TG42SFJRME0yMjZ1eEFFeGc4ZWw4bUJuWXdzMHZIb1dtbGo1VDh4?=
 =?utf-8?B?NDB2ZUduUDB0dUpGT0QwRWZhc2lTektYV24vY2ljRlcxdzFyOUFLVyswUU03?=
 =?utf-8?B?RGNPTnliNXdFUDNJSVY4ZS8wVVhtY0ppcEY0S3BtNGtKUEwxY1V3M3hXWmpI?=
 =?utf-8?B?NlR2ZStkVjlXL0VnRktXNHlVMFI1SDVIZC8wYndCTlhrYXE3WkZIK3dvazF4?=
 =?utf-8?B?aEhqRXFjcVMxZGh4RWdVMEw5K000bG10TXlhTkovQjlFMEJkMWEvT2JVcFhJ?=
 =?utf-8?B?ajJDL2lHa1BoS1dlR08yZUlxV3FKZXp6Qi9ab3FvR1F2aDRNRFJoMjExekVU?=
 =?utf-8?B?RzJyWXlBM0dBNDRSUml4K05JazNCQk9IUEUzWCt3K3d2VkJPckRPdVJQdG1C?=
 =?utf-8?B?bk1HdXI4T0N0cHN0UVVWUm1QQlA2UGk3MHE2RW1IMjVHcytHWEVwbkE1WjNs?=
 =?utf-8?B?MUw3NWRsZVV2V0FBSGVQNDFEVnhJM0pURGJkU1E4cVhTdk5KM0VRb2orbHJk?=
 =?utf-8?B?WWFYV09pbE5vSk96K3h1NlpMVkdTK2w1TlFOdXRxMUdKekE0UG11ZURKc3Zi?=
 =?utf-8?B?dlY0NnhSWE1aQmxGNmlScEpPSjJFcmoyNVZXbnRyZzlNN2kwS3NzNkhWOFUv?=
 =?utf-8?B?eS9NTUtXY0JFSFZ3UmgwUU5YQmZqWHViUFFLRk50b29JZ0NIUnRKbm1tWDhD?=
 =?utf-8?B?K2JXMFJJTE03V1hObEVpZ3NuNlg3bDQ2bDdlMXJKVjByYnBaNFBnNEcxMHNj?=
 =?utf-8?B?aGFnaFc4Y1JBZ0JvWldXc0lVa2NuMFFFaUp1Mk12WjFITFBjbU9KOUxBTGk2?=
 =?utf-8?B?ZkpuZTJhU3RXVXI5MS9jUXlMSWN5QVAzSk1iLzRZSlhDTzFjMm8rSG90WFNQ?=
 =?utf-8?B?MUVtaFRLYkFKdDhxQ2tHdE8vVUZCRGdRTnhYNWg1dUdNTnU2ZEsxZ1BDb005?=
 =?utf-8?B?MlpMZ3ZQalJkY2lJaHJmcGpwM0orQjY2amViZnRzdGI2cElMSTkrVEdZeXVK?=
 =?utf-8?B?SEtVM0xuR1NKSjVDK1RBTDZFUzg3R1hYeWF6YjNPbVJMR0E3SDRBWVBHYVB6?=
 =?utf-8?Q?3nZERtZgDXDS2bsguOKN3OwU5Vh5NlAh?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T283Q3ErVVlBUEU0WUFnY3lNN0NpUXNESG4rb0M1cHdVUmlqSzZpZFdrTC9R?=
 =?utf-8?B?eGErM0ZoRklQRU5naGdBaEZmMlZXY1JZS0k5OGlNVWpYemIzRVB2b1NxZ1Qx?=
 =?utf-8?B?VEJObEhKcElaenlndGpqTW5DSWNXRElFZko2eXQ2djErdDR4YXozekc3Q3pX?=
 =?utf-8?B?RFdtTzE5SUdJYlZHdWtvNlJZRkhDV1lYODJJUkNOdDJKYU1ZK3I4SGNWSkU5?=
 =?utf-8?B?MUJ3Nmw5RUpDNVhRa09pNmlHdG9BSmJBYUZORWpJVGg1T3I1OEZqMGo1N2o5?=
 =?utf-8?B?ZDUyek9tV3B1UVV2a2Ruamg5Z3Btc1RLejZCYnNBbUVZWHJ2UXluOXFRV3VM?=
 =?utf-8?B?QVR5WTlhRVE3QlROckxubUt2TTVUTjl2RjBPQUl1alZhenN1WkJ0MXBaVk5F?=
 =?utf-8?B?TDRsQXk1eWRtbHhjVmNVbTUxRVc1dk1zajZmOHhxZkRJMXA1RjF5QW9QampR?=
 =?utf-8?B?L1VPMjM3NzJWcXN0a1dGb2dnVkYwVU5wU0pic2hvdEl3RzNzc3BnMlAyLzF1?=
 =?utf-8?B?T2VMaWVjd1Y0U2RzYU5ReC8wWnU3cS9Gd2FFY3R0TzJsbEpQQlVUVEhoR0My?=
 =?utf-8?B?YTJ0SGN1WjRpMHhkWGlPNndDMGRGWnFrRktmM2dKVEgzM1FhVTRrVm55Q3l1?=
 =?utf-8?B?c3VXVC84TklVNnJBQXRrdWtjZGxMWWNGcWkrTjlSejY1dGRhK09EaVBvZnZS?=
 =?utf-8?B?OWJKWHBJT3l3dUFGTytlVHMyb1NlZkZBbnFhVHI0em10TGNoV2lzeENsRXZh?=
 =?utf-8?B?V3oxWVNUU1hleisvbGsyb3o5b1VtUXg3Um9RMkVIWjBIVjF3YWpRUG9DcDV2?=
 =?utf-8?B?aURNZzRVdnh5NEh4aDFGcTF1NXdJZ2NwNkVXYnFMMVg2SmVBTlFJWU5WZ1c4?=
 =?utf-8?B?eUNydFlqaEFwaFdYaFNzWHBVcll1Vnp0YkNXd3VKSG9odzJ4YlFnRjBuR1RT?=
 =?utf-8?B?MnFpcmdEWDJIWi9ycmVBTUdxMXZ0amo1d3U2Q21PeSs3SXlzQ1EwSE16UURt?=
 =?utf-8?B?NTZYdXhxU0pSL2NncEQ3ZjRkcUpjTFJ2dkNiZGJuSnAwei9qQ0NkRFVrUlBG?=
 =?utf-8?B?UFpXVCtTR0dGZWtJQ094bWY5cGtXa3ZPN2xqUVBHNmVsZUtqTzcyOHdqeXR4?=
 =?utf-8?B?NURtSDZlOUNCTFlzdm1OYXNHbzZuTVZ4cEhBVzAxakVwbEJZRnNhZlMybjQ1?=
 =?utf-8?B?cWpMVDlJR1NuSHA2N1NoR1d4L1RFc01PN2pvR2FMdDNHaWNjbWxydDZhV0VD?=
 =?utf-8?B?Mlg3NGM0UTF1MUVEclRMRWNvUytaRzVGdVcwVGNzWlF2WXdHazNlTjBpdkdt?=
 =?utf-8?B?ZTlLeFYycCsreW50YnVDZUxjTlJvbFExd25yL3I2Qm9PQ2dZWUwzYTJPZlpM?=
 =?utf-8?B?QnhUeGplR1kwdzRiWHZEMm1JM0ZFV3pVajR4RkVSUlN4aVRJci94QmJUaXp4?=
 =?utf-8?B?UHFVSDZkRCtrRTRZSGV6ZTEvY04zWU8xOHBpREZRVjlvUXRHdmtOSXMwRUxT?=
 =?utf-8?B?YlN1SzNlSjdsMmZISzUyajllWWxqVzE4VG56OTcvSDFhVkMwZ051Yktxek9B?=
 =?utf-8?B?VkFFWmlycStqWkZnL0RmQ21CUy9RSkRiV3JBaEVpYmRxWGJuUzk2YlltSjNC?=
 =?utf-8?B?bDlyU0g5eXZsVkszQnZtY2tNTUoxSjhHUk1aU2s0bmtOeHNxZDRsMlNJSDB4?=
 =?utf-8?B?WHNXQm1Ib21JalFPWjdabFlZZXpHSEVFNFJtd1RVeW1xMkxaQU1yTXpjMExQ?=
 =?utf-8?B?OVF6d1NlYmZ5V005OWJIakpnc1VQQzdvZ1VtdTRqcGNZV2ZQL2FTc0VrakV0?=
 =?utf-8?B?VDM5VVJVTVg4b2RBT3czTTNaUEtRenEwdW15OE1aTnRoRnRHVFpkNnJadHZU?=
 =?utf-8?B?SUNUQWNQdTcvbGRNZTRyeTJmcld5d0g4cFc4NGgwZ1BteHhDMW5EN0FpcFN3?=
 =?utf-8?B?UEtPOWNJWE5qOUlWQTIzNXdwclZIeDQrQllPd2tMMXJveWdyVW52UmZqeTNq?=
 =?utf-8?B?ajVnT2V3Zk9tSnhEYk0veXpUUkhyQmt2MEtobFpTckRWRXMxM0ZqaGN6UFNy?=
 =?utf-8?B?S21qR2h5ZjF1YjdTL0Y0dDdNc0tYbUpiUUVFUHpuMEd2eC9DeGRpa3BUUlNt?=
 =?utf-8?Q?3dC6wZtrD+lRzzj2RSQHod62q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D4D19F914641A48A327EE08BC8B7D15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e732ba65-af51-4382-119a-08dd47256701
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 03:13:32.3618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wj9AS3aI3KeuA85GvSvkl6W4qZslWlQy1kMVMs+EBjysGde9/15DmGO1PwGguj+4xfdzbkYQWBqm9b1OxIcBoGPK3sOBnX9QfH9gxqmDN6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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

T24gMDYvMDIvMjUgODoxNSBwbSwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUaHUsIDYgRmViIDIwMjUgMTU6MTc6MTMg
KzA4MDAsIG91c2hpeGlvbmcxMDI1QDE2My5jb20gd3JvdGU6DQo+PiBGcm9tOiBTaGl4aW9uZyBP
dSA8b3VzaGl4aW9uZ0BreWxpbm9zLmNuPg0KPj4NCj4+IGNvbnZlcnQgdG8gdXNlIGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNoaXhpb25n
IE91IDxvdXNoaXhpb25nQGt5bGlub3MuY24+DQo+Pg0KPj4gWyAuLi4gXQ0KPiANCj4gUmV2aWV3
ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCkFja2VkLWJ5OiBNYW5p
a2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+IA0KPiBU
aGFua3MhDQo+IE1heGltZQ0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4g
TS4NCg0K
