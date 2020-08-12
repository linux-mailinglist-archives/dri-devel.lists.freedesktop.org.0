Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1780242731
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B496E061;
	Wed, 12 Aug 2020 09:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580A6E061
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGT+NAcG7CH93c2PnIM731RkE/SIsKx0hPjAuX3YfOFfJcTsiqDIToeVMFDE0waZzZ9FN+hm08j2kcvNGZTmyQ/NdOtO12Kmn+oDt+ZQFP3+D48cK61Rv0fGuQ/Eq6siPkUuc96GFYsZTZV5rlQXr8zReimEd4JUzlbBhUKQwtAkl6+PhvupMgtuN7YWINOT33ClkRFjoH62iDC2pzWkPJp7iQvLGnW1vszfj0g03STqYXhKYufSH8xstNSbAE2feO9qJPejZXzLchrQ9TMYVnes6JcHf5m0lcViJCzVN3tYtv0EJ8+LtAHaychc7vWczFMALbNbGKE1kdoNeRDflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tTGghs+gCmO5vBvbT3slKFWHYnnba6Iy3CRmK9hd1w=;
 b=YuRMvLKu6UjLFnLzRznxkX81n9D2dmYkWr5IA2kDF70m4wPYbVllsE6pOZpJTSI5M/21F3VEPP6OWpoRVAwtq80gKLbNHCCAeHDWxeKtojt/WLJZivaVrjtmE4rwFSQfvDi5CbWb1Gz9R+8gbUhSuOdl3qSCfzSUFWfRUO3tQbGsPfLTzDHdOvKUdba3a3yYqANoYwRGBwaE7f39khr40lfc/BTEk+QiTEKqshWePEQ4SFOkc+EwJndtBqxfy9H3KcePtiuYhnHYPQ6m1/+TTH/ToDpHWLOcvSSqdM+srIdL9C4HqpoylmfwGvzpGHnco/e9OMkOLFSkvy8p1pI28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tTGghs+gCmO5vBvbT3slKFWHYnnba6Iy3CRmK9hd1w=;
 b=3g+jSxj+dYh9qf99rZ2cJLjA0UzHaOLQvNkn6/KaR7sWPzwlGoA9dVFcoacpTyhvsp6wFWs9BVQCPhc5oS+XGPFnAmmqN/SA+ndJ1F/e6vHhmxdi2zxe2InX9nxesh/PtHwggOcGCVTnl8GsyUEikLVLpNXZ2vhG1B08/XNAstE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 12 Aug
 2020 09:08:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Wed, 12 Aug 2020
 09:08:23 +0000
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: Dave Airlie <airlied@gmail.com>
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
 <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
 <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
 <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
 <CAPM=9tzM8CRt7myYbcBnX49geOFuFMUAHiKrWMa4+jebF9trgg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a75ad5e2-b8b1-3fb3-e7f9-b4ecc347b13c@amd.com>
