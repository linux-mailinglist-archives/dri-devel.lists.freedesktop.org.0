Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0B420F96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 15:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B889F6E1B3;
	Mon,  4 Oct 2021 13:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8389C6E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 13:34:27 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194Cu8ww009321; 
 Mon, 4 Oct 2021 13:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=rwJyovCb5YlvjkfPsW+c5g8tUBfGWAaMThPeSqLKJcI=;
 b=ZWDdSCP2/n10mE+LoRBKnKgzpEn9Fw+y1zJnhfmq/OCtjsWI9dU3pavMyyL7xt6Z7PH+
 6NnHyXbftunpqzMKRLbcbFcApLh+pIfcA2RVxuIIPpzGrqzl01VDIytqkoFjwr3FBX3N
 ywY6SdfBdYRrfW0XCEcK/anENuIl+ALYt9vXY001Z+/mTr4r/p2Z7kpmAYASlW1Lpq9d
 8GaB8XzWETLJEcX0dkAdZSW/v2hzxJhv63h+RXBAuhyf0hcAp4VYaM2eJgl62sjmUyR3
 HiJHC7kIBKL7mYHlqalVSno3sTL5hMWyRrOlgaBB7coKgyJnUXStYvvyHvgQ3tq9GSEq GQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfbatv1ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:34:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194DUE49129044;
 Mon, 4 Oct 2021 13:34:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by aserp3030.oracle.com with ESMTP id 3bev7rp137-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:34:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVSV1F6/8L7YPuiOT9NEDDgyaIareASiDwRXlqd+GcH8KXn2tUIbdMLiGn55vgcBEwzQuf6OmS7OBw8ab6OJWwH0tXQ3WlZBBClbHNn784EJu+mrbeCH/S37btF574Qaq04cFN2ZT73kbloddtHK1kO0OzqIOetZ/BG5NDk1Lgvrm6DtGlDvKinttCvxCyxK6VKpi7RcokEyEwlwo9KjnZCNK4O0cFh5PZvvxJkuTn2LtrmPCgQdBbitrFHsSvtDzuwfwGhXElJXhb3JmhIHKo/Tz6O7CrDbvaa1uzj1dg3giDa01UIT0lpIe/oJtMsHPaKtk7Z4xreL6wQt9yi8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwJyovCb5YlvjkfPsW+c5g8tUBfGWAaMThPeSqLKJcI=;
 b=BRdV47lHXNp0Bhqg6gZoO94njHyyYzewNN+To1qslF9a2gr0cjYsCS0b957tzO9zUvFI0csWeIM9lvtp29UaKIhxy1nWcfvxOkxPr+IkbTA9dCv/564LyNgfKhWjhAHpPaZiz5Bk7cLM6aX5b4RrJn7cxlRXfvyuY8vUbDA7sfnvwN5Cl1QEnNH5yxXc1N20yVHjyR41IV541nwYcMs/dY+zVUBiq0nOUgmTsObOqJ4RAAeUx9mMKL5ichUcvTwsDLuYJJuQLCfdDk1KWCbfo9KoIpRvZxlfyFDdKTs+x7VRgzL9DzF/w3Ihx9zH5He6H5Uui4XKnN2EYDUaDYMiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwJyovCb5YlvjkfPsW+c5g8tUBfGWAaMThPeSqLKJcI=;
 b=hy3GvdywsZC+utqRIB1fLNxl1nU6nrhfiujJemf9/GtbpwiIsCa5Ut016A4laMVY73MSXDYAasris0gbdP0aUZGgdohWEBacLlSqvvUDSlJ7by//7+KSEhJ5dPjkDdzhXS0b4zJ+idWYS+e4sy8QmBFP9yC0VDNSRB9I8hKSWhI=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB3142.namprd10.prod.outlook.com (2603:10b6:a03:14e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 13:34:21 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:34:21 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Ainux Wang
 <ainux.wang@gmail.com>
