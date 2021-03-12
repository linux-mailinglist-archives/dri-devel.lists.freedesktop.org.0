Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F433871D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB90A6F47D;
	Fri, 12 Mar 2021 08:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BEF6F47D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 08:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDEyGzW6wkue+P8x98kDHHYr4bp3EX8Vy+9eXiNAUeCcbDscNTkbUGS1/G1VWSNaeanhwNY42wOTUkQ30dNdXdixkBvWP4ctxSV+qS2OwOQJWufcrVn7fE7+ZFJF1VuMoxqatbx/NzXFRlGT1DcfHOCKpuy5eaSmU4EAnWJ766cMdANUpuQkhMm4PSrDebPHF8Jdz1udSFClzDGa4gEncqc8THNlXwUAE4ojmMd30K19zyeElO374jk86oZGwIGoKGDlw89hEF4MTdKtB2du16tsdIhZJ7FW0lncEpm4Hi5jBLjQMR4caAIjHmdpfFAHKW9iFkPK9F8BOBNcswMTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz6MwZpwjCkWp88q+y1A/991BHvqiyldDIHORMqoo9Y=;
 b=nTjDZHoKsltQco2K6gjwtqyzHBgmhayO34k2LbePdztt3z47C8NGwn0Yn0RQRLfRDeveEn8ISY4v7nwwMIQyQ7GkskEv1gPKkus744tiqjddvzcqIefOfuSENnaiwG9nYbCpBLWSqkcritoHccUXd887nxvis8wUKYYkXsn9ZtciiPcbm2ptTa9kQAAd0V7EsU9OlsHI/MyRP/o7muksleEEfjgB4zP6SpUTORgZdx1Q0uLfGmhq9zqi+24uSg0RSFKavXfogKNGnvH1NgJhDu0ObNIEQ9s3Y7T2Fjz/m02w7mQgweMVWUUxCTbkwTp7hgB+SKMK+y6PajWgmqbdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz6MwZpwjCkWp88q+y1A/991BHvqiyldDIHORMqoo9Y=;
 b=5JELISRKTEesi4BObNcZdpHaXhUV5WZD/4ih+EC7w8ONxrZotOdvLRcePjkLFxJO52SyRCMVxMZCYaqKZWnCBVLPy0Bn0n7QOM+7YrixpRNMX221COKd2+hLfOV9RdAAKz66zwlQA5o9A+1of+7FIt/tyOlsFrhKyZAkMeYkEaM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Fri, 12 Mar
 2021 08:13:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 08:13:42 +0000
