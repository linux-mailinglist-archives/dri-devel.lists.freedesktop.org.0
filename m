Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7372DE414
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6706E157;
	Fri, 18 Dec 2020 14:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE316E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWjRxuDXfiWGvt6s2BXMG070NRVLPYiRTegvV/0ccSWGm8mB5kf4BXlX6oGoBI9il+izx3b/ywnqP4pomKezotI0fVmCNkQ8mywg5GvWQH1jD2/N+0Uy5YNWgCNmcsAYXMYrDFioCNhu9Xu9dQ0KfRg2O5fonzwabTlFFtHU59YLf5F9jiDWvcq2p/kpgi09xyPrz9tyqZ2BrHu8IWnaBVXrc9VDRAK2AstDF4K/fv/hbL49ytB9MY82D8qbb9i1RC2iGUOdfialHZ8QQ3xeYyZOPuj8sxbUj1LpaE8WPCbQUufvjIfT5BSn2kMqPOvccHb49+2OGkWMwPXJe8bD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkrxFPcbXio87lyxgmaj94XWeq56qqiFOlLb4t/gQcM=;
 b=cFAHWHyJsyVeZgwt/LIpk2C0mjvn/Y+VPZG47rNMhVzDzP5tWqkWnYLBCguuFuuROQ6Dgt8hWh8PqI8rGkWZS8cEDDwR4h9SOZu9glhLpqWwAzAjDdbreJwtqUh7ZTqpjVZWHlaJo/9aHvCkkBbptFuVPbaDyhrD7LsDGmYsHfxEO/BAJi6iCat9CJvYa0V1tyl0Z/hPFJkMzl/iKwybS7JrvdA9CupnVMAyAFsregqqP/wVX0iVX/pRM93rzmgk2mVQdAJ08nT+9O+o7LevstgKHGGoVZe2f+751FaZPW/v8admDRpnjEMscuZSPWv0aNaBCgsCFOJkYJ2k1fWrIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkrxFPcbXio87lyxgmaj94XWeq56qqiFOlLb4t/gQcM=;
 b=MsxgoIo+vHteXhMkf8ShrLuGqws+goT6WEEREBXfxexFN0Kg/3wfKiX0i6BFaQIezin1IylA1X2/p0ytd39Q4abj3PvPecj6kxzDXS3V9NmKgmCCKTTS7ZXE1UpJ21xkQTdkomCcQq2CrfEvtlw5frnWa5bxQuwfsjWsXr4fqvc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 18 Dec
 2020 14:33:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 14:33:55 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Robin Murphy <robin.murphy@arm.com>, Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <159c72db-1316-6155-2209-8e0e9a7f5224@arm.com>
 <8a2245b8-3a57-a35b-924f-e2a6c084e60f@amd.com>
 <9c0a034f-9f9d-d513-db41-df925bd15951@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aed7032f-a22d-86b2-25f6-40c5cc55632f@amd.com>
