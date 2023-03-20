Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7224E6C25DC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A674E10E678;
	Mon, 20 Mar 2023 23:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11011002.outbound.protection.outlook.com
 [40.93.199.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042AA10E678
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 23:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvawvgBmapceFYmksgk18FpOFLFogpnTyhBWYg08x7ahuZQ74vWdjvdkEXFsG1N5z3Nf0XREB1mF3sHM8kKTLZp5kSdgnsk67nuCO9Bp/cTPSvaWnLbLSxrWluVjkkwn1nOKmtwhDQRXM62jsjiMDM9xGSSGZABOlpLEHxJV3DbV628Hb5t70AwtXllZgXAY39RDCOD5649+HiHsuxzmZIJ4KxKsU+t2etmn5l8umGp1WIEYfmvDqIvgekSBdNI9A/Z5j45+xuBfyfCNI6bUA9SY2girTiR+fCozARq1yicbbrL8WfIV4ITWrbwdmSVEs7c7sMy1RHTbfeqi/htxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weT0n4Mpws6q0ze1ttZuu4YC/SJb2PVM11OTCJtd/QM=;
 b=D/iAuyO8e5oMSDZNdrVf5lHbjkPL/sICDj0kmYKn/dRNgzVT8G7T8cMNs2Uap3YlncEdE9/S49Tpf7nlAJuJAlc6ZWEGR+t2WMVzEuuq8jLJQunrWAagzZC/8qywFF4rpd2zRM6ivYURcBJCVviC48ezcJ8J/tUpE6tJQK2o6vaW5o30n6fT+UzAnAjU1ZR8t+hcW5MAUw/xQyfc3Dv6zQ72uWoGBoEDltCAozV5MC7L7h49taQbdMHtry64C1h2FsXB8As9Mdtef8yMYAOG9iKE3akSNvP+Q6mmJI1er5i6sk3FUoHSnY6RMJ6PRLSW6BO4nZLz7cX81i5tEK6GYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weT0n4Mpws6q0ze1ttZuu4YC/SJb2PVM11OTCJtd/QM=;
 b=moSwcLbKO+AgrSAalyr3rCPVs30OzumfBf4+za11c9NsEbs6UBQuKs0waZ2SY93y3tk7rwqeAATIW9nmiD2IwDXGTvR+q4VjZ03fydOHVN6Nr03+RrVHUDDfVzb+PFnGzFro/wpoIahEezCA+amkwq5vrI+DpYP9ZiB29Xzmc50=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by DM6PR05MB5692.namprd05.prod.outlook.com
 (2603:10b6:5:112::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 23:42:22 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 23:42:22 +0000
From: Zack Rusin <zackr@vmware.com>
To: "martinkrastev768@gmail.com" <martinkrastev768@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
Thread-Topic: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
Thread-Index: AQHZVroLIrIQNhLeJkuXbUI6MkDhQq7790AAgAhXC4CAAA97gA==
Date: Mon, 20 Mar 2023 23:42:22 +0000
Message-ID: <33b225168ec2bb1393f2405d76b8acfe685aedd5.camel@vmware.com>
References: <20230314211445.1363828-1-zack@kde.org>
 <98e9cc9a-6986-4425-3906-03dce337a0df@gmail.com>
 <CAPM=9tyLPQ2SEGbsHXJcpDxW3AXY7sA0wDcG+5szQQqRf3swZA@mail.gmail.com>
In-Reply-To: <CAPM=9tyLPQ2SEGbsHXJcpDxW3AXY7sA0wDcG+5szQQqRf3swZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|DM6PR05MB5692:EE_
x-ms-office365-filtering-correlation-id: 6abb8b13-0bb4-4ab0-b95a-08db299cc089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ya+ZVDdFpzBbDloA9mkUW/npmpVCc5AHqjA6i9ZFBgF1TNP2wLFeKgrQKKqePinpIDwwFr1G7v21Gj+He09Y+jdBJKXmBIiZMCr1qC4PV072tyQLmMETyO9/Lh+p1WU+bKcHORTlUZbfQswKfAYqiHmaTX5QoVeRhQ71IFhsf+qPFfGWx4MQYsFtNKWA4KlLmotQW5HZBKQApRkqSA3vfziz05KSB6lbhwHwCYMCp7hJU5PlEKnwMPNLq8+QJptRxpRRV3wUVIC23IBQXKpVRn7+TWiP+iBc12ewoZDh+n7WOkp6hWvn2mgi/+bLTcsZulo1TRYJQAhawviaO7L5Zj+UfQUpS/tAqL1A+ExIesfKGsKEauBCsVQQjlg/lHlldcjpPw9Z2FbcAMJxjA3MnS9HSffFBmPgUil88p24sTCugdm3rfDQ/gYrlFpUx9pZWhIYQ7aeRr70Me1MHQTXc0q83+59YhUNMSr/7VlS4OW3I/7JiSwnyopRY019KqQ2JAnOm84lz0WBQ8YEgNIWemiXmjyPUUpAmT/C0254kWdi9HkTEDyC0joZh/HDk+Q7cI/dwOv3yjikA37jBbfn21DWJhC6z71MsLeVOn4XtUHiXrN7iCV11cifxHaJ7ahRSkxDbsez+NQyry4M06sBr53Kyg4D2y51syH7Y9ZYv+VVZkbMuwxamfBfHmNlEiW06/zSGp+ydSdvf1uZCRNh5tFMcYqvzOCyQJO2RdZZReN3Uqx5IYYTNFXK/Rx8CpO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(26005)(4326008)(36756003)(2906002)(66476007)(66556008)(8936002)(76116006)(91956017)(66946007)(66446008)(8676002)(64756008)(5660300002)(38070700005)(4744005)(86362001)(122000001)(38100700002)(966005)(6486002)(71200400001)(6512007)(6506007)(478600001)(110136005)(316002)(41300700001)(186003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejFMc05TYWJlYTJkSzhBd1dLZjQzOGc3N1hLMWtqTkNMczhhQUljRTBvK2VL?=
 =?utf-8?B?ZXVFck91c05YQU85SE1wTlhDWCtOelZ2L0xqL2YvMk5XZG1EVFJsUUhIWFFX?=
 =?utf-8?B?dW44Wks2QkJZaGU0aE9Cd3FTYjZBYU1TN0RVVjNSQ3BJQlo4Smt5Zmp2Wkdv?=
 =?utf-8?B?eWhacEF3T092Vmt0bFQvYWFkUjJTNzFWNXFmZHI3bkg4UVhyRjg5TUtVSkhj?=
 =?utf-8?B?OU1CYldpR0g5Q3ZSV3pKaTQxMUxlaHBMa0xHZDhDcWo0NDN4T0tVU21uQm9U?=
 =?utf-8?B?MlBSQlA2eWVWRGV0RkNzRDB3TUpiYVhTQk5lRTlJaVl1Z1JSZXZia3liQjJ6?=
 =?utf-8?B?K2hnZlZQK1p1aFgwZHRHSFh2QllyYUV2allPSHpwY25JVGRPNTNNQ25GWmRM?=
 =?utf-8?B?dFNBakJiZis4RC9zVkg3TDV1VU4zNWpvKzZiQnNVVmVsaGZ6SjZEMGRzczRW?=
 =?utf-8?B?ZVdFcXNRU1I4QnBHK1EweFFFTTJnZE5IelZXR3BLSFBxT1oxZFBoT1RBcmxN?=
 =?utf-8?B?ZFFQSnBHR29nQ2MrWFNPVDRyUGhaQlJoN3JpVkZBaGN0WjQzNERwNU40emdD?=
 =?utf-8?B?S3lBUW5NZGlVc3pyVzZ6WkxoYXRkeVQxRjE3ZWNMNlhyY0E5cWVHbU8yc21D?=
 =?utf-8?B?MjJueUlrdlQzUW1VUmNkbXFtVHhMVDBibCtmdGhtM01GRkNLdTFpZFk1b0Vu?=
 =?utf-8?B?TjFuYUI1TkIvNE1tOGNrcWNqQU5PbldGYlVMa1hSdjI0WlVwOHAzbndQZ0Vr?=
 =?utf-8?B?REhpempyUVU3Ym5UUEVzQk9rYkttZEpvVkM0SzFtQTdUKzZZeG9jaEhUZ0Jt?=
 =?utf-8?B?ZzZ4RUR4NTBrTncwcVFMaGFCMmFraUpxRUhHMklVOVZNRVUxdytacmFnKzc0?=
 =?utf-8?B?eUpYelBxV1E4M29ObzRkeGQ4NGI5T1Q2ZFpXRFNlY0Q3UGZpb08zYmo3VCtN?=
 =?utf-8?B?S2szZXZjQ1RUQ0l3VHhBWFl5OFNPZjlTVWFxNlRXUm9vbndOVkNrTmlKVHdD?=
 =?utf-8?B?ZHhaeGpydFNoRmcvaW1Ha1cvRm92MWlIV0dwaS8xa2wrbVpjK2thMHBSOWRR?=
 =?utf-8?B?VGlkSjZKUFRFVGpiZjl5WEN3WGxWdkJoVUZYS2J2ZDRud0JZbFlPa1RiaFVL?=
 =?utf-8?B?RDVEejJwNk5YUWp5OUNDSUJKei9TMC8va2lxaXdBSy8vOFYvVTZIRk9LdHBo?=
 =?utf-8?B?b2xXSzNWd0paU2ZqWXpDUVBpdEpNbEJmbER5T0s5YmtsQjdZOVVJelVyS0pG?=
 =?utf-8?B?NVZwV2F1L3RFdHBoems0WmptY3lNMTlsNDRpNUx1emNaeHN3dWxWclhDUnVl?=
 =?utf-8?B?UitaTTZUT0h6MnBkT2pGQ2xhamVjbnJGS0U1K2hPcldJSnAyWmlvOHZKRU5m?=
 =?utf-8?B?Lyt6VzRLQ21ub1ZiN2VUZzJPaVIxN0FMTGEvckJBd1k5UlpPWVpvOUtmT1kz?=
 =?utf-8?B?eGxzb1AxNnMwUjE3YmN5S05SZm5UMENVMmJLa1dKU0VaVHpOVkhOMWZRL1Jx?=
 =?utf-8?B?bHNDU3VueDJHNWhHMFpkcGVWNDVobE82eS9YUXkvV2RHVnVra2ozWkd2ekJG?=
 =?utf-8?B?eFlNVXJnUlNQNEdvRGN4bWF3ZXJxWDFWOXBlcTF6a2RzamlpT3dIU242RDVT?=
 =?utf-8?B?UnhDdmNTTzV5VS9rZjRYbUFVTWp3SUFzNTVET25pUEhmVEt5dGFobzdVOGla?=
 =?utf-8?B?TGJwaTRISGQybzZ1Z3hzTmg1c1E5SEdjRythOFBRRWU1bFROZENoY21TRVdK?=
 =?utf-8?B?eTRrdjV6OTFLUVlQeFhkWEIxcGhjSWlaaUhFZTdVZjlPeW1uQXBzdzZBQVUy?=
 =?utf-8?B?Ujl5T1hqdnppVGNXREtvMFFmZ1lTVWRESXdlYTNvWWFPUmFPQzlKQnZIRHI1?=
 =?utf-8?B?ZWVSbkZvUmU1alBVcThGY3UrUHZVTWpxdEpINjRFUlhQOVRnN1kvWWVMaGEv?=
 =?utf-8?B?aVhvNTFVRlNmRVJobHJ6ZUUzdVh1cFVzTGVRRG9jQk05Q0h6Qk1UeS9vbmxF?=
 =?utf-8?B?WTAzQTA0RFR2TUUyc1hHUG9nOU9aczZuT25pMjBJVVlNWE1iQ211MVpnUStG?=
 =?utf-8?B?ZzdsWWhYQjFQRy9ObHE2Z2hCQldvejJYcnA5UnBwQUVuNUVSeERoaWM0Rjdi?=
 =?utf-8?Q?914LDExBcb9wfg1YGnhula0LM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44174186089ECA41BF0B23B7019D8FB0@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abb8b13-0bb4-4ab0-b95a-08db299cc089
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 23:42:22.4320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0WOtlTR3D5MbdClRi1oJPEpZ/GLuQVjJ0a1berE6fTt0DNvTvri6HNQAPF+1dCGT1/RUDyzPGUkBjOxA5JMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB5692
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAzLTIxIGF0IDA4OjQ2ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
ISEgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IE9uIFRodSwgMTYgTWFyIDIwMjMgYXQgMDE6MjUsIE1h
cnRpbiBLcmFzdGV2IChWTXdhcmUpDQo+IDxtYXJ0aW5rcmFzdGV2NzY4QGdtYWlsLmNvbT4gd3Jv
dGU6DQo+ID4gDQo+ID4gRnJvbTogTWFydGluIEtyYXN0ZXYgPGtyYXN0ZXZtQHZtd2FyZS5jb20+
DQo+ID4gDQo+ID4gV2UgcmV2aWV3ZXJzIGJvdGNoZWQgdGhhdCBvbmUuDQo+ID4gDQo+ID4gUmV2
aWV3ZWQtYnk6IE1hcnRpbiBLcmFzdGV2IDxrcmFzdGV2bUB2bXdhcmUuY29tPg0KPiANCj4gQ2Fu
IHNvbWVvbmUgbGFuZCB0aGlzIGludG8gZHJtLW1pc2MtbmV4dCBwbGVhc2Ugc28gSSBjYW4gc3Rh
cnQNCj4gYnVpbGRpbmcgd2l0aCBjbGFuZyBhZ2Fpbj8NCg0KSXQgbGFuZGVkIHRoZXJlIDUgZGF5
cyBhZ286DQpodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQv
P2lkPTMyODgzOWZmOTM3MDlhNTE3ZTg5YmExZGUxMTMyYzVkMTM4ZTVkY2INCg0Keg0K
