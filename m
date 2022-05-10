Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112CE5209D9
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 02:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3637410E947;
	Tue, 10 May 2022 00:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130210E947
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 00:12:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emaAoGHYtuzQhsUNc8vOL0Hw4p7owzZ4TdUrf+CWKmSp3VViMYxiwXvZygUKlEbH6pAr80dq9jigAuOAr3D/3yCQiicc3tlKynRORWSnBMczwwaUwCFKhXszS9qdqzhDtGCGiL3Oc2Xhuqa/kVvGdBXmY/wTG6MlwiyhIJCWpWL1kDGXSW3A6nq22Np7PRK/Ha2/zl77T/EY0BYlF4tOrqTUeMIPBSX8KXkNdupQVVvNi9ratCgwqQg8IMhbZnVnz/g/wsDdtdADl6kmyyzWagRhk5+wybFgRK0werKCMMv6VNlJTQ7xXMYhzwkBe4eGRwcrjRScHvumwAABVpqQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ve+4N74FMtqfIJGli0cmu2/qsauxoTRY2in9s/hMuw=;
 b=BlMx5yF3fNCRkn19W3ffnAoxnfxo2JGyDtkwCVM5ki0wxYqKHct+DbiSAxwjj7bULi9ynyvH+3JiuGClLEAzs1Tz9SP8gkiWFcAKSTg7ZYzVMrVdpuxRt9YeVcljuaD4ALZgQIFbMZmKUbhFqyriQO5rHPgLTQcVmarWlw/A5hpq+LHIC6dl2bjD1DB48NAfQDTQ6BwU4MdKD3j/zpdmlXMCaLlSP3LBY29Efd8t1Mspitf0lAUmOhu289FYpNVBNVxyGXoKcCAeRXFYVxC7OklnTAkzzxeGxNdDLx+jtJj3xfNIyuARB4YQjiAfPmeFTARxejr+AwKLg/9OMsQCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ve+4N74FMtqfIJGli0cmu2/qsauxoTRY2in9s/hMuw=;
 b=Je51VBHnq7NnaR2jqmn3yT4US60AbcQQvH5UYoDRU12rvpQbrrMjPD8vp51AA2mKQAAknobtpIOoBIbVf6wQFRS+CBZA4gqRo5oBmiytEaN6tgBxJNrL94A3DdMDLoWs3+vUAiNLzavo1LGcr5ZxEX1nEKjGWmg5NbR+dE5MxSY=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by DM6PR05MB5978.namprd05.prod.outlook.com (2603:10b6:5:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.12; Tue, 10 May
 2022 00:12:43 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5250.012; Tue, 10 May 2022
 00:12:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Topic: 5.18 vmwgfx seems to break booting VirtualBox VMs
Thread-Index: AQHYTYGHtZBezSHFMEi22ECSmBgwWKzqxK2AgCvHXICAAN5IAA==
Date: Tue, 10 May 2022 00:12:42 +0000
Message-ID: <41AD6A60-9C2C-4545-8A62-114B07C0383F@vmware.com>
References: <2bd4b06e-7577-d7d7-5f2e-264005b316a1@redhat.com>
 <84c30eb2dcdc330ea54aa1fedba9ae0eb0826068.camel@vmware.com>
 <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
In-Reply-To: <087a0754-422c-0d88-a5ed-c03f2b5906c2@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9544033c-9a7f-49f1-2fc0-08da3219cd84
x-ms-traffictypediagnostic: DM6PR05MB5978:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <DM6PR05MB59783FE1CEC23BDD4943FB5CCEC99@DM6PR05MB5978.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IwkX/rwHXS6fXLlycnFmuB0SvJApO0yftRrcJBgblX3iilDB2lBRMmPRU2GOE8uUK4evubGpRS3ibscLpRrnQ6LwSUeASi88Jj22izEYbtWqfD/0KH5cB+afRP0Fn1ScJm7MRhgt3rrmHB9JEZu2D/axi7ouQqwKD5CHxw0L2JC0iC/H4T+U3DFMObcFs2ysqYRMbouAUysDI801PLfegUIl248818ddDnOc0/RXfk+MdRTrfhnSmFQvRIPQStjDD+3zAaBAIIywT92aMerhRsGmBhZ1n+NajuQItRcA08uN86J43qDRlj/qPLgyDMnB22LoNfTcuTS6htz0LrH7VPWV0BcDABmPeHx67nAgWtd9oV66GP6T/hLbfuLgZot45vy6AQ6vwDGc/wR70v3DeHvGGGvKHRwDP2fWYoKVGouvzK8MM8q95b+TgKEh4OWWwAQPyYF3KYjrSKRNRRuS8bDjHhZIYWQWgpQ800jSg7RniU8kuIJrvm0blQwFVJK6Kn7oe13tr2ADDK0IsNeTdDAxYSIFWDjsZo6RZ5JiGeuVlTveRG0UbuD6xZnPuHaA3re5yjbZ2gJDRNZioOZsBVOk/iBqZH7pPSIgDioePLd2uhslu296ijcJyAVG0afBVWjNzN1MaXpbo3PKVfU1iPBEpA6MIEpDQqYK+2JoMN38OU3il/uYxnepqRgXwT+PVeCTy8oD1g876rkyTIlOJ0TgwFMuDmlqg4U/Vyku51Butd5TU4bTDa0ktuVQm4B4JkNifkpt1a0dPzd+VEi0nQ8qO3n9lR8xLVZbse8RjYUFUcTqELWPJxR+tQpOtb7PWHV5dqUB97n8zbCuru2/1gVv8YtOJjIoVL6WSR4/lGVqdMVHZy4ZH1xdwOb/V8pbi7KyJfVDR2O6LgDn+5aBhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(38100700002)(71200400001)(45080400002)(508600001)(122000001)(38070700005)(966005)(6486002)(5660300002)(86362001)(53546011)(316002)(6506007)(54906003)(66946007)(6916009)(66556008)(66476007)(91956017)(64756008)(76116006)(66446008)(8676002)(4326008)(83380400001)(33656002)(186003)(36756003)(2616005)(2906002)(6512007)(107886003)(26005)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDlmM1A2NjhXaEJZdmhzZVY4U0NGSlhhTDhkTDR1WWVzQThhTjdrRHZyOGVN?=
 =?utf-8?B?M1JYbmhWdjBQRlFwUUtid1pKWVRUdm9XVCs2alI5aGhuMWtUSEFuUml0Qks4?=
 =?utf-8?B?cVVrOHNwbzNzWExLNUwzTmE2RHpialZOczVXSmdVUUlNR3lNbDVHOHpqeDdH?=
 =?utf-8?B?cndxdnJTZGQrR0pGckE4UklxcUpyckxYcjhPNXpZbDYxdmVVSHdJeENGQi94?=
 =?utf-8?B?VWhOWFJ1SVdtMkgvZjBTMnptQkN0U052NHdpMGFEM1pDdHRUZHMza2lxa0ZQ?=
 =?utf-8?B?a0RQVlhWN3c1QXluRVZ5WGxuaUtsRDV6OWVrSG5ISWQ1SWlhZ2dLTldUeHFI?=
 =?utf-8?B?UFQ1ZVAyVkR4WGE0NFhDWnc4QzY5SmtHNnhEUEZnVEFmd3hGanc2Q0dXTHpO?=
 =?utf-8?B?OEpoOTQrS2NJaDduQUdEUDkwSTM2UVkvM1Ztak9zamsvWUg5NTl1UjJRVnJ3?=
 =?utf-8?B?aUtaeW9JbFVyWGtyRzgxVWlIOGkzaEVrS3FEV2ZyREJVZ0lQY0wwT0ltYTVw?=
 =?utf-8?B?YjhVTnVQNE05ODhvWlVGbDAzVTN3YlBaMWlpM3IvdlFMb2N4L2RsUklteC9U?=
 =?utf-8?B?Nm9wdnVPWS9QY1YrU3RyaFJhSi9OTW81RWZLeldhL3dFZUJSRE10TjJkV1Ji?=
 =?utf-8?B?RWprN0pLd1h4a3J6QmFORkxsOXMyZnNVZkhLUWNXKzVLSHFOZUJzRG5qeTAx?=
 =?utf-8?B?L2lwR2FnUGkvS04vWHBwZXlBcDVhUklVZmpMN2R3QjF4TENTd1BZUzA0S2ZC?=
 =?utf-8?B?UlJrNjlBTVVpMTFuUjJyRnhFc2Jrd0g4a0lhcDhaNlVpakpTQUZKd3poTTJx?=
 =?utf-8?B?eWkvOHYycHlHTmhlVzlLSXlRMXN6YTFJajFuQ0NTL3pteW5CUSttcFZYWHcr?=
 =?utf-8?B?a1JEVlM4VHk2bi9mUkFza2pxd1Q1WjlMMEFDQTJ6YkMxeEJrR0dyT0NrRUNh?=
 =?utf-8?B?M0hsdUd6MjRSejFZMFVJSm9rUXdsanRPSk50QVNoeC90RSsyTUsxN04xcmZq?=
 =?utf-8?B?Mm15cHIwRlU0NnBhL29IaE4zMFFZMHQ0UDUreDJ4SGtkL3pwN084SkRFZEpU?=
 =?utf-8?B?NlhDalVRSE16UkIxQUwxVDduK3QyaDd0L2pnS1k4NGtZNG4vZ0FPK1NOYnd3?=
 =?utf-8?B?M09PWHBvRHBJRzFBd1UwaUtrU0tnNmZKdk1MMW9rejVWZjc1S0ZYWmVCWVNT?=
 =?utf-8?B?WkU1cU1jVFlXTmpiTU5NT0hwYU1NZ1BJcjI4MTJRUnZINHhVRmtqbEVWZ0k0?=
 =?utf-8?B?Q1FtQUdUSWpGd0ZTemkwV2NBVHFRUlNNeTBoK0JZZjFCcXpGU2ZCcFVzLzZh?=
 =?utf-8?B?a25ud3g5ak44N1NKbzZ2SDVNSjFLUXNGVXBQemFiR1hWd3BsUjVIeHZFc2pU?=
 =?utf-8?B?S3VMTXVNRWsrWWFiY0NSRi9kbEtPaE9Gb243UnNLR210WE8wak1mSEQ5ZGdS?=
 =?utf-8?B?TStXWUo3WGhHRzlDMm9TWHVraEVtRVJGQmNTeGRjQ3F1WWZsaHBqQ1d5L1Jw?=
 =?utf-8?B?Um1xV2FrS3VYdWNveGYwNi9ITk9nc0tTbTJVMG9SbW1zazhPaXB4eEg0aWNp?=
 =?utf-8?B?azdzODMvVzViRFFiVm5FbnBqOFdmbjRDNWlueGYzSjdITThJQldDejR5RzVn?=
 =?utf-8?B?MVp6c3Z4Tmp1L1BCQjdrdHJyRmFIVU9aaW9LaW1ERTdoL0dvbExRRjRwWnJk?=
 =?utf-8?B?aXE3MFg1SzRhK3VuaFI5Vy85blhTYnVoTlpyUDFCclQ3ZEh4RjNYd1BRV0cw?=
 =?utf-8?B?eG5ROGZIMXpGcDFjSWpmcU9tZGpjOU14TStHYzJoNVBkRHpkYjlKYUlXaVdV?=
 =?utf-8?B?Nkl2RlI1VWtjV2p4T1NGa1JqZXZFbXFwcWJMQjBlNTFTbmN5Y2V6Rjlva1ky?=
 =?utf-8?B?N0RuUHJYaE1Hb0FWd3pGdE1YR1ZDcUphcWo0ekp2Q0FQUHY3TWVNeEhNNnk4?=
 =?utf-8?B?cnp4YnVOTFVWeVdBZGwzaDNtZXdrWnJUcFlIZEJPVm9SSitIdmpsZVdTTy9h?=
 =?utf-8?B?anM2TE40YVpNRDVhR2R4UWgwbXJRVkIrNlFBRm5FbzMyRUxwTUN2NERkbFh2?=
 =?utf-8?B?L05WM004VnIyUThKbHhGelV5dGpET0VNYm10Q1hKblR5YWpDMVR2VWFtbE5T?=
 =?utf-8?B?R1pYd0RhR0wxdDdIMTBqMmovT1psWWk4am40UGYrTUFRU2Y5LzB2RTg3VTFn?=
 =?utf-8?B?R3JxN2NXa1Zodk9SdERWU3FJdVNYMk1GTjZoQlhDVGJuMWR4NUI5Z2FjSHRV?=
 =?utf-8?B?MTRWbUladUx3MHJISjF0aFJjOXR4UjFlOFRiOWZ0M1lBS1BoMjdheUJjazBG?=
 =?utf-8?B?QVFObC9UWUZuclBHbHpLM3RCaXZuUUtoeFdVSExoN1lkdFJpc0Rmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B59287D061C8D74CB1D031523B4537BE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9544033c-9a7f-49f1-2fc0-08da3219cd84
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 00:12:42.9285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6qRqAEIwSvl/k0ZfvgESd1LrGq513qYQi18e8r4GlDX3zF3xbNqb79acRcMDWbErUtkamgWRW1wO7pdR0QdpyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB5978
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gTWF5IDksIDIwMjIsIGF0IDY6NTcgQU0sIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gSGkgWmFjaywNCj4gDQo+IE9uIDQvMTEvMjIgMTY6
MjQsIFphY2sgUnVzaW4gd3JvdGU6DQo+PiBPbiBNb24sIDIwMjItMDQtMTEgYXQgMTA6NTIgKzAy
MDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+Pj4gSGkgQWxsLA0KPj4+IA0KPj4+IEZlZG9yYSBo
YXMgcmVjZWl2ZWQgYSBidWcgcmVwb3J0IGhlcmU6DQo+Pj4gDQo+Pj4gaHR0cHM6Ly9uYW0wNC5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGYnVnemls
bGEucmVkaGF0LmNvbSUyRnNob3dfYnVnLmNnaSUzRmlkJTNEMjA3MjU1NiZhbXA7ZGF0YT0wNSU3
QzAxJTdDemFja3IlNDB2bXdhcmUuY29tJTdDODljNWExYWRmZmZkNDM0ZjEwMmMwOGRhMzFhYWFi
Y2MlN0NiMzkxMzhjYTNjZWU0YjRhYTRkNmNkODNkOWRkNjJmMCU3QzAlN0MwJTdDNjM3ODc2OTA2
MzQ3Nzg5NTMxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0Ml
N0MmYW1wO3NkYXRhPUwzcmZ3WDBSMFhYZ0VKYkk4OGtZJTJCN1NySXF5SnR1QzdWTGNOOTdOVVN1
ayUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPj4+IA0KPj4+IFRoYXQgRmVkb3JhIHJhd2hpZGUgVk1zIG5v
IGxvbmdlciBib290IHVuZGVyIHRoZSBWaXJ0dWFsQm94DQo+Pj4gaHlwZXJ2aXNvcg0KPj4+IGFm
dGVyIHRoZSBWTSBoYXMgYmVlbiB1cGRhdGVkIHRvIGEgNS4xOC1yYyMga2VybmVsLg0KPj4+IA0K
Pj4+IFN3aXRjaGluZyB0aGUgZW11bGF0ZWQgR1BVIGZyb20gdm13YXJlZ2Z4IHRvIFZpcnR1YWxC
b3hTVkdBIGZpeGVzDQo+Pj4gdGhpcywgc28gdGhpcyBzZWVtcyB0byBiZSBhIHZtd2dmeCBkcml2
ZXIgcmVncmVzc2lvbi4NCj4+PiANCj4+PiBOb3RlIEkndmUgbm90IGludmVzdGlnYXRlZC9yZXBy
b2R1Y2VkIHRoaXMgbXlzZWxmIGR1ZSB0byAtRU5PVElNRS4NCj4+IA0KPj4gVGhhbmtzIGZvciBs
ZXR0aW5nIHVzIGtub3cuIFVuZm9ydHVuYXRlbHkgd2UgZG8gbm90IHN1cHBvcnQgdm13Z2Z4IG9u
DQo+PiBWaXJ0dWFsQm94LiBJJ2QgYmUgaGFwcHkgdG8gcmV2aWV3IHBhdGNoZXMgcmVsYXRlZCB0
byB0aGlzLCBidXQgaXQncw0KPj4gdmVyeSB1bmxpa2VseSB3ZSdkIGhhdmUgdG8gdGltZSB0byBs
b29rIGF0IHRoaXMgb3Vyc2VsdmVzLg0KPiANCj4gSSBzb21ld2hhdCB1bmRlcnN0YW5kIHdoZXJl
IHlvdSBhcmUgY29taW5nIGZyb20sIGJ1dCB0aGlzIGlzIG5vdA0KPiBob3cgdGhlIGtlcm5lbHMg
Im5vIHJlZ3Jlc3Npb25zIiBwb2xpY3kgd29ya3MuIEZvciB0aGUgZW5kIHVzZXINCj4gYSByZWdy
ZXNzaW9uIGlzIGEgcmVncmVzc2lvbiBhbmQgYXMgbWFpbnRhaW5lcnMgd2UgYXJlIHN1cHBvc2Vk
DQo+IHRvIG1ha2Ugc3VyZSBhbnkgcmVncmVzc2lvbnMgbm90aWNlZCBhcmUgZml4ZWQgYmVmb3Jl
IGEgbmV3DQo+IGtlcm5lbCBoaXRzIGVuZCB1c2VyJ3Mgc3lzdGVtcy4NCg0KSSB0aGluayB0aGVy
ZeKAmXMgYSBtaXN1bmRlcnN0YW5kaW5nIGhlcmUgLSB0aGUgdm13Z2Z4IGRyaXZlciBuZXZlciBz
dXBwb3J0ZWQgVmlydHVhbEJveC4gVmlydHVhbEJveCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgc3Zn
YSBkZXZpY2UgbGFja3MgYSBidW5jaCBvZiBmZWF0dXJlcywgdm13Z2Z4IGhhcyBiZWVuIHB1dCBv
biBkZW55bGlzdHMgYmVmb3JlIGR1ZSB0byBidWdzIGluIFZpcnR1YWxCb3ggaW1wbGVtZW50YXRp
b24gb2YgaXQsIHdlIGp1c3QgZGlkbuKAmXQgZmVlbCBsaWtlIHBsYXlpbmcgZ2FtZXMgbGlrZSBo
YXZpbmcgdGhlIGRyaXZlciBxdWVyeSB0aGUgaHlwZXJ2aXNvciDigJxhcmUgeW91IHJlYWxseSBm
cm9tIFZNd2FyZT/igJ0gYW5kIHJlZnVzZSB0byBsb2FkLg0KDQpJbiB0aGlzIGNhc2UgaXTigJlz
IHRoZWlyIGxhY2sgb2YgbWtzU3RhdHMgaW50ZXJmYWNlcyB0aGF04oCZcyB0aGUgaXNzdWUuICBX
ZSBjYW7igJl0IHN0b3AgZGV2ZWxvcG1lbnQgb2Ygdm13Z2Z4IGJlY2F1c2Ugb3VyIGNvbXBldGl0
b3Igd2FzIHRyeWluZyB0byByZXVzZSBvdXIgd29yayBhbmQgZGlkbuKAmXQgaW1wbGVtZW50IHRo
ZSBmZWF0dXJlcyB3ZSBoYXZlLiB2bXdnZnggcGF0Y2hlcyBhcmUgbm93IG1vbnRocyBhaGVhZCBv
biBkcm0tbWlzYy1uZXh0IHdoaWNoIHNob3VsZCBnaXZlIGFueW9uZSB3b3JraW5nIG9uIHRoYXQg
ZGV2aWNlIGluIFZpcnR1YWxCb3ggcGxlbnR5IG9mIHRpbWUgdG8gZml4IGl0LiBJ4oCZbSBoYXBw
eSB0byBzcGVuZCBteSBzcGFyZSB0aW1lIHJldmlld2luZyBwYXRjaGVzIHRoYXQgd291bGQgbWFr
ZSBpdCB3b3JrIGJ1dCBpdOKAmXMganVzdCBub3QgcmVhc29uYWJsZSB0byBleHBlY3QgYW55b25l
IHRvIHNwZW5kIHRoZWlyIHRpbWUgaW4gdGhlIG9mZmljZSB3b3JraW5nIG9uIGEgZGlyZWN0bHkg
Y29tcGV0aW5nIHByb2R1Y3QuDQoNCj4gQXQgYSBtaW5pbXVtIGl0IHdvdWxkIGhhdmUgYmVlbiBn
b29kIGlmIHlvdSBoYWQgdHJpZWQgdG8gYXQgbGVhc3QNCj4gcmVwcm9kdWNlIHRoaXMgYnVnIGJ5
IGluc3RhbGxpbmcgRmVkb3JhIHJhd2hpZGUgaW5zaWRlIGFuIGFjdHVhbA0KPiB2bXdhcmUgVk0u
IEkndmUganVzdCBzcGVuZCBhIGNvdXBsZSBvZiBob3VycyBkZWJ1Z2dpbmcgdGhpcyBhbmQNCj4g
dGhlIGJ1ZyBkZWZpbml0ZWx5IGltcGFjdHMgdm13YXJlIFZNcyB0b287IGFuZCB0aHVzIHZlcnkg
bGlrZWx5DQo+IGFsc28gcmVwcm9kdWNlcyB0aGVyZS4NCg0KV2XigJlyZSBhbHdheXMgcnVubmlu
ZyBGZWRvcmEsIGl0IHNob3VsZCBhbHdheXMganVzdCB3b3JrIG9uIHZtd2dmeC4NCg0KPiBJJ3Zl
IGEgcGF0Y2ggZml4aW5nIHRoaXMsIHdoaWNoIEkgd2lsbCBzZW5kIG91dCByaWdodCBhZnRlciB0
aGlzDQo+IGVtYWlsLg0KDQpUaGF0IGxvb2tzIGxpa2UgYSBiYWNrIHBvcnRpbmcgaXNzdWUuIGRy
bS1taXNjL2RybS1taXNjLW5leHQgaXMgY29udGludW91c2x5IHRlc3RlZCBvbiBGZWRvcmEgd2l0
aCB2bXdnZnggc28gYW55IGJyZWFrcyBzaG91bGQgbmV2ZXIgbGFzdCBtb3JlIHRoYW4gYSBkYXku
IEnigJlsbCBiYWNrIHBvcnQgc29tZSBwYXRjaGVzIHRvbW9ycm93IHdoZW4gZHJtLW1pc2MtbmV4
dC1maXhlcyBvcGVucyAoYmVjYXVzZSBpdOKAmXMgYWZ0ZXIgcmM2KS4gSeKAmW0gc29ycnkgeW91
IGhhZCB0byBkZWFsIHdpdGggdGhpcywganVzdCBzZW5kIG1lIGFuIGVtYWlsIG5leHQgdGltZSwg
SSBzaG91bGQgYWx3YXlzIGhhdmUgYSBwcmV0dHkgZ29vZCBoYW5kbGUgb24gYW55IGlzc3VlcyB3
aXRoIEZlZG9yYSB3aXRoIGxhdGVzdCB2bXdnZnguDQoNCno=