Subject: Re: 572994bf18ff prevents system boot
Thread-Topic: 572994bf18ff prevents system boot
Thread-Index: AQHXuIHb1jcBl5uEwUiwoZESWfnCi6vCbBgAgABr94A=
Date: Mon, 4 Oct 2021 13:34:21 +0000
Message-ID: <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
In-Reply-To: <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d95ff73-8138-4501-e30c-08d9873bac7b
x-ms-traffictypediagnostic: BYAPR10MB3142:
x-microsoft-antispam-prvs: <BYAPR10MB31428176F4A65F5B06C7D69093AE9@BYAPR10MB3142.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2Az/NbTzP2Hu1jyJRGH1D0J6KF1ZdkZmyw/FaJlMEoQLB/rbR4LWk2zXGOlJVeWtQm4MWYE8VWWnXU1+0KUOkyVKVd+E5qyBIy/zv6HwnzZt9LNTgTHY9p5zc4wPmgR5u2dbmk8acFPvOTgsQXCxDhkNYyTXIJCFf1KiTjNgkr//AKKsPskTlG9Mr3Jlnisy/NW6X9ybtDJTC18fVWbTRoSgjK3uNIBaeKDQtv9fGRir/Y84/OuUWNRgg7CvhaujcEMHM6R23YOe22+10z1aIoCCg1HVTcT4VZBe3vw97tRMn9jfjeMB2zI1md1r625g2s/DRh1uV1MS2fkcucYbYBztBI0RQO9SEFGtZzJQ8/KHnGIeCIsSywE1CnM3PiAY54p5Ndf96UF4XK/1NcfS93ZzJn6Ez2JpNnF/QDCO65KAdT7mNWk2nioVkCauttagBNIG5vwPLSmN4WpOlfJFSZUc7PVuX8M13/3Vc8n6nga3WY3kmE1cLr+akXbAvtZWM9cuyhDvdH8m048Z5/nrEL7SLNI16H52EqQtkaBk8UVAW7AIixOr6SO3LcgyEV6+sKJu1E9Rmgf5fgzkm8nQc8Ny1U96f7/wZe4dZLzM3l2W3AGOsvzoT3qlitpnhYWz1pwTm5BuPDeSXOpaow2U0wcRLibjKCCb6OKletyPGLSYAHJ929qFSO+l1t5ONPU8Y5OCqUYaGXzeG0/x2+1bzTdZsy8DY+J+x3mRUAtGlJfw+DyFskHtSK+2o+lnaL3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(38070700005)(122000001)(66574015)(316002)(36756003)(508600001)(83380400001)(53546011)(5660300002)(64756008)(66556008)(54906003)(6506007)(186003)(6916009)(66476007)(66446008)(76116006)(2616005)(8676002)(6512007)(6486002)(8936002)(91956017)(86362001)(71200400001)(66946007)(26005)(4326008)(2906002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE4xU3ZiWHcwUnp6V1B5TGpiUktJbk9PQXJyaW1yMnlvbnJDQjhvY0lyZ1da?=
 =?utf-8?B?WitEbmJrM0xXZkJ6Yy9CcXcwUWZsRVRHL210bDQyMGNKaFZVMVovbm1VSFh2?=
 =?utf-8?B?NEd1ME1TUmg4blV5S0IrLzhyWlk2OFdYUnlHWUQ1NWl0dDdNSWVkUTZwNTRZ?=
 =?utf-8?B?K3JqcVNpdTZ1QnViQ01BMXNmQyswb0Z2UTYwM0N2TlUwVDNuUFY3NW40aHU0?=
 =?utf-8?B?eGZwMDIzZ2M0V2R1Z2VNeGg2ZzM1MFIrb3NNM2tGSDBEREM0RlpndGpMRExZ?=
 =?utf-8?B?NThiQkNNL01TVlc4UkRlb0ViUlF1c0NRbSs0VWhsc0I4M283QWFoejlmN2pm?=
 =?utf-8?B?azVaKzAxU29oWFJFRHpnUWo4YXBWRjkxankydnhvbis5NEEyQ0NkRFUrdjRP?=
 =?utf-8?B?OCtNRnAra1V2WmtLUlA2MjYzMmdiLzZyaXYvZEhrM0RMNkZVM0ROT3ppcG9P?=
 =?utf-8?B?R1pWb3JhV0lSL01nb1Qvd1U0UXZ0Ymdab2N3anpaS2VHMkpNdHdhQ1hzRmJ4?=
 =?utf-8?B?c2RuVnFLK1RmdTJ2ckpibFlPSDd3ZjExM3hXTnZ0SE51TFRMK25DUXI0a05Z?=
 =?utf-8?B?b2IvMUg3MEFMWXdDREdkTlpDV3NBbHVBNUhQVXFsSElOcDY0THlPekF6bUVO?=
 =?utf-8?B?a0ZMVTY4Z1dHQlQvdE5iN1JYRHQ3ZDRqNkpBa0R5TVRrN3B4MHYwM2dkSWQ4?=
 =?utf-8?B?cmhuQzFCNmdwaWlBSHV2SWt5WWw1S05DdnhKK2M5b29KelU1S0lmS2d5UFFM?=
 =?utf-8?B?d3FhVG9IY0czTzYxZzlaaXY4eGxpZHMyYnAwSXdvcithM2lweUgzYVFQelpw?=
 =?utf-8?B?elJRQVZIQXM1MjlVbUVlNktzeExaTnBOOFIvSE5iUVcxVEkzdDRNU083U2tt?=
 =?utf-8?B?RGMyVmRDK3Q2YUpGNWZHMnMrMmpMM2o2VVVjb1p2dXd4KzFoTHptMEhlTWJT?=
 =?utf-8?B?QVFya3JEZnVQUVJxc2FlNWl2WlNDcDBleVdpM01wVTJkdThRc1dEa3lhbE1V?=
 =?utf-8?B?SHdtT1NDekNISmhxT011a05Ob1hJT2J1VldaRVRRb0ZaODk1bUJvUk1sUVZm?=
 =?utf-8?B?a29JQWRpcTlUYm1FMWFBTEpTUkIrek9MR1VaalQ2eFJyTURndk9UVHhTSExF?=
 =?utf-8?B?QXFVa1AvY0txWDhZSmMyRGNSTnlVaXg1aklkcTdzZnB2QklRZ3piTy9ubTBJ?=
 =?utf-8?B?UEM5SllvQnd4UC9SQ3dscGdneW1NTDMrS3VrVjRiSnp0UlhSRjJ3eG03anoz?=
 =?utf-8?B?Y1d2R2JvVUtKNkl4NGV1ZVNPa0ZlWkxQMkNwUjRFZ3RwNXF4RzJYZk9iOE5D?=
 =?utf-8?B?RXNlNVozOGVLZHoybHN6a1FDSk9hRXRlQkZPRnZJWFNVUEU0OEh6ZXV4QXBv?=
 =?utf-8?B?UUFsOTI4Z2txNnczWWFNVStCR09BSy83a0R5WmtGYWx6cUNBRml5U2gvb2hD?=
 =?utf-8?B?Y1Z2YnU2R3VtVlFEWnNFZkRkb3lpNVhibCtGVzFiSkRPMUZrb0FUcmtvMnVF?=
 =?utf-8?B?YW4rVExSNFBvY3RwYjcyL3ZVVHFpQnp0OXlqMitodkcyaWRXSFVZOTIwN3JM?=
 =?utf-8?B?TXdKeXJCUmlBOG83S3EzdExqUWxkRDBPTHlJRTdFbVJRQy9OcGhaQ21kWUtI?=
 =?utf-8?B?Z3hYc1V2SVFMSHNVQTNYem1KdjFxQWFMdzJHZVVWVFJzMUNic04ySlRmQWpO?=
 =?utf-8?B?bWhTVmhxUGdxdXVRdmRwcWkvd09NMnhMblBEak5vbUZ2UGRGYjlGVUVYYjJn?=
 =?utf-8?Q?rAvSp2cniDZ4HQnmdAR2ZfTltTfhX2BrShmzkzi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2620E6106A9B944AABE5E49D63D1E97@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d95ff73-8138-4501-e30c-08d9873bac7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 13:34:21.5768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0sRzM+v1EGNJ9jqgB1xXY94fI/doL+CATSOcYhpD0YQ0NSZN4604TzxfKq7R1wFE86C2/CdG16O39uIRqq1UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3142
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040093
X-Proofpoint-ORIG-GUID: 2jtEXk6PadToTYykDUOWgViZv0mgcJwN
X-Proofpoint-GUID: 2jtEXk6PadToTYykDUOWgViZv0mgcJwN
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

