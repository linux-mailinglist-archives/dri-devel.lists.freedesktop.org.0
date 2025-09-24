Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB90B9AA3D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2764410E75D;
	Wed, 24 Sep 2025 15:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kontron.de header.i=@kontron.de header.b="rVkK1m5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020122.outbound.protection.outlook.com
 [52.101.84.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6895A88A27
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:29:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXxEkmonhAim5+7Gz5x8aOeEjibOQHV9xijFSo9eprS4fQ5FyP4KZZ++yE4VZuVxFFoQhyYtKOAejCkiAi8tMWktilrls71jJ5kPsqzjpcYIfMl3y6mF/Z5FBzdpFNU+WmKb1yQzxJ63E6QDfdgiyJ+BF9L1T6PrAUQ93tHfEekXTjvb68fDv8MfUCgl8Jyf4RUeSE2EXrYS1IMwKKjBaLfb9hwsoT46D4NS0z2lnZGpvYKaY7cmRUPqul54ZTn7RK1Gt9FUWM3hO6uQ7OF3xRKUhSrI7yoGGD9vLAPjBNShkSjvHuLac3OrRd1xNO4CqkiCV2Hftgmur0VIn7ehQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/osMU2A/3GlhOwhwVU6VT1yIZrRaiWV/9h1rxmWmPA=;
 b=OO47F9ZUJ+fuYjsVDwc32FMsRIS81DSL47Kxavkp2kp2Y7w9s2Pb5h2kQuff4MZbpsbzy4rC3lD8nacdAVtqYEHBk4VJAzJ9cdzsxq7adzlpwWPGVI9nhJdd7InfP/7cuvbWVftyshbNOmo0k4qaOEjuwa+196SYJ1HFeo2doml5ll5uzBH0xYuC7K7PhiVhk5ukRt3/SLmUlbxiXaR5Nrs8cjA0TErzrEYVg9F9oGmD/fmwTzMyi+O31tFz1lMUu7UDnmgPBFYhUYK8ukg3g+peKhEckok3HM/9Qrc2AyJc8o8p3c3kRpk88KXYpA3QuklJbCm8QoGtWKnzii6jVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/osMU2A/3GlhOwhwVU6VT1yIZrRaiWV/9h1rxmWmPA=;
 b=rVkK1m5GOwosH/VkmrudhjstHgV5dCs1sX5MattKgwiBQMOLIDrPE36PV4as6/w4uN5KiU2pBwPfzV4+c2p1jEgBIx33zPA0j3S62giB2IZkB03r8w+QoK6LjHuJXC04XX4x2AmF7vIdzKIhpZZfI3AqBo/RQ2R7XBmMR24XcILuinIvo2I2jbCDFhi0uSWgd+SGy2F77mca7CyBydC9LfCtB80xrLlQ3sUyf8AN3fnNr+BuWw1wXfAWrqzvTkm8N0ArbhQLubaTJFPuScMdbWFcpDo4buzOZDTMiYphUeXtzItyZiZ2IfN7QFFxEZ/Ns9TCFbCBosLdIAAsHgP0dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI0PR10MB8714.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 15:29:22 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%5]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 15:29:22 +0000
