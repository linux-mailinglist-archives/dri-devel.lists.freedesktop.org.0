Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F866373D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 03:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA1310E47A;
	Tue, 10 Jan 2023 02:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11012000.outbound.protection.outlook.com [52.101.63.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8DF10E47A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZi06+FMlM+dEM/DCBdMVZnV7jKSAt+a3DuAOP3Ul9g8O0UloU5kAAn57mgQw7FvEB3WKXh+hvUceM2KxeIhh0XMScUX1OnnWZ8/tIcsjhyVeBWrSml9M3bKLslgNxeyGo/p1QnMNrv1OFE6sugKHYrCCQJHRLJocRZriZH3Er0WVzllZ4XIxCBwOdd3wmmobTKcnfw6sHQEkxl5q0tYDai9N12Ct+LCFxK+TqbDjqYZ63zW7UOknNWNA55zLtDLcHTZIybKNHwWN4sycjyXSfSBGdgZatKbV215FICes0MK3oGEX4J0XVNlXorbyYCoXoQ49Di0VDzB0QRtSpckqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNkPfZQGlkz1MyPmr3nrglzMbU7sKZ64p0Wj37cSeww=;
 b=bQH38Yzlch4Bb7wuo3xy+iLeo+ixZ9nE1fs5GTSK0buV3M9hZn4/+LoekJ6LXwP84tN9TJt/pZjuR3RDaxIV/tcM5X1XKiJJ9JdY9jVGkYSNRDzwAqT4WXf9yqoXtVt3figywtE1bhNeqamcBg4YZjkCHnGU+E6Kew7e44eDNbFaszLTVqtFmiAGn606kAcjdJVQr2OwPdESsGPy+fVKI5BgOOgDGLuQaFi9QJvJDyM5tAFxDnBObBaYtrbY8uOibtHsS41901C5jCAHCwCGLUQ27KziN08PsJYXblxOg0LJ2ox2EzFDIBfzpi+gHuZlrA6sXcy3iK06iUkFoz/ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNkPfZQGlkz1MyPmr3nrglzMbU7sKZ64p0Wj37cSeww=;
 b=XCjXPjqk/dqDx61B6KjKXVeNgvokcWJTWZIHQ4B9B5lqY3kdYBNYYb+XlVLPafLHzrh5NDWVefo86Y8pCY+ztZXnHP7uAwzoDnamLDHG9/UHC0hLLWPTy0kuDFA08VPm2Vyu2slDcWIBhs+CDRgR/oVszlLHgwxKFokd9WlVLII=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by MN6PR05MB10211.namprd05.prod.outlook.com
 (2603:10b6:208:46c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 02:22:17 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 02:22:17 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Remove rcu locks from user resources
Thread-Topic: [PATCH] drm/vmwgfx: Remove rcu locks from user resources
Thread-Index: AQHZCmFsYfJsExy330aOOVRQAPf4xa6V8BYAgAEv3QA=
Date: Tue, 10 Jan 2023 02:22:16 +0000
Message-ID: <576aae7d8d6fe25ffff29c90aa946821b1215951.camel@vmware.com>
References: <20221207172907.959037-1-zack@kde.org>
 <f6efb277-2970-39a9-47d7-ed9c4092b063@suse.de>
In-Reply-To: <f6efb277-2970-39a9-47d7-ed9c4092b063@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|MN6PR05MB10211:EE_
x-ms-office365-filtering-correlation-id: 8c85b46e-f738-4b6d-3d83-08daf2b17e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JEQp2a3hzyc+042poeFiloq2ZNTRstc6vSJmIfbbpLGCiYOuPg+dpd5S3Vzt5wS7KTpE3AKxtfR12R9p4jSYGiSh3A/tKaWkv3Y0w22Bb5lE6Xxg6PWNnj6hzkdPpfMJTc232DabybqT/leVMQEOqtoSUVLrWgdZ1GItKwjI5r7STVIyVYO5/skyAUkhzgTdq1G2f5zhV2JT2O6WBlXKHAdI7ZtEJyJ1UvKVXfd2tN5izkYt8Hi+O9EcETntiW40FQjx0e3s3sFUCPusvwQ3zXyCmaTCxfGF9oHpWUuQhlDBsquvUqrrOUY0zd9r/lktu1ajvstwktSeota+twp5a3xa0TXOLUH9p7kQrkDRjXrL85MVmuq/MFoJYfPgkX+E+rTGBN312lW16DItigrneaZHI+JegwGcjH0+9+yAVAdrD40aBP5mDKxz08Wj0yHXw37CQowZRrR5UX6un/bSSJK7y8DN9POZLS4v0LUweaEmUhqL19jhZ3FDOvC7+c2u75G8Yrka4BZKpMpKX5tvjIR7RVIgya7LzORYUZsyrXHbx9jw/KQMEJx908c/rUTXwQs2sIyHphTHX+BuWxaILxE6SS9/tqonPfwWBHmh7LPMMBcwXYL4Igxy4V9mlgLD8gJQTA813maGfIPS5Q5UmtIFh09bAFOmsQ2zE6TF/YjR5aPgmNJjmet83uKHo+pOXSPRj+dl4uRoCl7+MySr5d38372bVMg82ALOQ2tzWOHcUwBxv8Hk2pFJ09liGaCe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(2906002)(558084003)(71200400001)(6506007)(6486002)(478600001)(26005)(6512007)(186003)(107886003)(54906003)(316002)(76116006)(110136005)(2616005)(8676002)(66446008)(66476007)(66946007)(66556008)(36756003)(64756008)(4326008)(41300700001)(5660300002)(122000001)(38100700002)(38070700005)(91956017)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUhrMUNpWUVBRzllZXp1YlNuczJheUV5RU5iR3JJQUdEZ3ZnYkhJb2Q5UUY5?=
 =?utf-8?B?Yk51L1J4UlNNRklJMWFRWHpWV3dWb1pMRDhTVW5ZOTI1QVZEbjhFa1NUMDBU?=
 =?utf-8?B?V0NBMWsxOUZEdW85azBmaGx0UnZVOEdlaDhUY3VxbmtWak15OGxhbFUvQmVW?=
 =?utf-8?B?TGJGVVF0endacHl3Q0psTlJRRFRpNkllendyU2gvODR3YmdqWThIRDBZUllo?=
 =?utf-8?B?UmNXajFLWWlnWDBDL0xEVndkQWVJM1N6Y09WRkI4bStjU1lDUnZtTExJYjND?=
 =?utf-8?B?UU04Tm9uaGVjTUR5VWkwQzJ0R3J5cVMyclcvOVVSdnc1MFEzcEk4dncwcDk0?=
 =?utf-8?B?aWlkZHppNGZoNGlNZkMwTk1BUkVVOG5XdmZzSm5uYlZSVEs3N0FJZGZJd2lS?=
 =?utf-8?B?anlpaTY4anp4bGZLUlhyMjl4UldOdmE2SUYrM3hRb1I5S2tJNDNsRmNQTlhG?=
 =?utf-8?B?eVNiNnJoNnk0ekdYV3BHWVBNOEVwWnROVjU2c0FpMGIyQlZ1Qmpzckd3RnRi?=
 =?utf-8?B?VjZHNlV0cHN5QVFXcEJaRFNFSnZzQXplZzlRWkd5WEJpSXZKRk5nSnZWeWIv?=
 =?utf-8?B?M2dlMmdxZmd2OFQ3VEVjc3orU3paeXlCVTNjTm04TnIyU1ZacGI1RmVhd3J0?=
 =?utf-8?B?SG9HNjZtRk5BSG5jam1EZUlmL0ZmQm00RzREcG52azdEUm1qb2Q4M1FrYWs2?=
 =?utf-8?B?M1hBTFJGSFRnY3FhR1VtN1BJazZibVk1bEZtdXVQVTlhYnZmRTVFc3BmNGVa?=
 =?utf-8?B?T0YyQTVWdmlPZjUvS2hTdG1sY3VlY215YlNJSUIxR2tWSTJXeWp6Mk9hWVhN?=
 =?utf-8?B?Y3lNSlJvZnVyUXFIeldmTkxFbmhYWjA1N21LSm91ZmhnZ2RWYVRMQWNaazdC?=
 =?utf-8?B?RktMWDBHTzFVUURaK2FUWVk1aklBMnlUZG9Rb3lVeW1penFUMlhDNWpINFpr?=
 =?utf-8?B?Rit5S1VjMEhPZ1liZnlQalg0dDNzZkV2S2NZV0tsZlZ6cEFnTnlHSGYrUU9C?=
 =?utf-8?B?WFZVWTBXWGVnaHhtdEJ0Y2hTOHdhSW41VmxwemkwOWVIOW1WYXozUGt4KzFx?=
 =?utf-8?B?SndPMkRIWDkwalZMdHZQZ3ViTWFwMklDRUxhSFVBc2pvUXk1bW44NmpnSEdy?=
 =?utf-8?B?K2tjcFpzcUVGWUEyaDQzY1NUaVRpd0c2Mk84ek5VSGQ0UzVNZFo4dDdFUHZr?=
 =?utf-8?B?bzFTQUYzcXFnbi9rd2F4RCtkWGlOcTNlc1dQTlRieXIxYWpVRXo2VXRrT3I5?=
 =?utf-8?B?bUFvbnFJbXZURVNyOVZpVjJuOEh5OEJvU3VUMXNmcUI5ZTlOWnhRNWUxYkFt?=
 =?utf-8?B?eG9yS0tlTFdJZndtclp4VmhQT2hlUHlJRXl3QjVQS3V4d09MbHNRVzJReTRF?=
 =?utf-8?B?dW5FRmk0Y05oRG9jZmsyN3NuNG1LVThETzdyZXpPdTRpOGcrdnNVNEhpUlo5?=
 =?utf-8?B?WXhnVGtTQkswTENGVmJaSGpCUzE3T2JwV0thTzdDYmhaRVZsKytCaXp6YVNu?=
 =?utf-8?B?YnFoNS8yOVZvQS9xVTRtbGFhRE1abUEvVkx5UkdzMUdORnFXelB2OWlPQ1d4?=
 =?utf-8?B?L3c1NTA0UytwSytDOStKYXlEYzhxZ3VhdnhTUGRnZ0VDTHZZR0ovYTNmaHBo?=
 =?utf-8?B?WDNYVVBYNHpBZHR6R09Wd2NKajNwbS8rdUhTLzhZcEJvbWpSN1JpUnhsbGds?=
 =?utf-8?B?Y1lTRS9GS0U0aDA2aDJqdTJIUzdnZGdWcDVRWmxGVGhyWkpsUEs0bkJ0aUti?=
 =?utf-8?B?bDBmRUVpellwZWUybmdQMjVwYk02Rm5HV3V5M3hJeUp5bm40RjQwQ1RxdjNG?=
 =?utf-8?B?VTAwSHVzWFE2NTVKdWxDMGZlMUZJMk93S0Q4RHdLa21BRWJZNWxmV2NHMXV5?=
 =?utf-8?B?TTNmZ1Ava3MwdHlmZnkyVmRreDU1cVh5QzNDdFQ1ZVFqak80ZGkyVzdseW1N?=
 =?utf-8?B?UVBQL0lYb2pteFlLVFIxTWl6SFJOWTBwb1QzQ2x3VHgxTG9JM2dYOWI2RFB1?=
 =?utf-8?B?UnZPZHZyQ1ArdlN6MzM3LzJ4MVh1VklaaGtocENEdGd2RU00ZHZUajI1NDF2?=
 =?utf-8?B?azVVUGRSTWtzbWkweFh5d2I2QTFsek9jNkxacHpiVitXL1ZOdmFGWGkrbU9N?=
 =?utf-8?Q?Njn+N72Xl9gtRSJHH1mTPhhQY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C820B68E35147B43B7F50620678975FB@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c85b46e-f738-4b6d-3d83-08daf2b17e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 02:22:16.9353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nKGh1T7fyN5R8VhFhFqB2eb56BS3HbfEjJK207uVdibOJvuCJbU0VYND6T5umPCYXdaopVD9gmXr+GK1OV5otQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR05MB10211
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
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAxLTA5IGF0IDA5OjE0ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGksDQo+IA0KPiB3aGF0J3MgdGhlIHN0YXR1cyBoZXJlLiBUaGUgcGF0Y2ggYXBwYXJl
bnRseSBuZXZlciBtYWRlIGl0IGludG8gb3VyIHJlcG9zPw0KDQpUaGFua3MgZm9yIHJlbWluZGlu
ZyBtZSBhYm91dCB0aGlzIG9uZSEgRGVjZW1iZXIgZ290IGluIHRoZSB3YXkuIEl0J3MgaW4gZHJt
LW1pc2MtDQpmaXhlcyBub3cuDQoNCnoNCg==
