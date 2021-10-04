Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610F421110
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201E56E156;
	Mon,  4 Oct 2021 14:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E316E156
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 14:12:16 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194DCXEu018669; 
 Mon, 4 Oct 2021 14:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=SV3czbvHF2dvqZ61qpH/4uCGkRnuDn+4DBK4AtAqKxs=;
 b=T4ACdXe6m1Ign5lYM3e/f+u2lP6oLqIEBI/uN94auw4l3FPjiW5hh9uLdHHb/5c9pAnK
 GnkEQVuwpkVToWrdfen5iAvYgFjLKTIOXV1lK3zzCQbq8miqpNB+DoQJPYZ8Vh2bbGST
 vfgOrgPVmGNvNMumtc443wzFkHu40Eg9DuRSxeLYcP96+VAt57LeH3Lj9JOcfDs3eVma
 CjUC/ds/fDP+savlwK3iaq3ep4kCAfaiiGgbJmnPDy2RTrSeuBg2h2o6naUUP2VZalYi
 2bIg3Gm04DlgprlNky6STmKaMQnH5xCXzxqfWXnHCTKqRoqQFdDtxY1cJmuKDjsnRxoY ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bf9m04qpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 14:11:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194E9toP154385;
 Mon, 4 Oct 2021 14:11:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by aserp3030.oracle.com with ESMTP id 3bev7rqgnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 14:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhmFxTWiLABlf1sOB043y5Ptqn71SnoDhYmoUUZsioF6Fm+DJESrJJc0sCzDmlVR3d5UsU2LOKWm8OoAAE1nd+Tx8G8RATcpjt9eu9hYoHB3an/9RR469IwykADVHIGV2xtGCCYmA2sJ1m+gT+KyhK+FNOJ5TMruG225kzemSuvR0UF0h9YMSqbnVUSBYoCaUJojSaX16D0LIQDtPU7sIdPK8TD/TINUf3Rf8H7inTlPHVDVNRVtnFFzPk1j9nE9k8IBGQR+UOG90+z8pY+hTjNr3Sh4WihB7Iudj1y63KRzcUe1f/kvUy3KgBv4fcfkkFzgZTGxK4+Pp4qnI+/BQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV3czbvHF2dvqZ61qpH/4uCGkRnuDn+4DBK4AtAqKxs=;
 b=IdhuWAXcS29OuqXRth/SKISEyGI7AL/L3RuaK7RtVdi2N1/OarYfWBb9YBtV8Y6xLk4/zLrapqqE6W6y/7FMT0Dzw7JLoh8snM96cjF4uBFvh4h67AlXmNprEz89RvZJ4TA/XQl5Di7Y3sXHbgm6z4hocTqNDyxwDxLszM0pqe9NNpzdqJzTAy92SKpdGHCXxIIBaNmbB9jFfJz8n9SlyHKT/3QsUhWmMPRNBaDvAPfeXhuwpuiX/3R9OD8WQA2daVV2BMVHTmLpXMdxF9SDWz47WwZDG53YLdQKd2OMVUKz0rB1dP1xpjSHBaypHElU9rLdK6MwxTN2xnGb9FUXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV3czbvHF2dvqZ61qpH/4uCGkRnuDn+4DBK4AtAqKxs=;
 b=yNy+7OJRZLvrQ30xe+NkOr2o1cPGD9IjFDM2y2FMBVCnwkaJK6wY8yncFge17PJAtCKrjfKDnlRXHrIPv6WywMpPl3hi7trdpZFR7C6VNnStyfzAUwySKrG8VrBpvFfyhhhqWpLzoQskph9h0CEPlhmyl2TGcrdN3FwulswrmgA=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB2438.namprd10.prod.outlook.com (2603:10b6:a02:aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 14:11:54 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 14:11:54 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Ainux Wang
 <ainux.wang@gmail.com>
Subject: Re: 572994bf18ff prevents system boot
Thread-Topic: 572994bf18ff prevents system boot
Thread-Index: AQHXuIHb1jcBl5uEwUiwoZESWfnCi6vCbBgAgABr94CAAAlEgIAAAToA
Date: Mon, 4 Oct 2021 14:11:54 +0000
Message-ID: <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
 <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
In-Reply-To: <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98a368f8-29df-4deb-dc90-08d98740eb85
x-ms-traffictypediagnostic: BYAPR10MB2438:
x-microsoft-antispam-prvs: <BYAPR10MB2438873F041C855B3025401A93AE9@BYAPR10MB2438.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RhXhG57HLstOc1izTT7k4EieZPssKfo7FGbuMttfq3PzAEuufrlEeDShRSsYgxpi2OZwjRbIIPE/+CO9YM9JTcGrIO13btyL/74W4MEMehorNusmmTQlhu0dbzX3LvpGTKZ8JDGJYfOkCc0zrYpmg4aaHeTRg/FW5ynW9bB+nqflFhBE3yYc2Vut6muDSCgRsYizUALDc2v/PtYES+6g/w+U44E01NS4uyZxhrwzyCWDxY4uaC8a38dG1+5lxtJf7AdhSkE3q8Qeg8xWfT5Xi3/z/WjBf0uQaZh3PPtFeXVeTi/9EWyGm4CvaU76WZO9RUjtmazdDaudKewpHhMUsx40w+M83brLqd9cESw9Z8EvuStoc3TSyywmgsB7514GzwNNZegnYvoBlyJxvf2PlCF3gmNOPAGOBTi8fLgqRUHcvuTgfXiciB25xnZWgr3ow9FiE0eAqkw0Z45PkIkw3eXK8sIsoulVDE9AVNnPdEy4zjtLVmEt49V4k4Gl9rtgR/lmFgN16gNHfrUTZO16peuFpaUg3yWbNVFeePc7T0qb0nMNjm9zXuE75LagNUqWFlvJnsOAsHrKNJshHrk8GMMzxB2oqgWnkyar6Di0CjV/kskLROnTE4IYSD6/TlkFJz7Km8RkuCA1tbxh95S94NP2aChue/tfsDyux7ozpabfPGEdrHnYX8IM4ad0WrrHSL/dhdp7/yQOF2ob2EhcTJkoDGAP+jqrxwS9fIdPQtCXDAYhrIJnCTl8hyYyIW9E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2616005)(83380400001)(6512007)(8676002)(4326008)(316002)(26005)(38070700005)(64756008)(5660300002)(66574015)(86362001)(54906003)(33656002)(91956017)(71200400001)(66446008)(66476007)(2906002)(36756003)(66946007)(38100700002)(6486002)(6916009)(122000001)(8936002)(66556008)(508600001)(53546011)(6506007)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXJmd3duaEhwSkN0OTNtc2t4Q3ZDUlM5TjgrZXM0RUxzcXIrUzYwNDkxcVVm?=
 =?utf-8?B?Q09xYzVVaXFyN3hzb1dQa2ZJUitVcWs0M0c1WDdST2VKdXl4cS85V08vTmRo?=
 =?utf-8?B?V0FWeHhtOW01ZTlacWVHNGJ5M2ZXQ0VyZHp1K242KzZRRmd0MjNnSkI5czB5?=
 =?utf-8?B?QTViTVhvQmdUYWF6ZU1IT0pUWEZ5ZHZKK2FhZnNOMGQ0Y1JvOG5yWGo0a2lz?=
 =?utf-8?B?UDBQS25CRThYdmZLYnhQWk4rdjBpQ3dtSDlBZDNLbkRDQ0Z6dkV1RGR1c3pV?=
 =?utf-8?B?VW5HOG5FYzIranl0TStIT2lTNmlTMXpuVVBzOWVqTDlMWXFHYjNMM3hjQlN1?=
 =?utf-8?B?alVkdHB6cVdydWFLVXJpR25QeWtqZDR1YU9PWHBCOEJNV3lvcE15M3dPOXJi?=
 =?utf-8?B?MWpLSU5ZdXdORFhJMFJTN3J1MWllb0kzeWRralIxQmxmcmVlbnNOQ25yNU5s?=
 =?utf-8?B?WTFtMHZLWUVLb2ZpUjhZN2lCZ0pMZHd2L2Jod25oMEs3T2RyK3RZNUM2Ympv?=
 =?utf-8?B?b0tpWVAwSHVMVGtZcnNSajhoSjNEb3JmK1Y3UEV0NGlzcjAzNEdQQnFuWXhG?=
 =?utf-8?B?Y2diaWs4Y3NkWGV5NjZrTnZqWGlWS2hYYnJrVDdkKzJBNGNQZVdkTDY3alBx?=
 =?utf-8?B?NDNmZ3FPOHhsU1RhcnNHYVl3dkhjaVkyQlJOak93K1FRQ3ZPRWl2VEhmSDkv?=
 =?utf-8?B?cTR2aW13ZDluSlJsclJWTHNzR0JkM3RGTnNYR1YzSUJEai9HRExibXJTZy9h?=
 =?utf-8?B?bFBCcm1ORzRnQUZsTEkzcVh2MDQ5NndXOU1NekVzUnlZZjdBdy9hRGx0Q1cz?=
 =?utf-8?B?SitSZ09OV1JwOHl3eit6ODFNMUdGUzdPekdURzNqTlF4MVBIZWhPQzNpNDRa?=
 =?utf-8?B?ZEVncFQydEZVVXMzUGVIMFNQYmo4M2pyNEl3WVZHUkNFQkcxNVl2RW5LQTM2?=
 =?utf-8?B?Z2luRm12bzhnUUtURHdNbnJ0eGNhcUhEMEM2NFpwSitOeE1FZXRINE9KbUhH?=
 =?utf-8?B?c2dwbWxJaUQrWGIwanBpSTJySDRaN3ROaDltYlZyOEgrRlJVY0VKdG43NlZG?=
 =?utf-8?B?M3RvYS9aTWhRdEkvRHkwdUxiL25GUkdBQzR0c0U3L3E4cFA3UzQvekl1bElo?=
 =?utf-8?B?YUl4bTFoUFRvV2hneHpESXc5dllpZ2hvNXNuNEFuNHNmcGJySENPQjBWS3pq?=
 =?utf-8?B?Vmp2SlFaTlFpMnBiM0lGWGdJY2JEMDV3cmFQeG5nRG5iT2FvVks5czJjSG8z?=
 =?utf-8?B?Ukw2L25iLy9ZVGszbFpzMXMxaVJ1ZHNVMmlMV3o0VFp1UnRxeE5vNDZFN3pE?=
 =?utf-8?B?cmlLbVZhM1lJY2VPY3o2K3ZmRE5xbXE4ZHE5T3NUQ1ZNYWh5ancvQWZNbHF2?=
 =?utf-8?B?WEFDUGlRMUlUTnUvMGVhZVNOMHZXcTVzd1JDTjFjWjJCRUJHcThBQ2owQ05O?=
 =?utf-8?B?MkJSbjhCbzVmakNCdFVNRTNQQ25lQXJvTTM2MWtwUW9Kc2FHcERxbkl2Zjg2?=
 =?utf-8?B?ZlJjR0QzUVhqTnBDcE9UQW1jbC9aWlMvb0MxbDhmMEMzd0NId095TTJLQlho?=
 =?utf-8?B?Wm9RdjhuZUp2SXluRHF0cUltUk91eExPbFB3WEdENUZEZ0VpUnRqYjVCaFc1?=
 =?utf-8?B?R1B0WndvSzhnWjZvaWMzYU9PS2ZqUnZpQnZ4YytaNEFCTkF0SWZOaktzQVo0?=
 =?utf-8?B?TGlYVDdhM2NRZ2dvNXhPVWE4ckYvODMxTC9vcG1LRjFEQjlDYXZpb21ibEVI?=
 =?utf-8?Q?+YA2LpkK/W+4j9Gn2fzm9W5UX5+ba6bLRQUzqzp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E62A41DB9F74C248887B7C58CFCE86D3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a368f8-29df-4deb-dc90-08d98740eb85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 14:11:54.8432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13HnwmGQVg6GYd73PX43mxlRyBXTUDUVfNGbsiVFtrBefOFhXVgIaVSO3nV6aov01Y6Rvvj3n6NkiUbF+h7Zuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2438
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040098
X-Proofpoint-ORIG-GUID: rACcUvllkoihaf_mX_ClfTCHGY9QBRNs
X-Proofpoint-GUID: rACcUvllkoihaf_mX_ClfTCHGY9QBRNs
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