Message-ID: <1113bb36-1f61-4429-9ebc-76d91d2c728e@kontron.de>
Date: Wed, 24 Sep 2025 17:29:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/bridge/dw-hdmi: HDMI Hotplug Detection Issue on i.MX8MP
To: "Derouiche, Oualid" <oualid.derouiche@kontron.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <AM7PR10MB3892B5B53D78CAD354EEFE24E22CA@AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US, de-DE
Cc: linux-arm-kernel@lists.infradead.org
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <AM7PR10MB3892B5B53D78CAD354EEFE24E22CA@AM7PR10MB3892.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI0PR10MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b42b04c-bed8-4f84-42e5-08ddfb7f22cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUlWUWpvRG90T1A1bDh3cmV0dnc2TDRtSXR6VTlVRDQzVldLSFd2cndxY2xn?=
 =?utf-8?B?NmxENW5EcHdFSU1mczdUell5WUIzMnh3T1ZRRVUvZWwvQ1Q1UVJHOVBIOXVY?=
 =?utf-8?B?TkdhblE2TEYyUlBpZmkyZWY3RnFWVnZ2QU1ZMzB1aWFhMVczeldGMlVYdUIr?=
 =?utf-8?B?TWFQNDR3MVVrcFlzbXhodXAvS1BZR1BxRVVLOFRuYVFwL3lUdUFwVkNmWW9i?=
 =?utf-8?B?dG1jaWVYdFRDV2haazl2eWtPNHlLdDVIWjBzWjhYRGFmNDg0TU9vemw1UU0z?=
 =?utf-8?B?dC8vM1pVV3B5K1IzaUpld0dkRmFCekIvV0xWNkNTZ29kLzBKSzY2RWZMTmRu?=
 =?utf-8?B?d0VHWmxWZkRkYXcxS25CRXA4MUxuN1JOT0h0SS9Od2JCSm5Wd2xZaTkvVHBD?=
 =?utf-8?B?NDR2OTNkZ0VOc09SZ2UxQnQvQTNuR2hmbCsxcXVmbXora1drTjE4Tks0QlNu?=
 =?utf-8?B?SjhIZjNmcmdmSkRGNEd2NytlN0dSa25xQm9PUnNrc01DbG4wSEpOUFovU3Z3?=
 =?utf-8?B?SGNpRks3cUZic25YTE1helk3VXYrbEtOZXFQTFJWK1drUm5vSkhLVkhDd3A2?=
 =?utf-8?B?dkVQTTNiMFVsblMyU1dtQi8wK091OHBseTlRQi9CK3hDd3l1SzJYQ1djcnJz?=
 =?utf-8?B?MThwVDkxSzEweVU0cUt2NXBxaVM3WlZjUkducDZYZkFYS0NLUVZTS0o0RkZV?=
 =?utf-8?B?ZEwrSUI5QjZTeDNMNkUwSDZaNm5iRnJCMHhhclBUeWladWlHbHBsWXZaS2pB?=
 =?utf-8?B?VUZsUjJRVnpudVNTSlRwa2RLbXQxcTI3TUd3UTNSOGNyU2FadG9MaFl4YXBQ?=
 =?utf-8?B?ZnZHNlVXdW9lT0QxWVBhaWhvZXZNUlVuMGxVOEVobjFXWm5tWENoS0FCMXdU?=
 =?utf-8?B?YkFMbXcyMkhkQTdTTnNyQUpjWUhjQllMMS9MbWlHZ0w4SS9uaTJYNU5WaW9P?=
 =?utf-8?B?YXVNTjBmZ0NQMTNheGJZVTh6Rzkyd28rd0x3QmpnZW5maEhpc0d0clIzQWIr?=
 =?utf-8?B?QWJxTnRJcWE0L2xmUmRPdHRFemFlUzY1VFllZTBmWW1tRTUwa25vRi9ldnFE?=
 =?utf-8?B?Y09uaytWVnppSnJFUzhWSFdVU0FWSEhSYjNVSlZXZXV3eDkrRlo1YzRRNTBO?=
 =?utf-8?B?aTRWM2F4NHk4RzBqeTFURGZBTTQyREdEdXVWZTJlRTZOcmp6RHJTcHhKSlZw?=
 =?utf-8?B?dkJIUEhnNmd5Q0QzU2hUT01qeGRQc092alpyRDFHMTNKOFAwR052VC9jbHQw?=
 =?utf-8?B?ckpudEpCakx0VGtuMGx3TDJoaUMxVjQvOXpONEN4WGx5V2RGZXJFaGFNanQ2?=
 =?utf-8?B?UzRsSXVJdkRIOE9pemhDWWJIcFpGNWdMTUc2MUY0RTRISmcycnBKK0x0aith?=
 =?utf-8?B?ZHN6aG1wVWRoOWlNWU5OZmhhTkZKT0VRdXVpTHVnQWExR2ZPOXUwei95WWUz?=
 =?utf-8?B?YjlRbEFPeFV2dGFyOW5KdmQrczY3M0pxSHY2ZkhIb0RzejhGSXY1U2gyMnhC?=
 =?utf-8?B?a1JyWTJUQWV5SUJRU29Ob3N4RkZvSXZLeW5MeUdDZVZSZHY4RW8wODJQTElR?=
 =?utf-8?B?SlNLTW1xai9XVW5CSnh3VS9sVHFISFJEYlRzSmU5YjQwL29iOGVadWkvRzk0?=
 =?utf-8?B?VHUzRzNNaHh2ODc1a2k2aU1EVGxvdUtyWUFEU21veVZOWjhWSlYrUGV1N2FL?=
 =?utf-8?B?OGNNSm40T3Jsb0NPRDBvUDVEaURaZVMrOHNEMXRmSE5IcHM5bTRuaFl0Vi9Q?=
 =?utf-8?B?Wkh4b2N2bFVtL1BSNFRBWmtGSmNCd2Z4M2x6eXRnTFAwMjUxcGc2b0FaL1p3?=
 =?utf-8?Q?L2MsQY2ttRuDl6+dFnv8wWGHqVtovOOKQZUkU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmQvaUVVcll5QjdSSnVKWjYyeDN3bjFzdzR3UGZVUm9Sd2dwbXFwTlI3Rlpq?=
 =?utf-8?B?Tmo2T2UwZHlCVTJzeVliWjFYT1hpNEpzMmxFV01NcVJvMXRVY0Q4TlQrdHJw?=
 =?utf-8?B?N1RhcHRSS0U5ZWFZcVFEczE3SVRuWHBZRHJMOVM1VlgvaTIrTHUvN2NsVkdk?=
 =?utf-8?B?U2p2STBGTkVEZUZrM0g2YXFqdG5aM0xNdms2NHFSM0U2MUxYN0paRHlLRUZD?=
 =?utf-8?B?c1RncEcwMU56c2d5ZGpXUnpxZVBwNE90bVRnK2tlOHV2MHBCSlduZ1BtazFQ?=
 =?utf-8?B?cGd2U0VVdlU2S21aczdpMkVzRHdTNnZjNXVOUjI2OXNUcnZsKzgxQWxQN25Z?=
 =?utf-8?B?L0JiOHJ6ckdSeUg4WDBEQnZGZ05DenUrUlF5VHp2YUVmYUx1Ky9JeUQ2M0NK?=
 =?utf-8?B?dWx4U2ljWG9PS0hOV1FlZHFuK3N1eVNyNzhFRis2Wk1hUlI5dFZrNFFkZnR1?=
 =?utf-8?B?T0wwZXNGbS8yRzkyZGNWM1VYSm53UWZDNlU0cmQ2cFhqTXJxQ0RqeTF4OHpL?=
 =?utf-8?B?d1hRcGNQaGFMTGJLb3lhZHVXWjFWazROemFUa3pvMkUvMWJ1Z3N0ekZqNWp4?=
 =?utf-8?B?UE9XV1orNldhQWJTaDE5SER2SHJYamxWeUxIS1RjYlBDc1BXUjB0R2VLUU1F?=
 =?utf-8?B?S2c5NjB4RlhFUEZXUVkxNy92WFdhZGJmSlVMdjZRMW9zc0RuMnNBdzh5WDly?=
 =?utf-8?B?RmJlKzhBOFMvOVRiUStBby9NWW0xYlBKZmdWaWc1NzF5ZkE1RTR1Rlc0R3d0?=
 =?utf-8?B?OUJtNEJHeEhlUzA5MEZOSFdhSG1rNm50ZUZvSE94MlpWYVNTdVVla1Jhc281?=
 =?utf-8?B?cDZWNkFRT3R4ZjNxNU43WENTZUc1VmVhQTBkTHFwKzJiSGtEVnUydjZOcFQ1?=
 =?utf-8?B?SG5TUlNnSHFYQm4wQjdOUUQ0YUdyMDRTM1BsV1lmUS9zU0hKcjNWUmhjRFZ5?=
 =?utf-8?B?UnlveklRQW5VeDhlaUROdGpOblNNZ00vSXZTUDdiakdwUlNia0ZSZ1lCbWU3?=
 =?utf-8?B?K0xEN0l4bTNCNmJpVlNJc0hWZjE5UGxwWWJVenp5cFhua2ttRGZQVlh4Y0N1?=
 =?utf-8?B?OUIvbUlnSXJBUTFUaXJyblFlUlNuOFFiNnFVTjJYemJLT2hKNFdadS92ellB?=
 =?utf-8?B?dzc3T2haNSsxUTJhODBHOGJYMXVYbWp2Q1VDNk9NVnd5TXdNUjI0R2Z4VUdJ?=
 =?utf-8?B?QjlCSFhjSXhnMEFRSFE3V2UxaDNkQWV5RDdhYnREQTRCcU1VR3U0Y2NCM2lN?=
 =?utf-8?B?WnF1THE0WTk0VU1iWW14SVh6Z0ZPbkFVNHJJdDIxSStpRW1CZ25WRTExWlov?=
 =?utf-8?B?NGErRlFYekRCalZQTURpMHRxbGF0OFZ1OFFiQndvWGxJbXlGWm5YbmlibnFo?=
 =?utf-8?B?R2pqc2Z5bU5lMGRlN1prYmNWUmNJMVk5SG5pdWRYK2wvSEZNd2FvcmplZE5v?=
 =?utf-8?B?MGczK1Q4QTY4dFVMaXl2QjAwZC9MbXhQdjRUMzJOa0hoa3NnM2dWbUw5b2dN?=
 =?utf-8?B?MDg1L3pEcHAvbDNvK1NMK2ZweWlWODRXbzRXWHY4a2xiZHB4V1kwN01hVTYv?=
 =?utf-8?B?RlY2bG5tN0Q4akl3RFRSMU5wUzhZaVRXVDZick1Ma1o2bHBiQXlhcXcwQVhI?=
 =?utf-8?B?QWhSYWZLV0M0bVRza09lUHRNbVBxbFhHeUVoZ1hHNkpkdGE3SmpDblNGZHpM?=
 =?utf-8?B?WlRkWG5jM3BXWWxaY2JEbUd4aUxlNk1DUThwc3JtelQ4dm9peUU3ZUlzNVhz?=
 =?utf-8?B?cURIV3l4YXIxL2wrQ1VSc25iSDdxNEpZKzdpem9HeDlGR25oSmU2ODRpczJS?=
 =?utf-8?B?WGpFeW1kc1JYUzJQSVlFRk12MHFsY1FaZTZSSm9BaFE0SGMzSGtLVmVlTU45?=
 =?utf-8?B?NXRGWTkvWWVRSEw2YlZSYkhwY0xQeXhKcElZMWk2SVQzUFc2NHczeC8rbVh6?=
 =?utf-8?B?YnQxMjRDQWpkVjdKY3JTZ2tUTm40dGxRZExMNnhhL3JPNTd3bjE1TllWSHJu?=
 =?utf-8?B?UE41R0thQlFYUkt4WUFCa0ZZQWV1REtvbWpLUjN0TnJYZkF2YWJiSHFZTTNp?=
 =?utf-8?B?M084TGFybWcwZHZJTVVhZ1pWd20zOGJ1bXp6OGRkWndvcWF1YVhlUHlHU28x?=
 =?utf-8?B?Wlc0UWx1b3J6KzIrSWF6cTFhVnZtamQ4WXlHbXhTdkRUK1lIKytNU1NpTUZV?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b42b04c-bed8-4f84-42e5-08ddfb7f22cf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:29:22.2061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy4ekE7mNPet/TUeGAbr+QXAEAA35lk/cnhMw1ED6Cg/3XmXZfO/nlmBDP7/HAaIXC/v12SDvBwqIA+nioPIDCOYdtxv5ECMmkYtQlEEk8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8714
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