DQo+IE9uIE9jdCA0LCAyMDIxLCBhdCAzOjA3IEFNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiAoY2M6IGFpbnV4LndhbmdAZ21haWwuY29tKQ0K
PiANCj4gSGkNCj4gDQo+IEFtIDAzLjEwLjIxIHVtIDIwOjA5IHNjaHJpZWIgQ2h1Y2sgTGV2ZXIg
SUlJOg0KPj4gSGktDQo+PiBBZnRlciB1cGRhdGluZyBvbmUgb2YgbXkgdGVzdCBzeXN0ZW1zIHRv
IHY1LjE1LXJjLCBJIGZvdW5kIHRoYXQgaXQNCj4+IGJlY29tZXMgdW5yZXNwb25zaXZlIGR1cmlu
ZyB0aGUgbGF0ZXIgcGFydCBvZiB0aGUgYm9vdCBwcm9jZXNzLiBBDQo+PiBwb3dlci1vbiByZXNl
dCBpcyBuZWNlc3NhcnkgdG8gcmVjb3Zlci4NCj4+IEkgYmlzZWN0ZWQgdG8gdGhpcyBjb21taXQ6
DQo+PiA1NzI5OTRiZjE4ZmYgKCJkcm0vYXN0OiBaZXJvIGlzIG1pc3NpbmcgaW4gZGV0ZWN0IGZ1
bmN0aW9uIikNCj4gDQo+IFlvdSBkb24ndCBoYXZlIGEgbW9uaXRvciBjb25uZWN0ZWQsIEkgZ3Vl
c3M/DQoNCkNvcnJlY3QsIG15IGxhYiBzeXN0ZW1zIHVzZSBJUE1JIGFuZCBhIGJyb3dzZXItYXR0
YWNoZWQgY29uc29sZS4NCg0KDQo+IEluIHRoYXQgY2FzZSwgd2Ugbm93IHRyaWdnZXIgdGhlIGhl
bHBlcnMgdGhhdCBwb2xsIGZvciBjb25uZWN0ZWQgbW9uaXRvcnMuIEhvd2V2ZXIsIHRoZSBvdmVy
aGVhZCBzZWVtcyByYXRoZXIgZXh0cmVtZS4NCj4gDQo+IEknbGwgaGF2ZSB0byB0cnkgdG8gcmVw
cm9kdWNlIHRoaXMsIG9yIG90aGVyd2lzZSB3ZSBjYW4gcmV2ZXJ0IHRoZSBjb21taXQuDQoNCkl0
J3Mgc3RyYW5nZSwgb25seSB0aGF0IHN5c3RlbSBpbiBteSBsYWIgc2VlbXMgdG8gaGF2ZSBhIHBy
b2JsZW0uDQpUaGUgb3RoZXJzIHdvcmsgZmluZS4NCg0KVGhhbmtzIGZvciBoYXZpbmcgYSBsb29r
IQ0KDQoNCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+IENoZWNraW5nIG91dCB2NS4x
NS1yYzMgYW5kIHJldmVydGluZyB0aGlzIGNvbW1pdCBlbmFibGVzIHRoZSBzeXN0ZW0NCj4+IHRv
IGJvb3QgYWdhaW4uDQo+PiAwYjowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFTUEVF
RCBUZWNobm9sb2d5LCBJbmMuIEFTUEVFRCBHcmFwaGljcyBGYW1pbHkgKHJldiAzMCkgKHByb2ct
aWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCj4+ICAgICAgICAgRGV2aWNlTmFtZTogIEFTUEVFRCBW
aWRlbyBBU1QyNDAwDQo+PiAgICAgICAgIFN1YnN5c3RlbTogU3VwZXIgTWljcm8gQ29tcHV0ZXIg
SW5jIFgxMFNSTC1GDQo+PiAgICAgICAgIENvbnRyb2w6IEkvTysgTWVtKyBCdXNNYXN0ZXItIFNw
ZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RC
MkItIERpc0lOVHgtDQo+PiAgICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJC
LSBQYXJFcnItIERFVlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlIt
IDxQRVJSLSBJTlR4LQ0KPj4gICAgICAgICBJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEg
MTgNCj4+ICAgICAgICAgUmVnaW9uIDA6IE1lbW9yeSBhdCBmYTAwMDAwMCAoMzItYml0LCBub24t
cHJlZmV0Y2hhYmxlKSBbc2l6ZT0xNk1dDQo+PiAgICAgICAgIFJlZ2lvbiAxOiBNZW1vcnkgYXQg
ZmIwMDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTI4S10NCj4+ICAgICAg
ICAgUmVnaW9uIDI6IEkvTyBwb3J0cyBhdCBjMDAwIFtzaXplPTEyOF0NCj4+ICAgICAgICAgRXhw
YW5zaW9uIFJPTSBhdCAwMDBjMDAwMCBbdmlydHVhbF0gW2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQ0K
Pj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMN
Cj4+ICAgICAgICAgICAgICAgICBGbGFnczogUE1FQ2xrLSBEU0ktIEQxKyBEMisgQXV4Q3VycmVu
dD0zNzVtQSBQTUUoRDArLEQxKyxEMissRDNob3QrLEQzY29sZCspDQo+PiAgICAgICAgICAgICAg
ICAgU3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUt
DQo+PiAgICAgICAgIENhcGFiaWxpdGllczogWzUwXSBNU0k6IEVuYWJsZS0gQ291bnQ9MS80IE1h
c2thYmxlLSA2NGJpdCsNCj4+ICAgICAgICAgICAgICAgICBBZGRyZXNzOiAwMDAwMDAwMDAwMDAw
MDAwICBEYXRhOiAwMDAwDQo+PiAgICAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNlOiBhc3QNCj4+
ICAgICAgICAgS2VybmVsIG1vZHVsZXM6IGFzdA0KPj4gLS0NCj4+IENodWNrIExldmVyDQo+IA0K
PiAtLSANCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4gTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4g
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KDQotLQ0KQ2h1Y2sgTGV2ZXIN
Cg0KDQoNCg==