DQoNCj4gT24gT2N0IDQsIDIwMjEsIGF0IDEwOjA3IEFNLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiBIaQ0KPiANCj4gQW0gMDQuMTAuMjEgdW0g
MTU6MzQgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+Pj4gT24gT2N0IDQsIDIwMjEsIGF0IDM6
MDcgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+
PiANCj4+PiAoY2M6IGFpbnV4LndhbmdAZ21haWwuY29tKQ0KPj4+IA0KPj4+IEhpDQo+Pj4gDQo+
Pj4gQW0gMDMuMTAuMjEgdW0gMjA6MDkgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+Pj4+IEhp
LQ0KPj4+PiBBZnRlciB1cGRhdGluZyBvbmUgb2YgbXkgdGVzdCBzeXN0ZW1zIHRvIHY1LjE1LXJj
LCBJIGZvdW5kIHRoYXQgaXQNCj4+Pj4gYmVjb21lcyB1bnJlc3BvbnNpdmUgZHVyaW5nIHRoZSBs
YXRlciBwYXJ0IG9mIHRoZSBib290IHByb2Nlc3MuIEENCj4+Pj4gcG93ZXItb24gcmVzZXQgaXMg
bmVjZXNzYXJ5IHRvIHJlY292ZXIuDQo+Pj4+IEkgYmlzZWN0ZWQgdG8gdGhpcyBjb21taXQ6DQo+
Pj4+IDU3Mjk5NGJmMThmZiAoImRybS9hc3Q6IFplcm8gaXMgbWlzc2luZyBpbiBkZXRlY3QgZnVu
Y3Rpb24iKQ0KPj4+IA0KPj4+IFlvdSBkb24ndCBoYXZlIGEgbW9uaXRvciBjb25uZWN0ZWQsIEkg
Z3Vlc3M/DQo+PiBDb3JyZWN0LCBteSBsYWIgc3lzdGVtcyB1c2UgSVBNSSBhbmQgYSBicm93c2Vy
LWF0dGFjaGVkIGNvbnNvbGUuDQo+Pj4gSW4gdGhhdCBjYXNlLCB3ZSBub3cgdHJpZ2dlciB0aGUg
aGVscGVycyB0aGF0IHBvbGwgZm9yIGNvbm5lY3RlZCBtb25pdG9ycy4gSG93ZXZlciwgdGhlIG92
ZXJoZWFkIHNlZW1zIHJhdGhlciBleHRyZW1lLg0KPj4+IA0KPj4+IEknbGwgaGF2ZSB0byB0cnkg
dG8gcmVwcm9kdWNlIHRoaXMsIG9yIG90aGVyd2lzZSB3ZSBjYW4gcmV2ZXJ0IHRoZSBjb21taXQu
DQo+PiBJdCdzIHN0cmFuZ2UsIG9ubHkgdGhhdCBzeXN0ZW0gaW4gbXkgbGFiIHNlZW1zIHRvIGhh
dmUgYSBwcm9ibGVtLg0KPj4gVGhlIG90aGVycyB3b3JrIGZpbmUuDQo+PiBUaGFua3MgZm9yIGhh
dmluZyBhIGxvb2shDQo+IA0KPiBJcyBpdCBhIEhXIG9yIEZXIHByb2JsZW0/IE1heWJlIGEgZGlm
ZmVyZW50IHJldmlzaW9uPw0KDQpJdCdzIHBvc3NpYmxlLiBJIGRvbid0IGtub3cgaG93IHRvIGZ1
cnRoZXIgZGlhZ25vc2UgdGhlIGlzc3VlLA0KdGhvdWdoLiBBbnkgZ3VpZGFuY2UgYXBwcmVjaWF0
ZWQhDQoNCg0KPiBJJ20gYXNraW5nIGJlY2F1c2UgdGhlIHByb2JsZW1hdGljIGNvbW1pdCBkb2Vz
IHRoZSBjb3JyZWN0IHRoaW5nLiBJZiB0aGVyZSBpcyBubyBWR0EgY2FibGUgY29ubmVjdGVkLCB0
aGUgZHJpdmVyIHNob3VsZCBwb2xsIHVudGlsIGl0IGRldGVjdHMgb25lLiBUaGUgb3ZlcmhlYWQg
c2hvdWxkIGJlIG1pbmltYWwuDQo+IA0KPiBCdXQgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIGFueXdh
eS4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pj4gQmVzdCByZWdhcmRzDQo+
Pj4gVGhvbWFzDQo+Pj4gDQo+Pj4+IENoZWNraW5nIG91dCB2NS4xNS1yYzMgYW5kIHJldmVydGlu
ZyB0aGlzIGNvbW1pdCBlbmFibGVzIHRoZSBzeXN0ZW0NCj4+Pj4gdG8gYm9vdCBhZ2Fpbi4NCj4+
Pj4gMGI6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBBU1BFRUQgVGVjaG5vbG9neSwg
SW5jLiBBU1BFRUQgR3JhcGhpY3MgRmFtaWx5IChyZXYgMzApIChwcm9nLWlmIDAwIFtWR0EgY29u
dHJvbGxlcl0pDQo+Pj4+ICAgICAgICAgRGV2aWNlTmFtZTogIEFTUEVFRCBWaWRlbyBBU1QyNDAw
DQo+Pj4+ICAgICAgICAgU3Vic3lzdGVtOiBTdXBlciBNaWNybyBDb21wdXRlciBJbmMgWDEwU1JM
LUYNCj4+Pj4gICAgICAgICBDb250cm9sOiBJL08rIE1lbSsgQnVzTWFzdGVyLSBTcGVjQ3ljbGUt
IE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJ
TlR4LQ0KPj4+PiAgICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJF
cnItIERFVlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJS
LSBJTlR4LQ0KPj4+PiAgICAgICAgIEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAxOA0K
Pj4+PiAgICAgICAgIFJlZ2lvbiAwOiBNZW1vcnkgYXQgZmEwMDAwMDAgKDMyLWJpdCwgbm9uLXBy
ZWZldGNoYWJsZSkgW3NpemU9MTZNXQ0KPj4+PiAgICAgICAgIFJlZ2lvbiAxOiBNZW1vcnkgYXQg
ZmIwMDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTI4S10NCj4+Pj4gICAg
ICAgICBSZWdpb24gMjogSS9PIHBvcnRzIGF0IGMwMDAgW3NpemU9MTI4XQ0KPj4+PiAgICAgICAg
IEV4cGFuc2lvbiBST00gYXQgMDAwYzAwMDAgW3ZpcnR1YWxdIFtkaXNhYmxlZF0gW3NpemU9MTI4
S10NCj4+Pj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJz
aW9uIDMNCj4+Pj4gICAgICAgICAgICAgICAgIEZsYWdzOiBQTUVDbGstIERTSS0gRDErIEQyKyBB
dXhDdXJyZW50PTM3NW1BIFBNRShEMCssRDErLEQyKyxEM2hvdCssRDNjb2xkKykNCj4+Pj4gICAg
ICAgICAgICAgICAgIFN0YXR1czogRDAgTm9Tb2Z0UnN0LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNj
YWxlPTAgUE1FLQ0KPj4+PiAgICAgICAgIENhcGFiaWxpdGllczogWzUwXSBNU0k6IEVuYWJsZS0g
Q291bnQ9MS80IE1hc2thYmxlLSA2NGJpdCsNCj4+Pj4gICAgICAgICAgICAgICAgIEFkZHJlc3M6
IDAwMDAwMDAwMDAwMDAwMDAgIERhdGE6IDAwMDANCj4+Pj4gICAgICAgICBLZXJuZWwgZHJpdmVy
IGluIHVzZTogYXN0DQo+Pj4+ICAgICAgICAgS2VybmVsIG1vZHVsZXM6IGFzdA0KPj4+PiAtLQ0K
Pj4+PiBDaHVjayBMZXZlcg0KPj4+IA0KPj4+IC0tIA0KPj4+IFRob21hcyBaaW1tZXJtYW5uDQo+
Pj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KPj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KPj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+PiBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyDQo+PiAtLQ0KPj4gQ2h1Y2sgTGV2ZXINCj4gDQo+IC0tIA0KPiBU
aG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQoNCi0tDQpDaHVjayBMZXZlcg0KDQoNCg0K