Am 07.08.25 um 09:24 schrieb Derouiche, Oualid:
> 
> Dear Linux DRM Maintainers,

and anyone else who might be able to help or has experienced similar
issues ;)

FWIW, +CC: linux-arm-kernel@lists.infradead.org

> 
> I hope this message finds you well.
> 
> I'm currently troubleshooting an HDMI hot-plug detection issue and would greatly appreciate any insights or suggestions you might have. Below is a brief description of the problem:
> 
> Platform: i.MX8MP 
> Driver: fsl,imx8mp-hdmi
> 
> We're experiencing a bad behavior with certain monitors (specifically Terra monitors). On initial boot, when the HDMI cable is already connected, the correct resolution is applied. However, if the cable is unplugged and then reconnected, the resolution is incorrect, and EDID is not being read. (please see attached Log). After several reconnection attempts, the correct resolution is eventually applied.
> 
> Log1 – With Failure
> 
> imx8mp-dw-hdmi 32fd8000.hdmi: EVENT=plugin
> [ 2602.231703] imx8mp-dw-hdmi 32fd8000.hdmi: read_hpd result: 1
> [ 2602.231714] imx-lcdif 32fc6000.display-controller: [drm:check_connector_changed] [CONNECTOR:35:HDMI-A-1] status updated from disconnected to connected
> [ 2602.231735] imx-lcdif 32fc6000.display-controller: [drm:check_connector_changed] [CONNECTOR:35:HDMI-A-1] Changed epoch counter 37 => 38
> [ 2602.231751] [drm:drm_mode_object_get] OBJ ID: 35 (2)
> [ 2602.231765] imx-lcdif 32fc6000.display-controller: [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:35:HDMI-A-1] generating connector hotplug event
> [ 2602.231815] imx-lcdif 32fc6000.display-controller: [drm:drm_fb_helper_hotplug_event.part.0] 
> [ 2602.231827] [drm:drm_client_modeset_probe] 
> [ 2602.231836] [drm:drm_mode_object_get] OBJ ID: 35 (3)
> [ 2602.231848] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:HDMI-A-1]
> [ 2602.231942] i2c i2c-1: <i2c_imx_xfer_common> transfer message: 0
> [ 2602.231951] i2c i2c-1: <i2c_imx_write> write slave address: addr=0xa0
> [ 2602.231996] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
> [ 2602.232004] i2c i2c-1: <i2c_imx_acked> No ACK
> [ 2602.232015] i2c i2c-1: <i2c_imx_xfer_common> exit with: error: -6
> [ 2602.232025] [drm:drm_do_probe_ddc_edid] drm: skipping non-existent adapter 30a30000.i2c
> [ 2602.232037] imx8mp-dw-hdmi 32fd8000.hdmi: failed to get edid
> [ 2602.232043] drm_add_override_edid_modes
> [ 2602.232057] drm_add_modes_noedid
> 
> Log2 – work correctly
> 
> [  209.462094] imx8mp-dw-hdmi 32fd8000.hdmi: EVENT=plugin
> [  209.464913] imx8mp-dw-hdmi 32fd8000.hdmi: read_hpd result: 1
> [  209.464927] imx-lcdif 32fc6000.display-controller: [drm:check_connector_changed] [CONNECTOR:35:HDMI-A-1] status updated from disconnected to connected
> [  209.472468] imx-lcdif 32fc6000.display-controller: [drm:check_connector_changed] [CONNECTOR:35:HDMI-A-1] Changed epoch counter 15 => 16
> [  209.472484] [drm:drm_mode_object_get] OBJ ID: 35 (2)
> [  209.472516] imx-lcdif 32fc6000.display-controller: [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:35:HDMI-A-1] generating connector hotplug event
> [  209.472577] imx-lcdif 32fc6000.display-controller: [drm:drm_fb_helper_hotplug_event.part.0] 
> [  209.472588] [drm:drm_client_modeset_probe] 
> [  209.472597] [drm:drm_mode_object_get] OBJ ID: 35 (3)
> [  209.472608] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:35:HDMI-A-1]
> [  209.472711] i2c i2c-1: <i2c_imx_xfer_common> transfer message: 0
> [  209.482814] i2c i2c-1: <i2c_imx_write> write slave address: addr=0xa0
> [  209.482881] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
> [  209.482890] i2c i2c-1: <i2c_imx_acked> ACK received
> [  209.482896] i2c i2c-1: <i2c_imx_write> write data
> [  209.482902] i2c i2c-1: <i2c_imx_write> write byte: B0=0x0
> [  209.482946] i2c i2c-1: <i2c_imx_trx_complete> TRX complete
> [  209.482953] i2c i2c-1: <i2c_imx_acked> ACK received
> [  209.482959] i2c i2c-1: <i2c_imx_xfer_common> repeated start
> 
> 
> It seems to be a timing-related problem between the EDID read via ddc and HPD signal handling, a workaround by adding a 100 ms delay to the dw_hdmi_phy_read_hpd() function resolves the issue (please see attached).
> 
> Patch1
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1686,8 +1686,13 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi, void *data)
> enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>                                                void *data)
> {
> -       return hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
> +       enum drm_connector_status stat = hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_HPD ?
>                 connector_status_connected : connector_status_disconnected;
> +
> +       if (stat == connector_status_connected)
> +               msleep(100);
> +
> +       return stat;
> }
> EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
> 
> it work also with the following : 
> 
> Patch2
> 
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -587,6 +587,10 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>                               drm_mode_prune_invalid(dev, &connector->modes, false);
>                               goto exit;
>                }
> +             
> +             /*need some delay before reading the EDID somehow the I2C sink slave controller in same monitor are late */
> +             set_current_state(TASK_INTERRUPTIBLE);
> +             schedule_timeout(msecs_to_jiffies(10));
> 
>                 count = drm_helper_probe_get_modes(connector);
> 
> I’ve also tried applying different patches from the following series
>
(https://patchwork.kernel.org/project/dri-devel/cover/20240908132823.3308029-1-jonas@kwiboo.se/),
> but unfortunately it did not resolve the issue.
>
> I’d appreciate any hint or any guidance on what a proper,
> upstream-compatible solution might look like , I don’t
> think this workaround will be a proper one. Thank you in
> advance for your time and support. I look forward to your
> feedback.
