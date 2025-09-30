Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF904BADAE0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 17:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5B10E2C9;
	Tue, 30 Sep 2025 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="KSCV8Uin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19011002.outbound.protection.outlook.com [52.103.1.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704F010E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 15:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQh/e0scaa088wYR5BBju1OmongAurH7BnA/XLmODamacD1mPlLeDUcNx4/HU4SmGP56ekvQKttSW+lhnTqnd0bZVaP6E2pEH2VRxwyglNZQ7+G8xHB4xbKqdcPeoSH0JCcnPYUeECsL12nzc2pINNGfB3INmIelR7EMBmCgnMifuoZPB9gAJZ8gANIfbwql3HNMvgrWAJswhwTxnbNMHIyAa79py5RgPHz6Mh3PPIotPKvU1bB+KAEuH5UnVBa3p55oYLAfDPo8nBXRAaKGeiXLxo3nO2b5VnIqH1lBIGvn4Q/M1lF4CJa+5lj/F1TizVTC/6xM2Swb0O00G1LdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPHSCwMtD831B5nkcUWtUwfpPm3R7wBZichkCmjNe4Y=;
 b=OLhIDXuQMHNZAFDT0M2g9vo1qfX3krMa9kSzW5oh00juzXG0qv3eBoR4+HdSwo8HhiNTXg7ZL11gcq3Z8M6ZHVoDZSNhkAgWkQcYGGqObEWLzviGkZk/R1cq+mfG2QtPNOzEEmGKlN73qknjlRUzTaD30BU+KiUhiTe+Ye2vFRPd3t4DB9mGbLfPjFwqYL2LhdywWwK8ziYXUQDa4qicXXOk/zJMAAzyb8QYDW1enni1HgNVuxM8ogcoZ56HVnlSi3J4GdLtlATOfCCOO0Dttgz04SAWhoe4/kbc4efcNE9z3LjYsJ+bjoQuuyBN/ixvOLqnNgs75t9StdFhp7b6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPHSCwMtD831B5nkcUWtUwfpPm3R7wBZichkCmjNe4Y=;
 b=KSCV8Uinp6HBZ0be6fDq2ZJ8fXQZIfKsihi/fcfCtTg0u7UwGjdw5vmeCEMHn0skGSxdk0tXhBYnoNub8MyTtdgl5inAUGLTGAam2YxmgG4kmI7CbKlhPH286bj8M8sf7V0JMUtAfAkeFuYT3p63nJGxbpwb3A/jEQcWAIUhR/N5WJmKh7XXjL/Q4yUsn1jm/ShuMgj8JB7BB1NSSDi+Uzn5bQkhmo8ZQTr3i2Z75UbHKGuM77H53ZZLG5ZJFXp6uA2ntUhoG++v+95Sh5kKCZlZbYRvovDicPACoB+PhS+iPxr5089IuMHJWotS7CgUUE96HGMXJHPDLbma4Vj9AA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CO6PR02MB7683.namprd02.prod.outlook.com (2603:10b6:303:a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:18:05 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 15:18:05 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "javierm@redhat.com"
 <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Topic: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
Thread-Index: AQHcHay/1LhJS9Qt20a/N81nkOUA8bSED7IAgAYnyGCAC1WNAIAAa1tQgBYDCgCAAAOD8A==
Date: Tue, 30 Sep 2025 15:18:05 +0000
Message-ID: <SN6PR02MB415712C780B051175BCD8B32D41AA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250904145806.430568-1-tzimmermann@suse.de>
 <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
 <c6ef1912-84b8-4f01-85cc-2fb18f1ad1ed@suse.de>
 <SN6PR02MB41575149CA466B89283B920DD414A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <b2a15b41-7f20-46ac-9f62-d5e48c597760@suse.de>
In-Reply-To: <b2a15b41-7f20-46ac-9f62-d5e48c597760@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CO6PR02MB7683:EE_
x-ms-office365-filtering-correlation-id: 8705e25e-31e4-465a-a1ad-08de00348e2e
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|13091999003|461199028|19110799012|8060799015|8062599012|15080799012|39105399003|3412199025|41105399003|40105399003|440099028|12091999003|102099032|56899033;
x-microsoft-antispam-message-info: =?utf-8?B?R25uaXZWYWJTa3pyZ1FlVXg3NGs0VEJIK3kzc2pIblJNWS9UQkFWVTcrNTda?=
 =?utf-8?B?YjBPeVdIMTBIT3ZSNGlHN29wZWo1SEtHcEdnb1FhaURuaEVyR1F0UjdNZXZk?=
 =?utf-8?B?M3hzWWdqQ3pTYkxNQTlESWZnRUFZdFpmZ0pkVXQ2RE40bFpaNnVLNGhCWXU2?=
 =?utf-8?B?NEVabUQ5TG4vWWpJaDd5RmxFQ1pPbVJMLy9qQTRoY1U3Qng0bVQvQ2Q1TDho?=
 =?utf-8?B?bTQzYnhKeXNIOWRrOURyRDd6czdKWCt5L2g0U0ZrNjY4MjJmVW9KaXJKaVNo?=
 =?utf-8?B?R1ZxRFRJV285TGdxUFNDYzB4bHplcHd1eGhOTDNaQ2Exc1p2NFdwTHNsZDBy?=
 =?utf-8?B?N2VSN3NGWDVDWmEvK2NRbzZUT0l5MzZKZmRPR1d5ck9sMmF6YUJqdzEzMThB?=
 =?utf-8?B?bGVEbVorMTRLM28wUmREeVJqNG1lazlPRHdFTHRtbG5LU2kxakZtelBuWFh6?=
 =?utf-8?B?a1JyTTZlS2VjK2Z0MllZN1JwUTIzNmV2VXEraUxBOXN1cDFxemowYVAvaE9U?=
 =?utf-8?B?VjdhOFRIVTRYaUlGd0l5enVPTE5zdTVjM2lIb2tBWm9xS0pFWFVOdG02UEFC?=
 =?utf-8?B?NzdidldHb1NOd0ZWUWROTWJHUnd2T1VUTXRuNklFdTYrZHNhMUo5YXBuRll4?=
 =?utf-8?B?dCsvSFRwVVlzRGtNY09xTzZVQVVSaEdya1VNZXNZRzUwSERsWHIzTnlKME9m?=
 =?utf-8?B?ZXFoY0ErQ2pOYml0T3F1dWNhVmw3TXFrQkpjZlRGeGwxVkMwQUtBRGlwejNk?=
 =?utf-8?B?NzVka0tIcDlHWDlqWml2UmRwZXE5QVZJMVUrbWg1OXZKbUpqVSthSVJ0VUJE?=
 =?utf-8?B?LzQ3bVZLa29lYjhGVXFKb2g0bFlDYjA5TUVZd1ZiTElvQ0pMR1M4N3ltaWtz?=
 =?utf-8?B?R2ZuMlR2TDJtWXdwc1ZWeGJzdHpDTFBmYnQzbFluUUpZNUltdWZwWks4RFg5?=
 =?utf-8?B?M1RWMmU3WldxWFU4YjMvNlJ2SVY1NjdWQ05qZERlM3paZXFSNzJPb2E0UnlB?=
 =?utf-8?B?MS9xYkZpVURSdWJFRGNaVXIzUGMwQ2xqb3M1cTF3cmtnT0pmbytib1VLaHhG?=
 =?utf-8?B?bWRoeVlVSHduWnJ6OHpnZjdDeHV2K0FZL0hqK2lWbUdIN2VDdFhPS1RNTjJh?=
 =?utf-8?B?ME5QVXdicDE5NlNCb1dLL1l3M05seWltenNiMnZYRHRLMEVhQURiVXNSMG9j?=
 =?utf-8?B?MUFEcFRETE9XVTFKY0xkZE8wWmF4K2lrTlg0cXp3UjdIaW5UVkhTOXlPaTlH?=
 =?utf-8?B?UnhMUzlrU1BiZU9MODQ2RkU3dDlIeWE5cVlBNWVvMlJicSszNHlkMkZhYjVY?=
 =?utf-8?B?NlhKaDNBczZpa1IvSXpERnRSODNDak83ZXZpMXpSL2pFTVphUW12dk53SkEx?=
 =?utf-8?B?ZWNZcUNpTHNpUG14dHRkS1VhSWtITHA1dG9iNWtzYkZiektEWXJCYmVldXcv?=
 =?utf-8?B?K05vUDBFeURXUFo5RjgreWdzTW1oUys0ajZiNUUxNkZldUJtWklzK0lQa3hD?=
 =?utf-8?B?RDJtOFU0Mm43OGRsdExoUWFvdXlnNUs1cHZTWXAzeFFmMFRXVVhZWkFRWldv?=
 =?utf-8?B?RGVkSGs4WDNSTlM4MklTaUhCa2RkWDZ4bHdyRHcyY2xFL3ovUVlYd1hHVVRS?=
 =?utf-8?B?UlczK0lVZzR0akdzd0FZYnBob2VaQkcxUmFzb0FoV2FyWWR6d3ZJNUFPYXpI?=
 =?utf-8?B?T1hrQjFEYlkxZVVmd0ZGM0s1QVo3MVNOUTJIYjQrd2YvdWsvelB5K3N3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2poaElGNHU5VmlYRUpKdUVCUEpVbjYrK2ZkUExtUFRCY2ZlTWtBVUYxbklh?=
 =?utf-8?B?Z0twdUl5NUdCQURiNXdCNmtMd3RLdUNwK2J0Y0tsMFhjRCs5UEwwOXpLRENt?=
 =?utf-8?B?Y1krY3ZYM2J0OW5hcWgwNHlpaUQxNFdCMnZLcW9Lall0SXpMVG8yTThIa0xw?=
 =?utf-8?B?eTdUVGRnR096ZWdVbG9KTGRuQWdMeEVEOWtHQUZ5MDhENkh4Q3k0MWVHalRv?=
 =?utf-8?B?UUh4Yk9RaG5RUU1aUk1LZXE3MjIxTndITWNkeHNSWWM2WWh2VjJ6czh5Q0lk?=
 =?utf-8?B?eWorWkJCZVZZcjBYUlo1bUVFREpvV2lTV2dJUjVwVG8yc1NEelBtMkIrVzdS?=
 =?utf-8?B?b2g4RGRxM3JGNGJkcG56d1RJdkczWEZ1QTgxeVdZb2YzVU9wZlZReHRycTdW?=
 =?utf-8?B?WVo3YnVDZTBLRGZITHRIRk5jczJjaTQ1YUJ1U1VOancvbUZEQTh4VTc1ZGJQ?=
 =?utf-8?B?WTYxclZlYUQ5cjYxZ2pwYUVxZEdLS05GaGtPb2l3cDc1YTJqcDVpQzU1VFhx?=
 =?utf-8?B?V1dCR1BWUE1UaXNONTUveHFhTHdwWWVMbTJwN0cwZlFGNFBGUlpEV0pkZ1VM?=
 =?utf-8?B?RVhiS050OEdsS09RL3BNb1pnSmp6eHBnNWVScHhCQ3dRRVUxMzk1bnRjZmZL?=
 =?utf-8?B?eWZwelJhQkloRjN3ZHh5cm9iZHdVcVp2OWFHVGJyNmpHSExRS21aL2Vjb3I3?=
 =?utf-8?B?RitKZTlrT280Z3FHN1prTWxRQnRnSkJGNmR2elpiVEdYa0NaSkwwUVVMVE12?=
 =?utf-8?B?L1Y4OUNQZjdhZzg0QkpENzlsMkRvYm9PL245NlIwWFUwQ3YxL2RGL1JMbDd6?=
 =?utf-8?B?djFwVDRDbGw2eGVPcjdIL1ZZV0ZTWkx2MTZyZ0N2MnRYZlNSY3AxQi9PVXJk?=
 =?utf-8?B?dzNvaktBN2pUNTVDdFU2cWhTWkJJdTRCZTRkb3NVeTRmSGRlUHRJUlhjT2d6?=
 =?utf-8?B?a0tYWUJUM3RjWXVhOVJYQ1RwUU9odjlRbVpUQlhjTzloRTNUS1hpRS91aGRx?=
 =?utf-8?B?MkdlOE5YL2prd2VqL05SWmZnMkFnOGROUjJDTFBIOXpEZ1JUVEU3QVN6dWtW?=
 =?utf-8?B?QUtTc3lQSGxPUmp0WWc0a3RrWXRiZ3ZuSFNOeDE4d1RETXVwaTNxQzUySDJw?=
 =?utf-8?B?OUJ3L3JiTTZQQ1BRZDI5WVc5VDZlNEQ3TlZPUWZVSlpnbWhOYzlHYnFHdFQy?=
 =?utf-8?B?b2E2N3RVWHFuSW5qNlJ6U1NnS1V6TWRrTGZRNGZmQjFqWnpxdXZnSXpCOHNX?=
 =?utf-8?B?ajdTbWU2WVZhM295TnZUa2FVYlJ0cTcrZ3hGNW5jNjg5Y1V2Uk9maEtsTytv?=
 =?utf-8?B?NTdmRGJ2TlFJaWl1eFZlT1VSa2RiQnJYSmhXV2RKUUJlWXJUek9IeUErdEFi?=
 =?utf-8?B?RktqZjltNkVqY3k4cmpOS0d4ZG4xdWlHc2w1dFptMUs2a04yejMvVGhPZ1lr?=
 =?utf-8?B?TE9URVZ5cENNTnZDSThWN0N5RjU0N2JQSG9VdjBVejJscTBoWStLR3ZwTlhQ?=
 =?utf-8?B?SWJEVWQzZnNDbk84YitGVlNxODljWXdQRW1PZkhyNnNiVjVmdU9HY0RkYjBE?=
 =?utf-8?B?UFZqN3hEZlBhQXFwb0hYNGhlZlhQUE9rV3VWWGo5bGRGKzBqWkpoR256a2Qr?=
 =?utf-8?Q?FZmaW2JyJ0SCopxkHHT93OqgMTYLjSnhb71SXF4MmVxg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705e25e-31e4-465a-a1ad-08de00348e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 15:18:05.6541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7683
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

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAzMCwgMjAyNSA4OjA0IEFNDQo+IA0KPiBIaQ0KPiANCj4gQW0gMTYuMDku
MjUgdW0gMTc6MDAgc2NocmllYiBNaWNoYWVsIEtlbGxleToNCj4gPiBGcm9tOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE2
LCAyMDI1IDE6MzEgQU0NCj4gPj4gSGkNCj4gPj4NCj4gPj4gQW0gMDkuMDkuMjUgdW0gMDU6Mjkg
c2NocmllYiBNaWNoYWVsIEtlbGxleToNCj4gPj4+IEZyb206IE1pY2hhZWwgS2VsbGV5IFNlbnQ6
IFRodXJzZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNSAxMDozNiBQTQ0KPiA+Pj4+IEZyb206IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiBTZW50OiBUaHVyc2RheSwgU2VwdGVt
YmVyIDQsIDIwMjUgNzo1NiBBTQ0KPiA+Pj4+PiBDb21wb3NpdG9ycyBvZnRlbiBkZXBlbmQgb24g
dmJsYW5rcyB0byBsaW1pdCB0aGVpciBkaXNwbGF5LXVwZGF0ZQ0KPiA+Pj4+PiByYXRlLiBXaXRo
b3V0LCB0aGV5IHNlZSB2YmxhbmsgZXZlbnRzIEFTQVAsIHdoaWNoIGJyZWFrcyB0aGUgcmF0ZS0N
Cj4gPj4+Pj4gbGltaXQgZmVhdHVyZS4gVGhpcyBjcmVhdGVzIGhpZ2ggQ1BVIG92ZXJoZWFkLiBJ
dCBpcyBlc3BlY2lhbGx5IGENCj4gPj4+Pj4gcHJvYmxlbSB3aXRoIHZpcnR1YWwgZGV2aWNlcyB3
aXRoIGZhc3QgZnJhbWVidWZmZXIgYWNjZXNzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGUgc2VyaWVz
IG1vdmVzIHZrbXMnIHZibGFuayB0aW1lciB0byBEUk0gYW5kIGNvbnZlcnRzIHRoZSBoeXBlcnYN
Cj4gPj4+Pj4gRFJNIGRyaXZlci4gQW4gZWFybGllciB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzIGNv
bnRhaW5zIGV4YW1wbGVzIG9mDQo+ID4+Pj4+IG90aGVyIHVwZGF0ZWQgZHJpdmVycy4gSW4gcHJp
bmNpcGxlLCBhbnkgRFJNIGRyaXZlciB3aXRob3V0IHZibGFuaw0KPiA+Pj4+PiBoYXJkd2FyZSBj
YW4gdXNlIHRoZSB0aW1lci4NCj4gPj4+PiBJJ3ZlIHRlc3RlZCB0aGlzIHBhdGNoIHNldCBpbiBh
IEh5cGVyLVYgZ3Vlc3QgYWdhaW5zdCB0aGUgbGludXgtbmV4dDIwMjUwODI5DQo+ID4+Pj4ga2Vy
bmVsLiBBbGwgbG9va3MgZ29vZC4gUmVzdWx0cyBhbmQgcGVyZiBhcmUgdGhlIHNhbWUgYXMgcmVw
b3J0ZWQgaGVyZSBbNF0uDQo+ID4+Pj4gU28gZmFyIEkgaGF2ZW4ndCBzZWVuIHRoZSAidmJsYW5r
IHRpbWVyIG92ZXJydW4iIGVycm9yLCB3aGljaCBpcyBjb25zaXN0ZW50DQo+ID4+Pj4gd2l0aCB0
aGUgY2hhbmdlcyB5b3UgbWFkZSBzaW5jZSBteSBlYXJsaWVyIHRlc3RpbmcuIEknbGwga2VlcCBy
dW5uaW5nIHRoaXMNCj4gPj4+PiB0ZXN0IGtlcm5lbCBmb3IgYSB3aGlsZSB0byBzZWUgaWYgYW55
dGhpbmcgYW5vbWFsb3VzIG9jY3Vycy4NCj4gPj4+IEFzIEkgY29udGludWVkIHRvIHJ1biB3aXRo
IHRoaXMgcGF0Y2ggc2V0LCBJIGdvdCBhIHNpbmdsZSBvY2N1cnJlbmNlIG9mIHRoaXMNCj4gPj4+
IFdBUk5fT04uIEkgY2FuJ3QgYXNzb2NpYXRlIGl0IHdpdGggYW55IHBhcnRpY3VsYXIgYWN0aW9u
IGFzIEkgZGlkbid0IG5vdGljZQ0KPiA+Pj4gaXQgdW50aWwgd2VsbCBhZnRlciBpdCBvY2N1cnJl
ZC4NCj4gPj4gSSd2ZSBpbnZlc3RpZ2F0ZWQuIFRoZSBzdGFjayB0cmFjZSBjb21lcyBmcm9tIHRo
ZSBrZXJuZWwgY29uc29sZSdzDQo+ID4+IGRpc3BsYXkgdXBkYXRlLiBJdCBydW5zIGNvbmN1cnJl
bnRseSB0byB0aGUgdmJsYW5rIHRpbWVvdXQuIFdoYXQgbGlrZWx5DQo+ID4+IGhhcHBlbnMgaGVy
ZSBpcyB0aGF0IHRoZSB1cGRhdGUgY29kZSByZWFkcyB0d28gdmFsdWVzIGFuZCBpbiBiZXR3ZWVu
LA0KPiA+PiB0aGUgdmJsYW5rIHRpbWVvdXQgdXBkYXRlcyB0aGVtLiBTbyB0aGUgdXBkYXRlIHRo
ZW4gY29tcGFyZXMgYW4gb2xkIGFuZA0KPiA+PiBhIG5ldyB2YWx1ZTsgbGVhZGluZyB0byBhbiBp
bmNvcnJlY3QgcmVzdWx0IHdpdGggdHJpZ2dlcnMgdGhlIHdhcm5pbmcuDQo+ID4+DQo+ID4+IEkn
bGwgaW5jbHVkZSBhIGZpeCBpbiB0aGUgc2VyaWVzJyBuZXh0IGl0ZXJhdGlvbi4gQnV0IEkgYWxz
byB0aGluayB0aGF0DQo+ID4+IGl0J3Mgbm90IGNyaXRpY2FsLiBEUk0ncyB2YmxhbmsgaGVscGVy
cyBjYW4gdXN1YWxseSBkZWFsIHdpdGggc3VjaCBwcm9ibGVtcy4NCj4gPiBUaGFua3MhIEknbSBn
aXZpbmcgeW91ciB2NCBzZXJpZXMgYSB0cnkgbm93LiBHb29kIHRoYXQgdGhlIHVuZGVybHlpbmcN
Cj4gPiBwcm9ibGVtIGlzIG5vdCBjcml0aWNhbC4gQnV0IEkgd2FzIHNlZWluZyB0aGUgV0FSTl9P
TigpIG91dHB1dCBpbg0KPiA+IGRtZXNnIGV2ZXJ5IGZldyBkYXlzIChhIHRvdGFsIG9mIDQgdGlt
ZXMgbm93KSwgYW5kIHRoYXQncyBub3QgcmVhbGx5DQo+ID4gYWNjZXB0YWJsZSBldmVuIGlmIGV2
ZXJ5dGhpbmcgY29udGludWVzIHRvIHdvcmsgY29ycmVjdGx5Lg0KPiANCj4gU28gaXQncyBwcm9i
YWJseSBhIGdvb2Qgc2lnbiB0aGF0IEkgaGF2ZW4ndCBoZWFyZCBmcm9tIHlvdSByZWNlbnRseS4g
OikNCj4gSWYgeW91IGhhdmVuJ3Qgc2VlbiBhbnkgd2FybmluZ3Mgd2l0aCB2NCwgSSdkIGxpa2Ug
dG8gbWVyZ2UgdGhlIHNlcmllcyBzb29uLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0K
PiANCg0KWWVzLCBhbGwgaXMgZ29vZC4gSSB3YXMgZGVsYXllZCBhIGJpdCBkdWUgdG8gc29tZSB0
cmF2ZWwsIGJ1dCB0aGUgdGVzdA0Kc3lzdGVtIGhhcyBiZWVuIHJ1bm5pbmcgZm9yIGEgd2VlayBu
b3cgd2l0aCBubyB3YXJuaW5ncyBvciBvdGhlcg0KaXNzdWVzLiBGcm9tIG15IHN0YW5kcG9pbnQs
IHRoZSBwYXRjaCBzZXJpZXMgaXMgZ29vZCB0byBtZXJnZS4NCg0KTWljaGFlbA0K