Date: Fri, 18 Dec 2020 15:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9c0a034f-9f9d-d513-db41-df925bd15951@arm.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:207::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 14:33:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2165419d-ccf7-4e23-75cd-08d8a361f2d6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4962A3D654CCB8CCCA0167E183C30@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpTH+09UNbxXvL32AkH4IKNBTJ4QWjl1thcazS1k9qkX9ImhRm1VMaSspZhZ7l3k6ArLzyBzdookAFle8zG0JE49UQXeRXUNXqKGcHkxXF7SSUP9n3jmTNQwgukv3n+2NdxfZNKUCXxLx1VX3WBXzZMSnvDEnCf08LC7UpgrEyI53d/9oOUlaTCddgyOp+XOKekvjGd1PsWLcpg5ZekemSUAxcqEUXNm4AGbvmF9JR1CvlbCu3W3ysAneU/XuI/5kKG7ZGVqZKdJbOj2NylTpfzx3wF4GiUJmK+MJEwEZowgL3gFJPftovBxvX++S2hposvcJpL9msGH5KiyxMHzQdKFwObD8eLdzs3YNr3zBx3/fKhivpm+3tlsJAdU6x9gaA2I3lhK7JI9He8R6f6M6+sZge4inGE7xc7UEyO8QMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(2616005)(4326008)(6666004)(52116002)(31686004)(110136005)(66574015)(66946007)(31696002)(5660300002)(8936002)(86362001)(66476007)(6486002)(316002)(4001150100001)(16526019)(83380400001)(36756003)(186003)(478600001)(53546011)(66556008)(2906002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3l2Q3gwVEFTVWJoSVJWdzhwRE5XYVAzRy9tekNMUmZUQkg2emlmUy8zZDFS?=
 =?utf-8?B?LzNiYUdEZEl2SjQvUGNhVkNjSkUrbnJUamthN0c2R3AzZVdPQWkxY1FaS1hI?=
 =?utf-8?B?eVo5eHU1bWgvTVhxeEpkZjkxMDAwdEdBS1VveEl2VzVJcFp4M0srVlhqRXky?=
 =?utf-8?B?dmFnRjJUaWtlOEJEalZUUDhVVTVaWFBKMUNOUEo2blBqMmg2OXU0YVlDQTBx?=
 =?utf-8?B?cjBDSU9QNWUyUUtWYmZFYTJtOTV3SDd3R0lKVVpiUlJMa3dlYkZLWUkyQmJl?=
 =?utf-8?B?YkY5aXFUdEpaSUNyQzVtZEFvOWp4eFkwOC95N0lSVzJmM1lIMkNZeG5IMjQr?=
 =?utf-8?B?cDc1SVlrRWdpOTRmaWhPenlIZ3NUUmpEbGtxc0JDb29VVkJyM3FGTDV4VnAx?=
 =?utf-8?B?THh5eGdPOG9iV2xhTk5ldEkrQXNJU0gxQzRBNlg1eXFLTFFqUjB6MEIxUFRp?=
 =?utf-8?B?RnQ4MXRyQm04T3dLc1pxRXNzQWE0cGxHVDAxWjNyWFZQbDJ0MHZzRUwzdW1Y?=
 =?utf-8?B?MmNBb0Q1N1UrZENzV0orWnBtdXpiUUVJYnR6eEcwWUdFVzNIY3ZkM2pXMXo2?=
 =?utf-8?B?VEVnNlRNRnVkMzE3Y1Z3V05xTmEyZDhZZ1Q0eXZYQU1RQ0JNeTB6MVc3alFz?=
 =?utf-8?B?M3hnVjJyZ2FGbTRJUWg3MGpNWUdsanNZUFdjWm9RS2hyTy9YME1LWHkxWnZh?=
 =?utf-8?B?ZDFsWmIvSHFlTjBtb0lzTHVvbVViTm81OXpOUHBVbk56Y041RUorMUJNWmNt?=
 =?utf-8?B?VndvRlhDYkFRRUtLS2c0VWh0elFOcEJOTDczUHpsYi9DeW84RFdaWUJrWmg3?=
 =?utf-8?B?eVYxS2YrS1IwN0JsMlJlK1ZtK1lua3J0ZVpVN3o2bnZVeHZZWHV4OFIvdXJi?=
 =?utf-8?B?WmIvNjFlQ1lNS1N6TGUwZVo4RVZaeSs3VDVCanNWQUVFWTJnZlYxd0N3eFZm?=
 =?utf-8?B?dHdsYnFXeGM4WmJmOHc3b09HZzFDTW1IbmhRdFdhM0xaL0UxdzA1ZHlDVlFj?=
 =?utf-8?B?UG1Pa0hyWUlmMWxYWlVXT2FNNUhsVmRCekRGKzMyUC9MU2lBbTNsa0t3UTd2?=
 =?utf-8?B?WjlJLzNNK0hQbzc2L0h1SWtQeHhqSlFYc2FQUFozOERxdDlZTXFJZVEyV2px?=
 =?utf-8?B?VysyL2hwWitWallURjBLMUJWWGoxWEhZK01IS3p0cENKZmFSWVJqVXdjK3RJ?=
 =?utf-8?B?Ryt5YnJFSVBNV1Q5ejFhUXRDZDh6ZGs3cHBaeVVia1FKTGNxS25NK014Wita?=
 =?utf-8?B?eGRDWTMrdFZ2ZHR1blNabTRKSnI0VGs0UFhDY05sUVJzNmE1WDF1NkVCU2wz?=
 =?utf-8?B?L0hFeFpwWnhDQSs4MGlOV3JGZkZoTFZNMFRWOGFHQTJBVWthM2tSSFVOL1hx?=
 =?utf-8?B?NVVHekwwWjNZOUc5dXN3RUppVG9NV0czYW9TM2UrcDRpYkF0MWZLTm1Ua2xR?=
 =?utf-8?Q?FuPJpq2/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 14:33:55.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2165419d-ccf7-4e23-75cd-08d8a361f2d6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDbGKCIYfB/d2vgdRJNFnsizWHLty9YOhu5NXdbjkNE2rUbu8FhMu7M2ccofKFtY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTIuMjAgdW0gMTU6MTcgc2NocmllYiBSb2JpbiBNdXJwaHk6Cj4gT24gMjAyMC0xMi0x
NyAxNDowMiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gW1NOSVBdCj4+IERvIHlvdSBoYXZl
IHNvbWUgYmFja2dyb3VuZCB3aHkgc29tZSBBUk0gYm9hcmRzIGZhaWwgd2l0aCB0aGF0Pwo+Pgo+
PiBXZSBoYWQgYSBjb3VwbGUgb2YgcmVwb3J0cyB0aGF0IG1lbXNldC9tZW1jcHkgZmFpbCBpbiB1
c2Vyc3BhY2UgCj4+ICh1c3VhbGx5IHN5c3RlbSBqdXN0IHNwb250YW5lb3VzbHkgcmVib290cyBv
ciBiZWNvbWVzIHVucmVzcG9uc2l2ZSksIAo+PiBidXQgc28gZmFyIG5vYm9keSBjb3VsZCB0ZWxs
IHVzIHdoeSB0aGF0IGhhcHBlbnM/Cj4KPiBQYXJ0IG9mIGl0IGlzIHRoYXQgQXJtIGRvZXNuJ3Qg
cmVhbGx5IGhhdmUgYW4gaWRlYWwgbWVtb3J5IHR5cGUgZm9yIAo+IG1hcHBpbmcgUkFNIGJlaGlu
ZCBQQ0kgKG11Y2ggbGlrZSB3ZSBhbHNvIHN0cnVnZ2xlIHdpdGggdGhlIHZhZ3VlIAo+IGV4cGVj
dGF0aW9ucyBvZiB3aGF0IHdyaXRlLWNvbWJpbmUgbWlnaHQgbWVhbiBiZXlvbmQgeDg2KS4gRGV2
aWNlIAo+IG1lbW9yeSBjYW4gYmUgcmVsYXhlZCB0byBhbGxvdyBnYXRoZXJpbmcsIHJlb3JkZXJp
bmcgYW5kIAo+IHdyaXRlLWJ1ZmZlcmluZywgYnV0IGlzIHN0aWxsIGEgYml0IHRvbyByZXN0cmlj
dGl2ZSBpbiBvdGhlciB3YXlzIC0gCj4gYWxpZ25lZCwgbm9uLXNwZWN1bGF0aXZlLCBldGMuIC0g
Zm9yIHNvbWV0aGluZyB0aGF0J3MgcmVhbGx5IGp1c3QgUkFNIAo+IGFuZCBleHBlY3RlZCB0byBi
ZSB1c2FibGUgYXMgc3VjaC4gVGh1cyB0byBtYXAgUENJIG1lbW9yeSBhcyAKPiAid3JpdGUtY29t
YmluZSIgd2UgdXNlIE5vcm1hbCBub24tY2FjaGVhYmxlLCB3aGljaCBtZWFucyB0aGUgQ1BVIE1N
VSAKPiBpcyBnb2luZyB0byBhbGxvdyBzb2Z0d2FyZSB0byBkbyBhbGwgdGhlIHRoaW5ncyBpdCBt
aWdodCBleHBlY3Qgb2YgCj4gUkFNLCBidXQgd2UncmUgbm93IGF0IHRoZSBtZXJjeSBvZiB0aGUg
bWVuYWdlcmllIG9mIGludGVyY29ubmVjdHMgYW5kIAo+IFBDSSBpbXBsZW1lbnRhdGlvbnMgb3V0
IHRoZXJlLgoKSSBzZWUuIEFzIGZhciBhcyBJIGtub3cgd2UgYWxyZWFkeSBjb3JyZWN0bHkgbWFw
IHRoZSBSQU0gZnJvbSB0aGUgR1BVIGFzIAoid3JpdGUtY29tYmluZSIuCgo+IEF0b21pYyBvcGVy
YXRpb25zLCBmb3IgZXhhbXBsZSwgKm1pZ2h0KiBiZSByZXNvbHZlZCBieSB0aGUgQ1BVIAo+IGNv
aGVyZW5jeSBtZWNoYW5pc20gb3IgaW4gdGhlIGludGVyY29ubmVjdCwgc3VjaCB0aGF0IHRoZSBQ
Q0kgaG9zdCAKPiBicmlkZ2Ugb25seSBzZWVzIHJlZ3VsYXIgbG9hZHMgYW5kIHN0b3JlcywgYnV0
IG1vcmUgb2Z0ZW4gdGhhbiBub3QgCj4gdGhleSdsbCBqdXN0IHJlc3VsdCBpbiBhbiBhdG9taWMg
dHJhbnNhY3Rpb24gZ29pbmcgYWxsIHRoZSB3YXkgdG8gdGhlIAo+IGhvc3QgYnJpZGdlLiBBIHN1
cGVyLWR1cGVyLWNsZXZlciBob3N0IGJyaWRnZSBpbXBsZW1lbnRhdGlvbiBtaWdodCAKPiBldmVu
IHN1cHBvcnQgdGhhdCwgYnV0IHRoZSB2YXN0IG1ham9yaXR5IGFyZSBsaWtlbHkgdG8ganVzdCBy
ZWplY3QgaXQgCj4gYXMgaW52YWxpZC4KClN1cHBvcnQgZm9yIGF0b21pY3MgaXMgYWN0dWFsbHkg
c3BlY2lmaWVkIGJ5IGFuIFBDSWUgZXh0ZW5zaW9uLiBBcyBmYXIgCmFzIEkga25vdyB0aGF0IGV4
dGVuc2lvbiBpcyBldmVuIG5lY2Vzc2FyeSBmb3IgZnVsbCBLRkQgc3VwcG9ydCBvbiBBTUQgCmFu
ZCBmdWxsIEN1ZGEgc3VwcG9ydCBmb3IgTlZpZGlhIEdQVXMuCgo+Cj4gU2ltaWxhcmx5LCB1bmFs
aWduZWQgYWNjZXNzZXMsIGNhY2hlIGxpbmUgZmlsbHMvZXZpY3Rpb25zLCBhbmQgc3VjaCAKPiB3
aWxsIG9mdGVuIHdvcmssIHNpbmNlIHRoZXkncmUgZXNzZW50aWFsbHkganVzdCBsYXJnZXIgcmVh
ZC93cml0ZSAKPiBidXJzdHMsIGJ1dCBzb21lIGhvc3QgYnJpZGdlcyBjYW4gYmUgcGlja3kgYW5k
IG1pZ2h0IHJlamVjdCBhY2Nlc3MgCj4gc2l6ZXMgdGhleSBkb24ndCBsaWtlICh0aGVyZSdzIGF0
IGxlYXN0IG9uZSB3aGVyZSBldmVuIDY0LWJpdCBhY2Nlc3NlcyAKPiBkb24ndCB3b3JrLiBPbiBh
IDY0LWJpdCBzeXN0ZW0uLi4pCgpUaGlzIGlzIGJyZWFraW5nIG91ciBuZWNrIGhlcmUuIFdlIG5l
ZWQgNjRiaXQgd3JpdGVzIG9uIDY0Yml0IHN5c3RlbXMgdG8gCmVuZCB1cCBhcyBvbmUgNjRiaXQg
d3JpdGUgYXQgdGhlIGhhcmR3YXJlIGFuZCBub3QgdHdvIDMyYml0IHdyaXRlcyBvciAKb3RoZXJ3
aXNlIHRoZSBkb29yYmVsbHMgd29uJ3Qgd29yayBjb3JyZWN0bHkuCgpMYXJnZXIgd3JpdGVzIGFy
ZSBwcmV0dHkgbXVjaCB1bnByb2JsZW1hdGljLCBmb3IgUDJQIG91ciBidXMgaW50ZXJmYWNlIApl
dmVuIHN1cHBvcnRzIHJlYWxseSBsYXJnZSBtdWx0aSBieXRlIHRyYW5zZmVycy4KCj4gSWYgYW4g
aW52YWxpZCB0cmFuc2FjdGlvbiBkb2VzIHJlYWNoIHRoZSBob3N0IGJyaWRnZSwgaXQncyBnb2lu
ZyB0byAKPiBjb21lIGJhY2sgdG8gdGhlIENQVSBhcyBhbiBleHRlcm5hbCBhYm9ydC4gSWYgd2Un
cmUgcmVhbGx5IGx1Y2t5IHRoYXQgCj4gY291bGQgYmUgdGFrZW4gc3luY2hyb25vdXNseSwgYXR0
cmlidXRhYmxlIHRvIGEgc3BlY2lmaWMgaW5zdHJ1Y3Rpb24sIAo+IGFuZCBqdXN0IG9vcHMvU0lH
QlVTIHRoZSByZWxldmFudCBrZXJuZWwvdXNlcnNwYWNlIHRocmVhZC4gT2Z0ZW4gCj4gdGhvdWdo
LCAocGFydGljdWxhcmx5IHdpdGggYmlnIG91dC1vZi1vcmRlciBDUFVzKSBpdCdzIGxpa2VseSB0
byBiZSAKPiBhc3luY2hyb25vdXMgYW5kIG5vIGxvbmdlciBhdHRyaWJ1dGFibGUsIGFuZCB0aHVz
IHRha2VuIGFzIGFuIFNFcnJvciAKPiBldmVudCwgd2hpY2ggaW4gZ2VuZXJhbCByb3VnaGx5IHRy
YW5zbGF0ZXMgdG8gInBhcnQgb2YgdGhlIFNvQyBoYXMgCj4gZmFsbGVuIG9mZiIuIFRoZSBvbmx5
IHJlYXNvbmFibGUgcmVzcG9uc2Ugd2UgaGF2ZSB0byB0aGF0IGlzIHRvIHBhbmljIAo+IHRoZSBz
eXN0ZW0uCgpZZWFoLCB0aGF0IHNvdW5kcyBleGFjdGx5IGxpa2Ugd2hhdCB3ZSBzZWUgb24gc29t
ZSBvZiB0aGUgQVJNIGJvYXJkcyBvdXQgCnRoZXJlLiBBdCBsZWFzdCB3ZSBoYXZlIGFuIGV4cGxh
bmF0aW9uIGZvciB0aGF0IGJlaGF2aW9yIG5vdy4KCkdvaW5nIHRvIHRhbGsgYWJvdXQgdGhpcyB3
aXRoIG91ciBoYXJkd2FyZSBlbmdpbmVlcnMuIFdlIG1pZ2h0IGJlIGFibGUgCnRvIHdvcmsgYXJv
dW5kIHNvbWUgb2YgdGhhdCBzdHVmZiwgYnV0IHRoYXQgaXMgcmF0aGVyIHRyaWNreSB0byBnZXQg
CndvcmtpbmcgdW5kZXIgdGhvc2UgY29uZGl0aW9ucy4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+
Cj4gUm9iaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
