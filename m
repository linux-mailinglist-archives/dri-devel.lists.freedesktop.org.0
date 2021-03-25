Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E0349198
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 13:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979186ED13;
	Thu, 25 Mar 2021 12:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8C6ED13
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 12:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeYdFoQI96kXiieSVoVhcHjRALTQldddUGzep6ojW/2g6boiETIfePq7lQFTGjsBkaBXE/iIYfYz42MucpuHuX66oc/6P7Ru8X2djAvK/TBq4DkCQErHPBKWPaxRyWldELlHFd4WiFkEE+dH8+bUg91RlFupK00ksIC7608Wg4mCSdY+qIfIkbzAN3AUvR5M1O5cQV2kxva6QQgQP1624o5TN062+RXlawyu/at6yoGK2xJYC3aQWbWw5hANri5Z5H3Eo32nUGlc37tk2DGen406VgQqRm20dWTu2KF2wimRz3J0yy9VcrTELKwCm9JPMtHgGqKjoKOgfOipogLGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNNCKiKYtIfc6MTeqcb/UPRwDFuOIVObovpLtCf84i4=;
 b=Zx2xIaf7qEqAbrEkb2BTqpoypn27OZkwfn9rZmkw8sBVCLuFjq8HHxkyrQXsAFGsLiozeYDFp3/m+Ar4Qiujyb1A6v5v46+eNPXJFotGz7G5YL8Sr7HMp6JEngu032hZ6eOFssRYbgxoUuezj9FN4tWC0juBfXj1mHkVdjc0KI6kbb3lVQsPCkJxhESRYPn9RESGBsPo7pAOp6vMuAGOKtDT31vzvtSdkXpfAZk7SJq8dsNm+P1mFuasLM7O9Kw4qVRuOZdL8BSBx+za9S60SdoK3jS6ofu6jHo64CbOFCUM2lEAxY7GYLybqpNy2J5JjASN5Vn39b/odte0/2RQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNNCKiKYtIfc6MTeqcb/UPRwDFuOIVObovpLtCf84i4=;
 b=neFxx4KK2ThGn/wic5k0wLE5Op2AmqBXqcbhwKcnJeumTS3SpnJ5YKIryQKOOnI/vEhJfIinoeKs7hxYG3KZ6aixrSS/0via7NTqXOm7QmnYX320p9H0cIknOm98RBB9SG4XbpbYK2B/QOgnDPvnoDoUrxIO8tB1BMSz5T98O1A=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 12:09:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 12:09:19 +0000
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
Date: Thu, 25 Mar 2021 13:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325120103.GV2356281@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:72d1:2a48:a80e:e149]
X-ClientProxiedBy: AM0PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:208:122::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:72d1:2a48:a80e:e149]
 (2a02:908:1252:fb60:72d1:2a48:a80e:e149) by
 AM0PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:208:122::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.28 via Frontend
 Transport; Thu, 25 Mar 2021 12:09:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8bc5b83d-4154-4ced-78d6-08d8ef86d14d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254F948D9ACA3FB4AEE280883629@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gw7mmkqWLM8MydYU4YLrLWmWzu8CRE8t9Ais4O1A4xs8N/YPS5RresNOxbieihb+O89XRPCGzyqXDmN7JoRwIoFV1Rh08FhNXOSFrd1K6IJGUUVwzWenJ/pgFk6UKmKRQFBHJqmEm6ZMjSpWFWMp5DV4b2ExVVKGmL7zjpBkuVrl8B8Ye8YoZ2mTHYzwk3mdfxAw67wEcGesU1M01zXmArvPvdR5jPxmP+uKTGrkIyn9bO9svZsZnO4aDut0kJIMWjlfrzI8QwhbyKHSsIrg6cJ+T0QSJwOuX1Cbb+/+725p+NzxpFd51l/w3orsrClfFyEvBi6101v7F40V6okjrHeuVYqg1LpJbB7UWX+kapma3njmvQEauXNqh8Wek87alX8dfULJ1zBbALWEtzglVhY2hShCeAHPdq1vp/OUKvwoM0Nb0LVJb3HOKk2SxWeBq51LBPNaL/WHjs+50AFT4f4ErFV0WagLJm8rGhVc+FReadImdK4bogK6jb+Es/pXdj12qyrvTPxnE4ZJ4cIFKIPj05fxxCg7RLfApsQinqg1CmCZkvIy2PqgdnChsCaWmZlzSBDjuFSqEJ14pvxKLArXIvahYT4T4pbrH26FWlwTu8jsGj7o5i/02dEwFVLb6Hj3+XqIZI7vhYgjmF5qRyXTrEqDYu+rwH78Ek2vsID6baUxlCJmqs6PQ0/l9RG8KJC3WpmT/52Igv3Z/reRudoYwK8EXl2nOvacua5DW1cLArWoSyhWBZMltPB3Z+k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(6666004)(4744005)(66476007)(2906002)(66946007)(66556008)(110136005)(36756003)(8676002)(478600001)(31696002)(2616005)(86362001)(8936002)(16526019)(5660300002)(52116002)(38100700001)(4326008)(54906003)(316002)(186003)(6486002)(31686004)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2FtS1Q3Slg2U1Eva0tZWnY5OFk4cmh2Tmk5bFJRaEtPN25vWlBSeC92Z2ox?=
 =?utf-8?B?OFc5c2pHT1hwb2cvVFY5eHhxU081bUdCdzJZN2pjeTVWRXZlTW9wN2pjMnM4?=
 =?utf-8?B?RkZKT0p5MDFjdWRoVS9SRitaQStoT0o1SGtML2RtVUZyQ0syb2dyM0lmRnhU?=
 =?utf-8?B?TnFVdmJtaitPTjBzNmxJemZab2s0SGNWQm9sclFVM1E4cXV2WGJXZy9KdDBE?=
 =?utf-8?B?eEs0THlqZm5iYktPWXFaVnQrWEIySVB6blRSSURNQXA4OENZY1Q2b2lKOHJL?=
 =?utf-8?B?bVhrUlcwZisya3ZrcDh1bXkyZDM3ellMTTd4V0lweGhZQ3dOaDA3ZnYvNGFM?=
 =?utf-8?B?dU1tV1ZvekJBdmlzWkhsS0VhUm5SNU0wZFF0WnRhSjhNVVNwaFk1RTYySCt4?=
 =?utf-8?B?YmtiS25EbWkwcmxaS0t6VkFLcWdBdldFdnlERG9JQ1pPUFRZUmY3ZGp1VlJY?=
 =?utf-8?B?eTlmcVh5dTZpV0VWNlg4TVBHRVBkek9YMElydkhpUGEvQ3cvSEQ3bXVveXJ0?=
 =?utf-8?B?bjNHeE0xcXdjSlQvMlp1R1Rlay9FaW4yV0lQYXA4bkFsQnoxMTZNTjMzdkc0?=
 =?utf-8?B?WXNSOEIxUXVISmFXd0djSGRFVEo3YWtGWlkvTXd3ZC8vZnB4WUFZa3lMRFZa?=
 =?utf-8?B?TEVqeFUzdnl3UlVUNkptV0sxaVZFQ25nVUhEUlQrd283MXRIT3N2UWhYOTdx?=
 =?utf-8?B?ZCtOQndsZ25FSjVRZDFqSUhkRjBCZllHK1lOdWYwSnJPL1Y2WDlCWkI3elZ1?=
 =?utf-8?B?Qld2Y3BHeHQ2b1VLbW1tekoxcUp1cXE1VkJRTFljY2ZZUFFvQUZZMis1eWdE?=
 =?utf-8?B?aTNDbjNoZXlleGtnNE15RXp5V1g5M0NIbWZpL0ZBb3B3WTNndWxSVkRxNm0w?=
 =?utf-8?B?YjlkZk93Mkx6Mzd4MEJKNi9MTDZlM2NQRlNMT0d2UVJKbHlWeHdSOW9PdEpK?=
 =?utf-8?B?TnhQd2VLRTBVRzBLWkdVT3AxZjNEb2xNQnhaYnhzclV4ays4Ui96SlpXUm1v?=
 =?utf-8?B?cG1XV1R4Skd2OGk4d2d4WURIN2ROR3BKUjFWSUZKU2hBYzliOVlObVIwRVps?=
 =?utf-8?B?TWFSbjFVY1VMNUgvTWR0bzNVOTFNMHp6SGxyNkxSVW02TXRnOUk2ZlpUVEo1?=
 =?utf-8?B?eDEyYzMxdXB6Z3BHRlM4YXE1SXRZSk0waHhGRkQrZ29WTlZ2RWxabHBwa0xG?=
 =?utf-8?B?UCtIMmpBeHNRTUxTTlYvdFNFRCtPa3JnNTltQUJ2UzFlVWNEMlJUWmljbHBE?=
 =?utf-8?B?bFpvclZmS3BNbjEwOEdUR3A2VE1vSmsybHg1bDdKUlRUMVc0aU1Xd2ZGM1dp?=
 =?utf-8?B?Q0ZvM2NGbXNuWDYvNEtMS3RlTmhCY29wMUFUMk9XSGZiUmRPSGhIZW14QlM3?=
 =?utf-8?B?MUxmSy9qVDY2dUlxVnd2RU53bDFDaUV5aDByb2RPYVR5dnFmclFnZER1R0hY?=
 =?utf-8?B?b0hCb3cwc2tPcG9QSDBvK2s5VUVFeXhDQW9FN0x6djJtVWFKVEg5MjJNdWdE?=
 =?utf-8?B?eWx0SFZibXh3ZUZWYTJYVktYWndlN0wraTBxbDQ1eW91czV2N0YzeVpIYVlj?=
 =?utf-8?B?TkVwT3FvZXEvZk9rb0FMOTkzWlZVR3dsNXRNdWFDdmlmcXJZcFV6UnJDRWVh?=
 =?utf-8?B?M2czbk5WUVU0U2ppSVVOejVPMWppNGtFVnZPaFpuRkg4REtDMjMxZ1FSVlJO?=
 =?utf-8?B?dFZqUUNNREtKTE9HcHdnbjMyYnhlbUM3Z0RiUmh5OWcxbGh6UUVmdFJ0SlIz?=
 =?utf-8?B?T1dkZ011V2MwN3kzTFVtNFZHbUVQdjhQSWc1Rjd3anZVc1FQWUpNeDM1c2tH?=
 =?utf-8?B?UURIelpwdHczN3Zta0QyQTFycDk5QnVnQ1pnNVhZZWtJZnNNclB2SStBM1Bn?=
 =?utf-8?Q?qmT+Lj/YeBZMv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc5b83d-4154-4ced-78d6-08d8ef86d14d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 12:09:19.7861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSxOliQYsqc++A2k1AqpE/SmUY7ksH1zVAPRjeXO21MBezlrLFxDQj/bLEEc+if5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: David Airlie <airlied@linux.ie>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDMuMjEgdW0gMTM6MDEgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBN
