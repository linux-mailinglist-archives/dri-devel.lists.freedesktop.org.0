Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78234606D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293526E890;
	Tue, 23 Mar 2021 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247C36E0BC;
 Tue, 23 Mar 2021 13:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAViImzuXaSiOhce6STjGNn5BmVwL4FkCgssnsD5QUWWfI8R9CDefoMB9btiklt+EKwP3wdX+uYf2RXprzErGiE/kz4h9Adi3JBaoY398pDKcxkS/tYYPKfnVr6mwwqfc/Rs3sveIDuk89UpN5sEysDgT7u5Rkj28NpjmzUiWr3uZW+YGyuQFP6RFyrIhdOXVKY+y/1p+wW5GQPvCPQ7nYfOmLbsst4BkeuhbOEUByGxgIGPXEJvFjINgqiwHQlr8woqtGbGrA163QaZGMA79xfcIjW/sc5MxOsraCnzz2WGCr+MhoUkkhdFu/6/cImIhny1ANhMNUZIcEUVYXY1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMSnv1uqeNE2y5y7uO4Xcc3Wnm3KNDhGRRZLKsl2fXE=;
 b=ItmGVJZ9vu7opXMO5B9ljINq/HggpX/pZCr8/cNzhXcXvPWGO1E/AYxFCmPDaOX3M4PamGLGt6dhMwQT54lIVEPPGxYA1/0ik5WgORb1YMxjSxsQoP3XXxe1sImJDgnNRfj3WXndold8z/tfUn1NjECHLAMWMO0aJnfZlh4O+KUPJfEz8hCzIS7U1tTS8msvmmWI+jTGzpN8NIHjeRwcIRC31i4DYDIsTBHw5LSsc+0j6iWyqWZ1SvhiEvYBsoTfK2CGNW4ZIPEuqTnYZBOJ49VCghdMov3QBNVbsbB8KAtkj+dp9oBOESxIRS8YWA6SSq22ULmf+Q1DkVh7NImCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMSnv1uqeNE2y5y7uO4Xcc3Wnm3KNDhGRRZLKsl2fXE=;
 b=hfu3rs5UV3FdQHIz6qntYvWLu8pdKbXR+4SBIN0YR7vfIWFrbl2pnVGfNARgC0V623lUTOIEBqpk9xZAialsLIw1UT2Ycua+Yu0kSCx14BajQJWtDA1tjOCdPQ8V6JP9Ued7Nwom/RraInZefeIyhi4Wrhl4NwUxg0Hdf4ZRx2k=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3887.namprd12.prod.outlook.com (2603:10b6:208:168::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 13:57:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:57:00 +0000
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: Michal Hocko <mhocko@suse.com>
References: <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz> <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
 <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
Date: Tue, 23 Mar 2021 14:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec]
X-ClientProxiedBy: AM0PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:208:14::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec]
 (2a02:908:1252:fb60:fdcd:4dd1:a1af:a7ec) by
 AM0PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:208:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2cbaa76-1f7b-4221-7c04-08d8ee038755