Date: Wed, 12 Aug 2020 11:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzM8CRt7myYbcBnX49geOFuFMUAHiKrWMa4+jebF9trgg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:205::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Wed, 12 Aug 2020 09:08:22 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb742b0a-e33b-434e-8db3-08d83e9f43ff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43742878FA0980E8D09893DE83420@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GZWoJkxA2EQVG8VSuMtPUHrsosqfFbpa3qCSKR0VcGzt58Jd15RRTXshDuq+CFiFz8dPzRyJNCaYNdXE9mldGmmIxtJMmBvxV2xbaguxFrqsnUV94DuNQOebjZJkpsmgQF+mpmzcHcnK+vfABMzxx9up9rI/T8kx+jMPz7sg8o43RyWA10peCcEa9BuMgdmieOXvOzkeqUTCX657+DmiKHXjaEwINagikwPoNXK6PnRaDOYOLwLsqD27yV56GWBxc5y7/fy1M5EyGRMe4W7rI8m2eXvkd8bcxuDLgFM+W9MgMlkVdQTNl3DmnfeRFjK+L5hKz6W3GfuOZVLMvJTOEKqBeeqXhM8JY6wRiVA/XiOof0VkNyeAJVFv83mjELpW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(52116002)(31686004)(8936002)(66556008)(54906003)(4326008)(316002)(5660300002)(66946007)(53546011)(186003)(16526019)(66476007)(31696002)(478600001)(8676002)(2906002)(2616005)(86362001)(36756003)(6666004)(6916009)(6486002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: N5zjJVPz5V9k56W2+MyWdr0N5AqV8Bs1VuTt68HCym0ByOj5pfKckwvb8Yk1Jt2o3rjOHFFuCs5nSgUALCPaDx0J7KYuyxFvMj2dIq8eCPv9NPyYC2Wryh6JotiVgC++BDPo5+eVFeXYlHVoWEEReUQgvz2xERaU4ifQ8oyQkFAC7wMe59y7i88XUcUc6EcO4eEap3XzTgQ9MbQ/k8yyEL/SB/cHpIr8ltsjb74u+Jbeo83uGoZEVdiLRoLcIdABN2dB0MqnQWXXjsZUZQUV5p+spGEeNJwWoDEm+btXxh3sak2hLx6clnlnnHYt6ubAVSr4VVJIg5ligajSxdRtha4dHiLpvPwtKYR2yvSjF4Xqweoen/cFXuXlawqYL2t6E3P6c2bNUeMgEdMTpnYh0wvoNpgnYvnxnS87Nb3hZL71qOCIHTZNnxlVTW44NdYRNQl9/v5QW5c+diYjNMv+VAw+ADBKrea88pEtFxvUrUKqOrdt4S8jUUHvlHR5y+eraJ7Jyozqhh498SG5sHPs9VV9ziqoOAfObl9dtn+idBuof2aSD48hZPTMGRV+EMWrXouTy5J+S5aViCrnlL0a/TVdB3IeWX2KP2mDDzEe69/KqqcwzVY5s5Ty0lVIBZoZ+7CqxIdpxBFHEheSf4E3+HRgTWbRgUy2NaMKCS0zm1z6sZnbtnHsf6ALRxDfOQXuyHyFvVwI6KhamTR+CE04Xg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb742b0a-e33b-434e-8db3-08d83e9f43ff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 09:08:23.6187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeuxlTxZ0zyFDSV6dxPaRM7PSGxe0zqi6sAoCUmUNBrxU7QlsbmZyhmtyOTUWPe4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDguMjAgdW0gMDU6MDIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBXZWQsIDEyIEF1
ZyAyMDIwIGF0IDA1OjM0LCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+
PiBPbiBXZWQsIDEyIEF1ZyAyMDIwIGF0IDAzOjExLCBDaHJpc3RpYW4gS8O2bmlnCj4+IDxja29l
bmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBBbSAxMS4wOC4yMCB1bSAx
ODo0MiBzY2hyaWViIE1pY2hlbCBEw6RuemVyOgo+Pj4+IE9uIDIwMjAtMDgtMTEgMjo1MyBwLm0u
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAxMS4wOC4yMCB1bSAxNDo1MiBzY2hy
aWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4+PiBBbSAxMS4wOC4yMCB1bSAxMToyNCBzY2hyaWVi
IENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCAyZGRlZjE3Njc4
YmMyZWExZDIwNTE3ZGQyYjRlZDRhYTk2N2ZmYThiLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQXMgaXQgdHVy
bmVkIG91dCBWTVdHRlggbmVlZHMgYSBtdWNoIHdpZGVyIGF1ZGl0IHRvIGZpeCB0aGlzLgo+Pj4+
Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+Pj4+Pj4gRGFyZSB0byBnaXZlIG1lIGFuIHJiIGZvciB0aGlzPyBJIGFs
cmVhZHkgdGVzdGVkIG9uIGFtZGdwdSBhbmQgaXQKPj4+Pj4+IHNob3VsZCBiZSBmaXhpbmcgdGhl
IFZNV0dGWCBwcm9ibGVtcyB3ZSBjdXJyZW50bHkgaGF2ZS4KPj4+Pj4gVXBzLCB0aGF0IHdhcyB5
b3VyIG9sZCBBTUQgYWRkcmVzcyA6KQo+Pj4+Pgo+Pj4+PiBTbyBvbmNlIG1vcmUgd2l0aCBmZWVs
aW5nLAo+Pj4+IDopCj4+Pj4KPj4+PiBIb3dldmVyLCBJJ20gYWZyYWlkIEknbSBub3QgZGVlcCBl
bm91Z2ggaW50byBUVE0gY29kZSBhbnltb3JlIHRvIGdpdmUKPj4+PiB5b3UgYW4gUi1iLCBnaXZl
biBpdCdzIG5vdCBhIHN0cmFpZ2h0IHJldmVydCAocHJlc3VtYWJseSBkdWUgdG8gb3RoZXIKPj4+
PiBjaGFuZ2VzIGluIHRoZSBtZWFudGltZSkuCj4+PiBZZWFoLCBpbmRlZWQgaGFkIHRvIGtlZXAg
RGF2ZXMgY2hhbmdlcyBpbnRhY3QuCj4+Pgo+Pj4gRGF2ZSBjYW4geW91IHRha2UgYSBsb29rIHRo
ZW4/Cj4+IFl1cCBqdXN0IGNhbWUgaW4gYWZ0ZXIgbXkgInN0b3Agd29ya2luZyBEYXZlIiB0aW1l
Lgo+Pgo+PiBEaWQgeW91IGhhdmUgYW4gYW1kZ3B1IHBhdGNoIHRoYXQgd29ya2VkIG9uIHRvcCBv
ZiB0aGlzPyBkb2VzIHRoYXQKPj4gbmVlZCByZXZlcnRpbmcgb3IgZGlkIGl0IG5vdCBsYW5kIHll
dD8KPiBPaCBJIGNvbmZ1c2VkIHRoaXMgd2l0aCB0aGUgdHRtX21lbV9yZWcgaGFuZGxpbmcgZml4
IHRoYXQgaGFkIGFuIGFtZGdwdSBwYXRjaC4KPgo+IEknbGwgcHVsbCB0aGlzIGludG8gbXkgZml4
ZXMgdHJlZSBmb3IgTGludXMgbm93LgoKU2hvdWxkIEkgcHVzaCBpdCB0byBkcm0tbWlzYy1uZXh0
IHRoZW4/CgpDaHJpc3RpYW4uCgo+Cj4gRGF2ZS4KPgo+PiBPdGhlcndpc2UsCj4+Cj4+IFJldmll
d2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