YXIgMjUsIDIwMjEgYXQgMTI6NTM6MTVQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KSB3cm90ZToKPgo+PiBOb3BlLiBUaGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0aGlzIGNhc2Us
IHRvIG1ha2Ugc3VyZSBtbWFwIHVzZXMgdGhlCj4+IGNvcnJlY3QgVkEgdG8gZ2l2ZSB1cyBhIHJl
YXNvbmFibGUgY2hhbmNlIG9mIGFsaWduZW1lbnQsIHRoZSBkcml2ZXIgbWlnaHQKPj4gbmVlZCB0
byBiZSBhd2FyZSBvZiBhbmQgZG8gdHJpY2tlcnkgd2l0aCB0aGUgaHVnZSBwYWdlLXRhYmxlLWVu
dHJ5IHNpemVzCj4+IGFueXdheSwgYWx0aG91Z2ggSSB0aGluayBpbiBtb3N0IGNhc2VzIGEgc3Rh
bmRhcmQgaGVscGVyIGZvciB0aGlzIGNhbiBiZQo+PiBzdXBwbGllZC4KPiBPZiBjb3Vyc2UgdGhl
IGRyaXZlciBuZWVkcyBzb21lIHdheSB0byBpbmZsdWVuY2UgdGhlIFZBIG1tYXAgdXNlcywKPiBn
ZXJuYWxseSBpdCBzaG91bGQgYWxpZ24gdG8gdGhlIG5hdHVyYWwgcGFnZSBzaXplIG9mIHRoZSBk
ZXZpY2UKCldlbGwgYSBtbWFwKCkgbmVlZHMgdG8gYmUgYWxpZ25lZCB0byB0aGUgcGFnZSBzaXpl
IG9mIHRoZSBDUFUsIGJ1dCBub3QgCm5lY2Vzc2FyaWx5IHRvIHRoZSBvbmUgb2YgdGhlIGRldmlj
ZS4KClNvIEknbSBwcmV0dHkgc3VyZSB0aGUgZGV2aWNlIGRyaXZlciBzaG91bGQgbm90IGJlIGlu
dm9sdmVkIGluIGFueSB3YXkgCnRoZSBjaG9vc2luZyBvZiB0aGUgVkEgZm9yIHRoZSBDUFUgbWFw
cGluZy4KCkNocmlzdGlhbi4KCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