X-MS-TrafficTypeDiagnostic: MN2PR12MB3887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3887DE6EC5BEC2E302C69A1A83649@MN2PR12MB3887.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Db9D3KGhADkDj4n+0C6v/aub+zCZlhyLW0BqjJm3hNbQaoyhXy4UFeSYGsMrW20nEJtv7Ln6kWfVnl7ZXwHCJKqovdUgAKp5C7kZInO1k/weFI04mwFqdXwnzYn+li4dW9/b/X/IXSOyzDghKkOXWTipAaauw7AkPqAqJyh/CZlHPmhaSGYhcnSP825uewnP6Db34hwX0PK/lgvC+bh3oh3l8a6qxMrzLl3hAfa+AKUuGqGGunGZ0npJq9mYvNht1J38xdXW5HPCIijFr3qXoDYUHS+OE6r9ayitiL+U4svLc6aLeeD8OsxWZ1HFvIRv9RsIikFK/jyD0ywpPaELF81mDWOQhvkh+2eoT0Z0KC8hbK2ZfZyaq1Fo3s3esLd1SD0DsjGAlyQMYRdRBthJmJR34XWEHfn239mbszG6pqyVgo08J1yXLwThk1EJHkqy+vQiKSK0v47FHt1cmzUJ8Fb9QCruIIP71Xl73Dxs4hQiEdJMswmIvbBYDdhRwPlKNiT1uYZ5OXz4qyvwu63bQwc4X5bMMWmhcxLp4XOrqCWXFWieeS5+E8Ck35JNZm7pQR936pKNWCuNbp2ba7I7N6rc5uSWMVBEN9XoNaOmn9PYwIQytwzkqQORkFT3sJWVoMDj+lG5AxaNm++MCwM2vcTk5PPGG8qs0oS20qavuyUO+GsZUncydcVWqV7x6PE1845CvTB3qnH+wWU2V2DGnJvR8eXOZfIUce4lcLtR3p4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(52116002)(316002)(54906003)(6486002)(36756003)(83380400001)(38100700001)(66574015)(8676002)(4326008)(31686004)(478600001)(2616005)(186003)(66946007)(5660300002)(6666004)(16526019)(66476007)(86362001)(31696002)(66556008)(2906002)(6916009)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mm05RExidEdjSFlxUkFFSzJmd21acGhQYmtxNFRmbHQyTmFjUTlyRTZSRWZQ?=
 =?utf-8?B?QlJlNTdEUkhlSVpSaDVrOEFHeUNZY1kyaWd0Nkl0Wjg5b2dOckVmQlF4cGR4?=
 =?utf-8?B?Z1VhaHdTeVBZbTQwT09XekQrVFlwMlhVUmZIRTh3MEpwR3FnU2o4WGpkSFk1?=
 =?utf-8?B?UlhSZ25JQzhMYjRkK3RQc1JRUTMyUjNqNFJYSjJIUkd4VlZ5ZUovelJuMTFq?=
 =?utf-8?B?Y0w3UHdqZjExemhWUXVSTkdlMEVXdHpIQk5YOENqdkVCSi9zTG5vWVdRNGkv?=
 =?utf-8?B?Yi9iOXgwZVlhQVZnRW0zelB3MDlaWlpzUlRLLy9pYXVjdjRRelV6MHVrdUNp?=
 =?utf-8?B?TlBwSFJRQTlCWnI5MDRRS1hySE03MVpPektsTHExa1YzQ2JJRTFOblFTWnIr?=
 =?utf-8?B?ZEJqb2ZPL2M5VDlmRGZTcDdFOGZ3NFN0eGdEYlExcWRUcTZ3WHA0Tm1mbjkv?=
 =?utf-8?B?U1ExUGtsRXRKY3hYbTI2NWptcnFzaGVzR3kwZDRlMk5CMy82VEFLWTZ6Z01n?=
 =?utf-8?B?NXdRaVk3TzcvSkNYYmt6TmtEOVplSHlvZFVRL05YaE15b2I2bkVuMlhoRTJq?=
 =?utf-8?B?RW53YVhVRkVpa1hTYXVoRThWUXI3dlBCNTRBUlpsNGk4SzcrRlFuUS8rVXlQ?=
 =?utf-8?B?Q0xjYjFVek9iNzRUeC9kTXgyWVR0V2pUalc2dWRmKytsdzUwczdjVGFCTFV0?=
 =?utf-8?B?cTY3N21PZTVMazZNM2VCTlM4aktuMFVpdnZWb3BLTGFIai9KL0p6eU0wV3N0?=
 =?utf-8?B?K2pJN0NsWFpCMWkxQ2svMmpzVGplRFBVbkNqeWpVSjZIWWF2UE5wM1hDY2N5?=
 =?utf-8?B?U2JJUjhGMWEvUTd5QzJRV0xFYU51QklVZHh0cCtKRFRUR0xGdlZYT2lhZHAr?=
 =?utf-8?B?dE1WbmNmQjE1QVJGdFlKSFEyM2w5MVNrdzJpM0Y4REdTbU5zaVQwT0hSNXQ0?=
 =?utf-8?B?U1M4dUJoTGJPUUVISXNwMG9mRkx4VFZVOWY4a2RuNWZBVk5qblVLYkJyNUZK?=
 =?utf-8?B?QnJyS1Q3dzBZcUFyL0RhalVqTVNjTnJhUlBudGtRQjBzeGhCQXRyNkJXdmFT?=
 =?utf-8?B?RzQ5S1ZIQ2lCUll3cWI1TC84RWNzVlM4bFRoMzFLUDM1cFJJdzNqMGxTS05p?=
 =?utf-8?B?YUdLWlRucEZNTC9PbGxLZzZyc2t2UERwSUdpdlpKNWpHK3hET2ZqTktBdmFU?=
 =?utf-8?B?Z2FJMnU5V0RFZEVYaG94NXZ6cXpvWVdvdjlWSmtqZEFKR1g1U09TSUhobGFx?=
 =?utf-8?B?bkw1TkdKcDFLbzFYQmh3VDlVZEFnSVREbjFiUUtpTEtBNlZzU2lubVE5RTEw?=
 =?utf-8?B?SnYxNzhWQU1HQ1czTDQ0akJyN2FUOGlNWWJqMmV2dnlsd2EyUi9kVnlQTERU?=
 =?utf-8?B?bkpiTjhRa2VYVzkyRHU1bUJSSmdtT29EM1dxZkNka0JRU0tFOStDZVhEa0VG?=
 =?utf-8?B?ekdpdnNPcy8yQllzU3Z5ZHlaTy9HY2t4TUxkcnpKTDIwaE5xUm1KZTJBUUxZ?=
 =?utf-8?B?N1lnRERrOGVBNUo2ZmpnSXdUSk9KWXBhTWdpWnVCNDNvWUl4akFJN0hraGhM?=
 =?utf-8?B?QXZFUXFqbVkzQUhBZHlVeDZ3V2xacWJ4aVRQN2NreTVLd0VQNEswNkVtM1A2?=
 =?utf-8?B?L0YxZ21aamk3aU4zTzNKYUg0UjJoZCtDUG1pQW5qRHM2a2RZTHhieVRnSUFQ?=
 =?utf-8?B?bW8wcXErTjREajN3eVBCdS8rem1VR0ZqTkgwTmlZY2hMa0ZPUHZpSnpvREVI?=
 =?utf-8?B?VTBoUFI0VW01QVpGdCtGZ1UvUitLN1BXaVdoTG1Mb1BBcVQrUmdTd3FVRnZ0?=
 =?utf-8?B?a2lVVjZSaVFsVHB4TkxGZmR5Q1lQRTkwZ2UvdGhxOFdJN1NleXFFQjBqRkUv?=
 =?utf-8?Q?/WQ+rwju0LbOP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cbaa76-1f7b-4221-7c04-08d8ee038755
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:56:59.9292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBayBLY6EZNI4LUIVPIO5veTVcMxwHnndrtQcXxV11ni/LDzD2ZoT646Ho63hJUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
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
Cc: Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDMuMjEgdW0gMTQ6NDEgc2NocmllYiBNaWNoYWwgSG9ja286Cj4gT24gVHVlIDIzLTAz
LTIxIDE0OjA2OjI1LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMy4wMy4yMSB1bSAx
MzozNyBzY2hyaWViIE1pY2hhbCBIb2NrbzoKPj4+IE9uIFR1ZSAyMy0wMy0yMSAxMzoyMTozMiwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBbLi4uXQo+Pj4+IElkZWFsbHkgSSB3b3VsZCBsaWtl
IHRvIGJlIGFibGUgdG8gdHJpZ2dlciBzd2FwcGluZyBvdXQgdGhlIHNobWVtIHBhZ2UgSQo+Pj4+
IGFsbG9jYXRlZCBpbW1lZGlhdGVseSBhZnRlciBkb2luZyB0aGUgY29weS4KPj4+IFNvIGxldCBt
ZSB0cnkgdG8gcmVwaHJhc2UgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZC4gWW91IHdvdWxkIGxp
a2UgdG8KPj4+IHN3YXAgb3V0IHRoZSBleGlzdGluZyBjb250ZW50IGZyb20gdGhlIHNocmlua2Vy
IGFuZCB5b3UgdXNlIHNobWVtIGFzIGEKPj4+IHdheSB0byBhY2hpZXZlIHRoYXQuIFRoZSBzd2Fw
b3V0IHNob3VsZCBoYXBwZW4gYXQgdGhlIHRpbWUgb2YgY29weWluZwo+Pj4gKHNocmlua2VyIGNv
bnRleHQpIG9yIHNob3J0bHkgYWZ0ZXJ3YXJkcz8KPj4+Cj4+PiBTbyBlZmZlY3RpdmVseSB0byBj
YWxsIHBhZ2VvdXQoKSBvbiB0aGUgc2htZW0gcGFnZSBhZnRlciB0aGUgY29weT8KPj4gWWVzLCBl
eGFjdGx5IHRoYXQuCj4gT0ssIGdvb2QuIEkgc2VlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gYWNo
aWV2ZSBub3cuIEkgZG8gbm90IHRoaW5rIHdlCj4gd291bGQgd2FudCB0byBhbGxvdyBwYWdlb3V0
IGZyb20gdGhlIHNocmlua2VyJ3MgY29udGV4dCBidXQgd2hhdCB5b3UgY2FuCj4gZG8gaXMgdG8g
aW5zdGFudGlhdGUgdGhlIHNobWVtIHBhZ2UgaW50byB0aGUgdGFpbCBvZiB0aGUgaW5hY3RpdmUg
bGlzdAo+IHNvIHRoZSBuZXh0IHJlY2xhaW0gYXR0ZW1wdCB3aWxsIHN3YXAgaXQgb3V0IChhc3N1
bWluZyBzd2FwIGlzIGF2YWlsYWJsZQo+IG9mIGNvdXJzZSkuCgpZZXMsIHRoYXQncyBhdCBsZWFz
dCBteSB1bmRlcnN0YW5kaW5nIG9mIGhvdyB3ZSBjdXJyZW50bHkgZG8gaXQuCgpQcm9ibGVtIHdp
dGggdGhhdCBhcHByb2FjaCBpcyB0aGF0IEkgZmlyc3QgY29weSBvdmVyIHRoZSB3aG9sZSBvYmpl
Y3QgCmludG8gc2htZW0gYW5kIHRoZW4gZnJlZSBpdC4KClNvIGluc3RlYWQgb2YgdGVtcG9yYXJ5
IHVzaW5nIGEgc2luZ2xlIHBhZ2UsIEkgbmVlZCB3aGF0ZXZlciB0aGUgYnVmZmVyIApvYmplY3Qg
aXMgaW4gc2l6ZSBhcyB0ZW1wb3Jhcnkgc3RvcmFnZSBmb3IgdGhlIHNobWVtIG9iamVjdCBhbmQg
dGhhdCBjYW4gCmJlIGEgY291cGxlIG9mIGh1bmRyZWQgTWlCLgoKPiBUaGlzIGlzIG5vdCByZWFs
bHkgc29tZXRoaW5nIHRoYXQgb3VyIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGdpdmVzIHlvdQo+
IHRob3VnaCwgSSBhbSBhZnJhaWQuIFRoZXJlIGlzIG5vIHdheSB0byB0ZWxsIGEgbmV3bHkgYWxs
b2NhdGVkIHNobWVtCj4gcGFnZSBzaG91bGQgYmUgaW4gZmFjdCBjb2xkIGFuZCB0aGUgZmlyc3Qg
b25lIHRvIHN3YXAgb3V0LiBCdXQgdGhlcmUgYXJlCj4gcGVvcGxlIG1vcmUgZmFtaWxpYXIgd2l0
aCBzaG1lbSBhbmQgaXRzIHBlY3VsYXJpdGllcyBzbyBJIG1pZ2h0IGJlIHdyb25nCj4gaGVyZS4K
Pgo+IEFueXdheSwgSSBhbSB3b25kZXJpbmcgd2hldGhlciB0aGUgb3ZlcmFsbCBhcHByb2FjaCBp
cyBzb3VuZC4gV2h5IGRvbid0Cj4geW91IHNpbXBseSB1c2Ugc2htZW0gYXMgeW91ciBiYWNraW5n
IHN0b3JhZ2UgZnJvbSB0aGUgYmVnaW5uaW5nIGFuZCBwaW4KPiB0aG9zZSBwYWdlcyBpZiB0aGV5
IGFyZSB1c2VkIGJ5IHRoZSBkZXZpY2U/CgpZZWFoLCB0aGF0IGlzIGV4YWN0bHkgd2hhdCB0aGUg
SW50ZWwgZ3V5cyBhcmUgZG9pbmcgZm9yIHRoZWlyIGludGVncmF0ZWQgCkdQVXMgOikKClByb2Js
ZW0gaXMgZm9yIFRUTSBJIG5lZWQgdG8gYmUgYWJsZSB0byBoYW5kbGUgZEdQVXMgYW5kIHRob3Nl
IGhhdmUgYWxsIApraW5kcyBvZiBmdW5ueSBhbGxvY2F0aW9uIHJlc3RyaWN0aW9ucy4gSW4gb3Ro
ZXIgd29yZHMgSSBuZWVkIHRvIApndWFyYW50ZWUgdGhhdCB0aGUgYWxsb2NhdGVkIG1lbW9yeSBp
cyBjb2hlcmVudCBhY2Nlc3NpYmxlIHRvIHRoZSBHUFUgCndpdGhvdXQgdXNpbmcgU1dJT1RMQi4K
ClRoZSBzaW1wbGUgY2FzZSBpcyB0aGF0IHRoZSBkZXZpY2UgY2FuIG9ubHkgZG8gRE1BMzIsIGJ1
dCB5b3UgYWxzbyBnb3QgCmRldmljZSB3aGljaCBjYW4gb25seSBkbyA0MGJpdHMgb3IgNDhiaXRz
LgoKT24gdG9wIG9mIHRoYXQgeW91IGFsc28gZ290IEFHUCwgQ01BIGFuZCBzdHVmZiBsaWtlIENQ
VSBjYWNoZSBiZWhhdmlvciAKY2hhbmdlcyAod3JpdGUgYmFjayB2cy4gd3JpdGUgdGhyb3VnaCwg
dnMuIHVuY2FjaGVkKS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