Subject: Re: vmwgfx leaking bo pins?
To: Zack Rusin <zackr@vmware.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8809a7fa-115b-9987-71cd-0510b6d4f39f@amd.com>
Date: Fri, 12 Mar 2021 09:13:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2108:8a72:3f15:1a1f]
X-ClientProxiedBy: AM0PR02CA0178.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2108:8a72:3f15:1a1f]
 (2a02:908:1252:fb60:2108:8a72:3f15:1a1f) by
 AM0PR02CA0178.eurprd02.prod.outlook.com (2603:10a6:20b:28e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Fri, 12 Mar 2021 08:13:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ac01555-5205-4699-af3b-08d8e52ebfe5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455245874A22EA98D7308BA1836F9@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kv360iEblSXwyrrnFVHS5QfmfTyQcDheDDwrM/j25pH5eO7SQaWBk76WtOCp8CIujAaF2OsUSrsg7ZDZIYtfICTUnrYSJfpzhJ7VXD116DXPEouSctV3fc7AiLeCtr7tkzndrhbjcIslPYwDvN9kIFWvlxisb3xq7DRye4UA9T8BWyGQCwzjFE4FMlghvgyR7ppeMpg2vUmMA2TqWopWWVRx7Zk1m2ptQcOWbypT4KeHuW5iezYdczfoodwW7YihxZ+GzZN5s6lHatrntIUDiy2bcYlL3OYlQGBFfauEwwPtLkCpKtW8xZTVB1wg//OLkAA317pRYe39zGZY1ObZm3i3QsX6tzLR/s9nPlPVCScfUt2oZ3ePmqp8e17g3PjHpAGFArKoVvX1Y6MFIvjjKw2SQ70o9kU25puR/CC+DY030Bbrfrl2vEtqOC3Y2WvW/tLNHq4ViSYqjEqs2TX/fmhM8w3Wai1rEnhbF/TXJJ5yM8qN2Bq/tg3r9zdOrGj+uL/dKlYRXUaObzXKzPz45Ftwj3Lbgd3MBjtlvxg6tmz6ktrOpli3Tnw3Ilasw9KZlm9oHfwsg4fa8LYnHlU8xYO2jZat5+uBIVC5ovbdtfXLNS5V+3D9xgTlpmESgeeG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(86362001)(36756003)(8676002)(2906002)(5660300002)(186003)(16526019)(53546011)(4326008)(478600001)(31686004)(31696002)(8936002)(316002)(2616005)(54906003)(66946007)(66556008)(66476007)(110136005)(3480700007)(66574015)(83380400001)(52116002)(6486002)(40753002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzR3ZUowTG91NlM2enY3MjQxTEV1cmo2c25iN3BadzFSWnZnaGU5UC8yTWpJ?=
 =?utf-8?B?SEdFQ2tEOXRuY3BhSnlPTDhORERmNXBYRGJUeWJjT3ljODZLbDhCZUJEc01u?=
 =?utf-8?B?b3lMZ2VFb2Z5NHRGVmtBSzhnT01RMjI2M2NxRmg2elIyWEt1dlpyNllzRU5H?=
 =?utf-8?B?czdIMUV0aWlvVTRKVEI3UVpwcEV6RjRMcGdXZlhDVFBSM29haXNKUi92eEFa?=
 =?utf-8?B?T2V4SmN2cDhnN3IrTHFOQ3R6N1J6NklNRlhzMDhsbUFkN3hUOWtTOExsUnZ1?=
 =?utf-8?B?OEZ2cE5RWEJBOFV5RXNDaWxDd3V6UTFhb2JacEhxVVdFNStDV3NVSzJpdzdM?=
 =?utf-8?B?aTZnYXlFR1Q1RmRZVW9XRm9UT3ZEbWcwc0RwY1FmVjc4SjFSREtWUHAvTnNx?=
 =?utf-8?B?N3Y0eUErak9rVkhuS1BUelpCbVFqZzcxc1BhMHNJWEtjNlorNUxvRWxmdEJS?=
 =?utf-8?B?UEVjRlFxQmk4Zzlua3hzcm15dVBHR1hjaitRZUxaK1NkMjR0MlcxdmdaRzVo?=
 =?utf-8?B?dmdEcWlrY0oySzBFLzBuTlYwR1RJK1AzRnpKSlVpd21BenZhZ1dzaXMwbWRZ?=
 =?utf-8?B?eXVqRVhWUEdRcHJUdTJsN3kvZTgzZmR1WVA2SGJ4WjgvNFJyZm51L3pYNXlY?=
 =?utf-8?B?dDl5RndLT3N2VTdPSU02S0N6VWdqbFF0M3RvU1h3cVQvcUJuNzlldEc1SENr?=
 =?utf-8?B?aTJiN29SRkRrdnFYOTZjMS85dk94blpWTE9OTjNCcEI5RVRlWSt5eWp4Qnha?=
 =?utf-8?B?dmpraWJ4cEM1YnNIMG54Q2JtZHRUQ2ZWUDIrQVZSbnJDVnp0aHByZUFFUE1R?=
 =?utf-8?B?TFpwdFpSeGttZWRzUTdvU0xpdXRnVXNNV1YrMEt3ZU9PN29jQlBrRFAvaGNl?=
 =?utf-8?B?cWhRMnZiMmhxZGl2WTJFUXY0dUZSbmJna2dTYnYvNUliTzZoTzU4bkRNemxl?=
 =?utf-8?B?MHJnSmRWSWpWY0ZXNzNpY0duVkhmWmlzcUNESEgxTmw0N29Za25Ba2ZWUEd2?=
 =?utf-8?B?ZCt1RmNTOTYybGV3bUZHWEV6NDdiNVQ5VnpCK2srMnk5WDJ1YmgxbHdHR0RV?=
 =?utf-8?B?TFp3VU9Ucm1xaU02TGs5M0dtK1hUZHdCTWV5ZUNmd3llMHJMNUdmTGF3T2Rj?=
 =?utf-8?B?aGNUenVIbTM0dU1ZNXNYOEE5VGxkM0ZNeTBodjFUTXMvT2duN1NEU1FXT0tW?=
 =?utf-8?B?c09LS2dwRHYrM01MZVZBTjFWamh3Zm1OR2tpK1RTZnZiTjVBT1pDaVZSRk54?=
 =?utf-8?B?Ulc1OE5Cc0M2d0s4ZHhTeVorMFF6dXBEUzlRYkd0VndxelhNNFlyK2xwT3A1?=
 =?utf-8?B?Ukhyamg2WEJ5VUJPQnhVOU4vZUFEemJ0WDlaWmlsZWZjdG9JUHFwRitwSFMz?=
 =?utf-8?B?eVZ6Y3k4R091VStoV2FoYmVRbUVBdG9QYmoybnlhVmxSVDdRdWtNY284clox?=
 =?utf-8?B?ZXR5UmJDS0FrZTRaWnZuQm5WY1VjWHpnZXRWSjJFY2ZCcC82TEliZjhSOUFX?=
 =?utf-8?B?S0tyYjFRelkrUFB2c2ZVb1hNNmNoeTREdVZHYTVzZ0pKenNpbXNPbC95blVG?=
 =?utf-8?B?UnM1c2QyaHBCdWZlNy9mUHhkY0RSdUpONzJ3RUo3NU4wTjJVbWpaaVRzMk5p?=
 =?utf-8?B?dm1sTXo4Ulo1YXdsY3hTcjZPT2tQeHRvL3ZqaU1iK0VwRC9MQ21ZUDRmcHJS?=
 =?utf-8?B?ZThhaVA0NjVhT3JqK2ZiMWo0UXlQc1BUNmQ0aGRBeTRhQTFmSnN2NjZPVjhk?=
 =?utf-8?B?NlY4dmdZbGw3Mkgzb2VFKzF5ZDdTVVFaaitnUFJyZ3dMelVhdFZrbjdKdUNW?=
 =?utf-8?B?aUV0c1ZzNGdJZWE0aVdKd2wzUnR2amhITUpiSEVWZU5vZVdVTU5sQW1wTzIr?=
 =?utf-8?Q?H4ea7HqxZAXFE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac01555-5205-4699-af3b-08d8e52ebfe5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:13:42.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJts/BNt+oVMpe70VCVQ3R0ftg5WZPf7X+DDcVWOYY6pa5G5h58OQzbwqBm37mt3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMi4wMy4yMSB1bSAwMDowMiBzY2hyaWViIFphY2sgUnVzaW46Cj4KPj4gT24gTWFyIDEx
LCAyMDIxLCBhdCAxNzozNSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IEhpLCBaYWNrCj4+Cj4+IE9uIDMvMTEvMjEgMTA6MDcg
UE0sIFphY2sgUnVzaW4gd3JvdGU6Cj4+Pj4gT24gTWFyIDExLCAyMDIxLCBhdCAwNTo0NiwgVGhv
bWFzIEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+
Pj4KPj4+PiBIaSwKPj4+Pgo+Pj4+IEkgdHJpZWQgbGF0ZXN0IGRybS1maXhlcyB0b2RheSBhbmQg
c2F3IGEgbG90IG9mIHRoZXNlOiBGYWxsb3V0IGZyb20gdHRtIHJld29yaz8KPj4+IFllcywgSSBm
aXhlZCB0aGlzIGluIGQxYTczYzY0MWFmZDI2MTdiZDgwYmNlOGI3MWEwOTZmYzViNzRiN2UgaXQg
d2FzIGluIGRybS1taXNjLW5leHQgaW4gdGhlIGRybS1taXNjIHRyZWUgZm9yIGEgd2hpbGUgYnV0
IGhhc27igJl0IGJlZW4gbWVyZ2VkIGZvciA1LjEyLgoKTWhtLCBjcmFwLiBJIGhvcGVkIHRoYXQg
eW91IHdvdWxkIGhhdmUgdGhlIHNhbWUgaXNzdWUgYXMgcmFkZW9uIHNvbWVob3cgCmFuZCBjb3Vs
ZCBoZWxwIHdpdGggZGVidWdnaW5nLgoKUGxlYXNlIG1ha2Ugc3VyZSB0aGUgcGF0Y2ggaXMgcHVz
aGVkIHRvIGRybS1taXNjLWZpeGVzIHNvIHRoYXQgaXQgZW5kcyAKdXAgZml4ZWQgaW4gNS4xMi4K
Cj4+Pgo+Pj4gego+Pj4KPj4gSG1tLCB5ZXMgYnV0IGRvZXNuJ3QgdGhhdCBmaXggdHJpcCB0aGUg
dHRtX2JvX3VucGluKCkgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik/Cj4gTm8s
IGRvZXNu4oCZdCBzZWVtIHRvLiBUQkggSeKAmW0gbm90IHN1cmUgd2h5IG15c2VsZiwgYnV0IGl0
IHNlZW1zIHRvIGJlIHdvcmtpbmcgZmluZS4KPgo+PiBUYWtpbmcgdGhlIHJlc2VydmF0aW9uIHRv
IHVucGluIGF0IFRUTSBibyBmcmVlIGhhcyBhbHdheXMgYmVlbiBhd2t3YXJkIGFuZCB0aGF0J3Mg
d2h5IHZtd2dmeCBhbmQgSSBndWVzcyBvdGhlciBUVE0gZHJpdmVycyBoYXZlIGJlZW4gc2xvcHB5
IGRvaW5nIHRoYXQgYXMgVFRNIG5ldmVyIGNhcmVkLiBQZXJoYXBzIFRUTSBjb3VsZCBjaGFuZ2Ug
dGhlIHBpbl9jb3VudCB0byBhbiBhdG9taWMgYW5kIGFsbG93IHVubG9ja2VkIHVucGlubmluZz8g
c3RpbGwgcmVxdWlyaW5nIHRoZSByZXNlcnZhdGlvbiBsb2NrIGZvciBwaW5fY291bnQgdHJhbnNp
dGlvbiAwLT4xLCB0aG91Z2guCj4gWWVhLCB0aGF04oCZZCBwcm9iYWJseSBtYWtlIHNlbnNlLiBJ
IHRoaW5rIGluIGdlbmVyYWwganVzdCBtYWtpbmcgc3VyZSB0aGUgcmVxdWlyZW1lbnRzIGFyZSBj
b25zaXN0ZW50IGFuZCB3ZWxsIGRvY3VtZW50ZWQgd291bGQgYmUgZ3JlYXQuCj4KPj4gQWxzbywg
cGlubmluZyBhdCBibyBjcmVhdGlvbiBpbiB2bXdnZnggaGFzIGJlZW4gdG8gZG8gdGhlIGVxdWl2
YWxlbnQgb2YgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoKSAod2hpY2ggYXBpIHdhcyBhZGRlZCBsYXRl
cikuIENyZWF0aW5nIHBpbm5lZCB3b3VsZCBtYWtlIHRoZSBvYmplY3QgaXNvbGF0ZWQgYW5kIGFs
bG93aW5nIHRoZSByZXNlcnZlIHRyeWxvY2sgdGhhdCBmb2xsb3dlZCB0byBhbHdheXMgc3VjY2Vl
ZC4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBUVE0gcGluX2NvdW50LCBpdCBzZWVtcyB0
dG1fYm9faW5pdF9yZXNlcnZlZCgpIGlzIHVzZWQgdG8gZW5hYmxlIHBpbm5lZCBjcmVhdGlvbiB3
aGljaCBpcyB1c2VkIHRvIGVtdWxhdGUgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoKSA6KQo+IFllYSwg
d2Ugc2hvdWxkIHByb2JhYmx5IHBvcnQgdGhlIHZtd2dmeCBjb2RlIHRvIHR0bV9ib19pbml0X3Jl
c2VydmVkIGp1c3QgdG8gYmUgbWF0Y2ggdGhlIG5ld2x5IGVzdGFibGlzaGVkIHNlbWFudGljcy4K
ClllYWgsIEkgc3R1bWJsZWQgb3ZlciB0aGF0IGF0IHdlbGwgZHVyaW5nIG9uZSBvZiB0aGUgY2xl
YW51cHMgYW5kIApjb25zaWRlcmVkIGNoYW5naW5nIHRoZSBpbXBsZW1lbnRhdGlvbi4gQnV0IHRo
ZW4gaXQgZ290IGxvc3QgaW4gYWxsIHRoZSAKcmV3b3JrLgoKQ2hyaXN0aWFuLgoKPiB6CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
