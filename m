Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A732DDA33
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 21:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BC5897D0;
	Thu, 17 Dec 2020 20:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7A78961E;
 Thu, 17 Dec 2020 20:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJsU77fYZ6lSIPsExuCPQhFmvAa9e4S3RSRyiKA9w48Df7CirSeN96gJ7T5aJsLZ3OaMh0bOFb5KYqVgaIYtcuJrY1vLYPt6Fn48N9JdMtpwRe01Ss6GAYktFf5nL3JIs4kd0202MF9RGzZ7m/il1s4v8a1NLCj3TCD/lHKflPWBi0Mu1r1xo45UytIzeBY9WyVBUhfcl8GDBi7VXzupuckOH4W4M0ruKyQvInwx41npdj2PrUEe6YWCwI33pVhRWfoPZvFfin2Y15ZFSa7w4MPmARqrN6YynXSSUDzkpBRev49taSj50UrkWJP+Ge/6pP567aENpVh1OUpEbsCx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K3TDUV6ynoj3fVanb6ntWMbtUiGhi6myP4JAJo6Hdk=;
 b=PVMw0q/yhhDNRtPhTvfIpUuO18Se6qCK8Ah0/RUfdytA6munpDx33yq0XoSB3uVRuxw0JSlPUQToiB2Ii+agUPexsW75cmjyrHjtmFnmDkYFtAoFvqmUMk5C18ZSMGFC6GEBA0mtfgJFw8KUdPbv9Hzua0/LHGcncvodXIqqujqqarXGErbDmtiLI0aIB6LZbMaURQChw6Yc0SaVijGqnIC12GA5YIgSGgHtJ6ohseCF8dfYKWXhFBmGJE/6jrHgFjMOdN0APnyGef8f+ObOkDlMe9fnMmdSSWiM+jmKUyYrtNczHL6U7GX+OK7Z5hLDQjRsZ0bsK9GUFXHZdvFxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K3TDUV6ynoj3fVanb6ntWMbtUiGhi6myP4JAJo6Hdk=;
 b=tPn3rbYIZ5NObCLNXFCFTBJCJV71qcaWyU9PVC2/19seP6F8IMfyObZ8v+WKiE2XuItWhanPXrcluIy4D9P9idi9jA2WGcZmvh2BQqCUvDIBz47D4LZRCixI5DIIaPkdt/vdjXrJMmvmAo2RXXigNrYNCOgeiuI9/0m+RqPz/+A=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 20:38:38 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 20:38:38 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
 <X9tIrE0Ak68HJ391@phenom.ffwll.local>
 <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
 <e1549b76-eed4-fa91-88c6-083e0dfe5595@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <cf18edc7-e1a6-7a6e-3944-63f3463577b9@amd.com>
Date: Thu, 17 Dec 2020 15:38:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <e1549b76-eed4-fa91-88c6-083e0dfe5595@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
X-ClientProxiedBy: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
 (2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435) by
 YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 20:38:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9d747b9-d139-4d25-0a87-08d8a2cbbb7a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44001571DF22AB696C350AB7EAC40@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3XMP0ZSecxhx6H1TEgodlSedvSEx4kSvvKgNrruolnR8l5f4fdVTiBpkgr9ucNBAq5gUq/MmdGmIfEkugrAeCp+efFUnuKCxCztf1RkZ4RElJth8UQcskVcXLfD72gz/cHdLm51krrpAJB6JaUhefZa6A/oEk0KAACP8x0Zve2gIQDiE8fmdcfctLTs6Zm2K3duKBApRbW8QkOc3TOuntqNCImoZGAK5bDh5JWubLiUMMAT+M1rJ5FYVS8WcQVxpZkqbAO9HagvydXLZ5AAikEmicvpLaxlQyojJG7TmrB1W6m9Y5AwyDpVyXJhxCDE6ahiAp2JGiN98+0T5OyIXf+jiNAxMVuN8UKKSED7QZVNlRkoxI3A1Sa7SmTvdKpP5WDItA0fQwtpsbcJ5EIE4H39dCS+MFyWTvpsjsm5/cbyOW/B1RVMpOouyCG9ltA8ShQ5nJBuh8iUdYRRQXLQO8txaPHDbmWTM3f3IrKP17w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(66476007)(2906002)(66556008)(36756003)(316002)(186003)(6486002)(45080400002)(83380400001)(53546011)(66574015)(110136005)(66946007)(7416002)(86362001)(478600001)(8676002)(31696002)(4326008)(966005)(54906003)(16526019)(8936002)(52116002)(5660300002)(2616005)(31686004)(370214003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmU0VFVqVVFmd0ZGWnU0WGkrNW1SMjkzNW9GOE42SVZ0OXE3U1lFOEh2ZmE5?=
 =?utf-8?B?NHBNUzhsOWJIeVRaWnMrNEtpckFKejJQQVhRc0tjR3FOcUlsa2FCdlVnMXh6?=
 =?utf-8?B?cmxNQ2taNllabzhkWDl4aUc0QnhpV2tLMlZUTk9TVDNBb2tFbmlNTkRSV0JZ?=
 =?utf-8?B?OXh6ZHQ3ekFmZHVSVGN6dUdNSERSek9JZzlsU0NoNzhjNGdZV3pFR3NhVWds?=
 =?utf-8?B?RnJJNkIzdGkyV05XVW9aSzk2cG1uZHdFZ0lnOU5pTnFVeGdGcEt5ejF0VG9q?=
 =?utf-8?B?NzBmTUNia2R3SHBIRThVTU1ia1NFQVRmOXpTcWIrdG1yNmxFejFMYjNLQk5V?=
 =?utf-8?B?a2orY2ZoTHZnQ3NYdWhQSDFXMjMrdmROci9NcDVtWmxsTXplbEFZNGF6QmZF?=
 =?utf-8?B?NDVybUp1YThrQmpGV0k2cmRDeWM1cUxDWXpuamFVbFNuMFpqL0tEcHVXZERH?=
 =?utf-8?B?U3Bmbm41K0pkWEE3LytoZ0p2SlpEV0dHWFRjZ1VsN3dzR3V1S29WTFpsa1dZ?=
 =?utf-8?B?dUNDMklCWTU4RUFLOVdKakQrWmNnNGp1a0I3SHllTmlGWGdrQXo5RVJ1QThI?=
 =?utf-8?B?TEtzUDEzOWtvaWdGaUpYVjMydkYrbmFlODBrZlVTdmE0UEFVOW9iNjVRRUtS?=
 =?utf-8?B?dlNQMmZPNTdteG9JaWV1YnZENU1rQXd2NEplZVdBbnd0NzRKUjlQVnpONW5F?=
 =?utf-8?B?RnhGZmMrcTRFOFJNMllRcGFudkhFZEttcG5pa0drNlZPejNCUUxOS0x0YnE1?=
 =?utf-8?B?bndoODc4RDJlQ0NJRlErNHVNeEs3dXNGRHZpbmtkdHlObUZjSWJFcnR1aFJT?=
 =?utf-8?B?QW1ONnZIbWYrVE50V21uZzNxQ3pXSkp6bElMNnVYR1lhUUNBS0dyejlrWmJV?=
 =?utf-8?B?TzBYSkYvS2kvQzZzU1Y3eWlLVmJ5NGZEbTk4QnhrcEFQOGZoYjZnYkFSZDR4?=
 =?utf-8?B?dVluSWllQ3hxNmJoL3QvaGdTV3BhTDlOenBRS2crQjcrYkRpUXpla1JubEMv?=
 =?utf-8?B?UjlQUVYxeVdwSkxUUk52eEFJTEJtS1NFR1gybnBOK2NUVWExLzdiRDRKVXRi?=
 =?utf-8?B?SStKa2dwN0NTMThrV1dzMWxXVDFnTzlseTdQMHRBVWNjbnlud3J4cFBmUzkz?=
 =?utf-8?B?SVlra3FseXNMd1pjVC8xcThzRks1ZXZBcHlCMmQ2Q2wzNHJLMmJ1eEg4cTNM?=
 =?utf-8?B?MnlGUGhkSFhpbFlJZEJFNm9ZZHgwbFZoZ2pOZ2NsSkN3NVZwR3NMR3ROQU9a?=
 =?utf-8?B?U05SL1ZMMmlHN3ZGTlJmM2V0cXZ6S2VNMDk3Y25jVkZCbmtCZHRIN2RVVVhM?=
 =?utf-8?B?OENGSmNwRzVsVkFwQk94MVQyMXRuRzRBS3VtL25zQStOVzRxblhYd0FQWkcv?=
 =?utf-8?B?aUI3Sk5pVVp3ekNwS1JSM0ZOT29RK0FVU2o3Qm1wRTQvWmJyV25lbFd6UEww?=
 =?utf-8?Q?1AX8Srs4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 20:38:37.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d747b9-d139-4d25-0a87-08d8a2cbbb7a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQbm2IDIAEaBSYEV6oMtUVW5p2b7e2+2AtXIdTfJTww5QBc04N/WdIbmLl3ErQ/t/98FvqNiFsthcdEbmXH/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE3LzIwIDM6MTAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gW1NOSVBdCj4+
Pj4gQnkgZWxpbWluYXRpbmcgc3VjaCB1c2VycywgYW5kIHJlcGxhY2luZyB0aGVtIHdpdGggbG9j
YWwgbWFwcyB3aGljaAo+Pj4+PiBhcmUgc3RyaWN0bHkgYm91bmQgaW4gaG93IGxvbmcgdGhleSBj
YW4gZXhpc3QgKGFuZCBoZW5jZSB3ZSBjYW4KPj4+Pj4gc2VyaWFsaXplIGFnYWluc3QgdGhlbSBm
aW5pc2hpbmcgaW4gb3VyIGhvdHVucGx1ZyBjb2RlKS4KPj4+PiBOb3Qgc3VyZSBJIHNlZSBob3cg
c2VyaWFsaXppbmcgYWdhaW5zdCBCTyBtYXAvdW5tYXAgaGVscHMgLSBvdXIgcHJvYmxlbSBhcwo+
Pj4+IHlvdSBkZXNjcmliZWQgaXMgdGhhdCBvbmNlCj4+Pj4gZGV2aWNlIGlzIGV4dHJhY3RlZCBh
bmQgdGhlbiBzb21ldGhpbmcgZWxzZSBxdWlja2x5IHRha2VzIGl0J3MgcGxhY2UgaW4gdGhlCj4+
Pj4gUENJIHRvcG9sb2d5Cj4+Pj4gYW5kIGdldHMgYXNzaWduZWQgc2FtZSBwaHlzaWNhbCBJTyBy
YW5nZXMsIHRoZW4gb3VyIGRyaXZlciB3aWxsIHN0YXJ0IAo+Pj4+IGFjY2Vzc2luZyB0aGlzCj4+
Pj4gbmV3IGRldmljZSBiZWNhdXNlIG91ciAnem9tYmllJyBCT3MgYXJlIHN0aWxsIHBvaW50aW5n
IHRvIHRob3NlIHJhbmdlcy4KPj4+IFVudGlsIHlvdXIgZHJpdmVyJ3MgcmVtb3ZlIGNhbGxiYWNr
IGlzIGZpbmlzaGVkIHRoZSByYW5nZXMgc3RheSByZXNlcnZlZC4KPj4KPj4KPj4gVGhlIHJhbmdl
cyBzdGF5IHJlc2VydmVkIHVudGlsIHVubWFwcGVkIHdoaWNoIGhhcHBlbnMgaW4gYm8tPmRlc3Ry
b3kKPgo+IEknbSBub3Qgc3VyZSBvZiB0aGF0LiBXaHkgZG8geW91IHRoaW5rIHRoYXQ/CgoKQmVj
YXVzZSBvZiB0aGlzIHNlcXVlbmNlIAp0dG1fYm9fcmVsZWFzZS0+ZGVzdHJveS0+YW1kZ3B1X2Jv
X2Rlc3Ryb3ktPmFtZGdwdV9ib19rdW5tYXAtPi4uLi0+aW91bm1hcApJcyB0aGVyZSBhbm90aGVy
IHBsYWNlIEkgYW0gbWlzc2luZyA/CgoKPgo+PiB3aGljaCBmb3IgbW9zdCBpbnRlcm5hbGx5IGFs
bG9jYXRlZCBidWZmZXJzIGlzIGR1cmluZyBzd19maW5pIHdoZW4gbGFzdCBkcm1fcHV0Cj4+IGlz
IGNhbGxlZC4KPj4KPj4KPj4+IElmIHRoYXQncyBub3QgdGhlIGNhc2UsIHRoZW4gaG90dW5wbHVn
IHdvdWxkIGJlIGZ1bmRhbWVudGFsbHkgaW1wb3NzaWJsZQo+Pj4gb3QgaGFuZGxlIGNvcnJlY3Rs
eS4KPj4+Cj4+PiBPZiBjb3Vyc2UgYWxsIHRoZSBtbWlvIGFjdGlvbnMgd2lsbCB0aW1lIG91dCwg
c28gaXQgbWlnaHQgdGFrZSBzb21lIHRpbWUKPj4+IHRvIGdldCB0aHJvdWdoIGl0IGFsbC4KPj4K
Pj4KPj4gSSBmb3VuZCB0aGF0IFBDSSBjb2RlIHByb3ZpZGVzIHBjaV9kZXZpY2VfaXNfcHJlc2Vu
dCBmdW5jdGlvbgo+PiB3ZSBjYW4gdXNlIHRvIGF2b2lkIHRpbWVvdXRzIC0gaXQgcmVhZHMgZGV2
aWNlIHZlbmRvciBhbmQgY2hlY2tzIGlmIGFsbCAxcyBpcyAKPj4gcmV0dXJuZWQKPj4gb3Igbm90
LiBXZSBjYW4gY2FsbCBpdCBmcm9tIHdpdGhpbiByZWdpc3RlciBhY2Nlc3NvcnMgYmVmb3JlIHRy
eWluZyByZWFkL3dyaXRlCj4KPiBUaGF0J3Mgd2F5IHRvIG11Y2ggb3ZlcmhlYWQhIFdlIG5lZWQg
dG8ga2VlcCB0aGF0IG11Y2ggbG93ZXIgb3IgaXQgd2lsbCByZXN1bHQgCj4gaW4gcXVpdGUgYSBw
ZXJmb3JtYW5jZSBkcm9wLgo+Cj4gSSBzdWdnZXN0IHRvIHJhdGhlciB0aGluayBhYm91dCBhZGRp
bmcgZHJtX2Rldl9lbnRlci9leGl0IGd1YXJkcy4KCgpTdXJlLCB0aGlzIG9uZSBpcyBqdXN0IGEg
Yml0IHVwc3RyZWFtIHRvIHRoZSBkaXNjb25uZWN0IGV2ZW50LiBFdmVudHVhbGx5IG5vbmUgCm9m
IHRoZW0gaXMgd2F0ZXJ0aWdodC4KCkFuZHJleQoKCj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4+PiBB
bm90aGVyIHBvaW50IHJlZ2FyZGluZyBzZXJpYWxpemluZyAtIHByb2JsZW3CoCBpcyB0aGF0IHNv
bWUgb2YgdGhvc2UgQk9zIGFyZQo+Pj4+IHZlcnkgbG9uZyBsaXZlZCwgdGFrZSBmb3IgZXhhbXBs
ZSB0aGUgSFcgY29tbWFuZAo+Pj4+IHJpbmcgYnVmZmVyIENocmlzdGlhbiBtZW50aW9uZWQgYmVm
b3JlIC0KPj4+PiAoYW1kZ3B1X3JpbmdfaW5pdC0+YW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwpLCBp
dCdzIGxpZmUgc3Bhbgo+Pj4+IGlzIGJhc2ljYWxseSBmb3IgdGhlIGVudGlyZSB0aW1lIHRoZSBk
ZXZpY2UgZXhpc3RzLCBpdCdzIGRlc3Ryb3llZCBvbmx5IGluCj4+Pj4gdGhlIFNXIGZpbmkgc3Rh
Z2UgKHdoZW4gbGFzdCBkcm1fZGV2Cj4+Pj4gcmVmZXJlbmNlIGlzIGRyb3BwZWQpIGFuZCBzbyBz
aG91bGQgSSBncmFiIGl0J3MgZG1hX3Jlc3ZfbG9jayBmcm9tCj4+Pj4gYW1kZ3B1X3BjaV9yZW1v
dmUgY29kZSBhbmQgd2FpdAo+Pj4+IGZvciBpdCB0byBiZSB1bm1hcHBlZCBiZWZvcmUgcHJvY2Vl
ZGluZyB3aXRoIHRoZSBQQ0kgcmVtb3ZlIGNvZGUgPyBUaGlzIGNhbgo+Pj4+IHRha2UgdW5ib3Vu
ZCB0aW1lIGFuZCB0aGF0IHdoeSBJIGRvbid0IHVuZGVyc3RhbmQKPj4+PiBob3cgc2VyaWFsaXpp
bmcgd2lsbCBoZWxwLgo+Pj4gVWggeW91IG5lZWQgdG8gdW50YW5nbGUgdGhhdC4gQWZ0ZXIgaHcg
Y2xlYW51cCBpcyBkb25lIG5vIG9uZSBpcyBhbGxvd2VkCj4+PiB0byB0b3VjaCB0aGF0IHJpbmdi
dWZmZXIgYm8gYW55bW9yZSBmcm9tIHRoZSBrZXJuZWwuCj4+Cj4+Cj4+IEkgd291bGQgYXNzdW1l
IHdlIGFyZSBub3QgYWxsb3dlZCB0byB0b3VjaCBpdCBvbmNlIHdlIGlkZW50aWZpZWQgdGhlIGRl
dmljZSBpcwo+PiBnb25lIGluIG9yZGVyIHRvIG1pbmltaXplIHRoZSBjaGFuY2Ugb2YgYWNjaWRl
bnRhbCB3cml0ZXMgdG8gc29tZSBvdGhlciAKPj4gZGV2aWNlIHdoaWNoIG1pZ2h0IG5vdwo+PiBv
Y2N1cHkgdGhvc2UgSU8gcmFuZ2VzID8KPj4KPj4KPj4+IMKgIFRoYXQncyB3aGF0Cj4+PiBkcm1f
ZGV2X2VudGVyL2V4aXQgZ3VhcmRzIGFyZSBmb3IuIExpa2UgeW91IHNheSB3ZSBjYW50IHdhaXQg
Zm9yIGFsbCBzdwo+Pj4gcmVmZXJlbmNlcyB0byBkaXNhcHBlYXIuCj4+Cj4+Cj4+IFllcywgZGlk
bid0IG1ha2Ugc2Vuc2UgdG8gbWUgd2h5IHdvdWxkIHdlIHVzZSB2bWFwX2xvY2FsIGZvciBpbnRl
cm5hbGx5Cj4+IGFsbG9jYXRlZCBidWZmZXJzLiBJIHRoaW5rIHdlIHNob3VsZCBhbHNvIGd1YXJk
IHJlZ2lzdGVycyByZWFkL3dyaXRlcyBmb3IgdGhlCj4+IHNhbWUgcmVhc29uIGFzIGFib3ZlLgo+
Pgo+Pgo+Pj4KPj4+IFRoZSB2bWFwX2xvY2FsIGlzIGZvciBtYXBwaW5ncyBkb25lIGJ5IG90aGVy
IGRyaXZlcnMsIHRocm91Z2ggdGhlIGRtYS1idWYKPj4+IGludGVyZmFjZSAod2hlcmUgIm90aGVy
IGRyaXZlcnMiIGNhbiBpbmNsdWRlIGZiZGV2L2ZiY29uLCBpZiB5b3UgdXNlIHRoZQo+Pj4gZ2Vu
ZXJpYyBoZWxwZXJzKS4KPj4+IC1EYW5pZWwKPj4KPj4KPj4gT2ssIHNvIEkgYXNzdW1lZCB0aGF0
IHdpdGggdm1hcF9sb2NhbCB5b3Ugd2VyZSB0cnlpbmcgdG8gc29sdmUgdGhlIHByb2JsZW0gb2Yg
Cj4+IHF1aWNrIHJlaW5zZXJ0aW9uCj4+IG9mIGFub3RoZXIgZGV2aWNlIGludG8gc2FtZSBNTUlP
IHJhbmdlIHRoYXQgbXkgZHJpdmVyIHN0aWxsIHBvaW50cyB0b28gYnV0IAo+PiBhY3R1YWxseSBh
cmUgeW91IHRyeWluZyB0byBzb2x2ZQo+PiB0aGUgaXNzdWUgb2YgZXhwb3J0ZWQgZG1hIGJ1ZmZl
cnMgb3V0bGl2aW5nIHRoZSBkZXZpY2UgPyBGb3IgdGhpcyB3ZSBoYXZlIAo+PiBkcm1fZGV2aWNl
IHJlZmNvdW50IGluIHRoZSBHRU0gbGF5ZXIKPj4gaSB0aGluay4KPj4KPj4gQW5kcmV5Cj4+Cj4+
Cj4+Pgo+Pj4+IEFuZHJleQo+Pj4+Cj4+Pj4KPj4+Pj4gSXQgZG9lc24ndAo+Pj4+PiBzb2x2ZSBh
bGwgeW91ciBwcm9ibGVtcywgYnV0IGl0J3MgYSB0b29sIHRvIGdldCB0aGVyZS4KPj4+Pj4gLURh
bmllbAo+Pj4+Pgo+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+PiAtIGhhbmRsZSBm
YmNvbiBzb21laG93LiBJIHRoaW5rIHNodXR0aW5nIGl0IGFsbCBkb3duIHNob3VsZCB3b3JrIG91
dC4KPj4+Pj4+PiAtIHdvcnN0IGNhc2Uga2VlcCB0aGUgc3lzdGVtIGJhY2tpbmcgc3RvcmFnZSBh
cm91bmQgZm9yIHNoYXJlZCBkbWEtYnVmCj4+Pj4+Pj4gdW50aWwgdGhlIG90aGVyIG5vbi1keW5h
bWljIGRyaXZlciByZWxlYXNlcyBpdC4gZm9yIHZyYW0gd2UgcmVxdWlyZQo+Pj4+Pj4+IGR5bmFt
aWMgaW1wb3J0ZXJzIChhbmQgbWF5YmUgaXQgd2Fzbid0IHN1Y2ggYSBicmlnaHQgaWRlYSB0byBh
bGxvdwo+Pj4+Pj4+IHBpbm5pbmcgb2YgaW1wb3J0ZXIgYnVmZmVycywgbWlnaHQgbmVlZCB0byBy
ZXZpc2l0IHRoYXQpLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hlZXJzLCBEYW5pZWwKPj4+Pj4+Pgo+Pj4+
Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBBbmRyZXkKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBJIGxvYWRlZCB0aGUgZHJpdmVyIHdpdGggdm1fdXBk
YXRlX21vZGU9Mwo+Pj4+Pj4+Pj4+Pj4gbWVhbmluZyBhbGwgVk0gdXBkYXRlcyBkb25lIHVzaW5n
IENQVSBhbmQgaGFzbid0IHNlZW4gYW55IE9PUHMgYWZ0ZXIKPj4+Pj4+Pj4+Pj4+IHJlbW92aW5n
IHRoZSBkZXZpY2UuIEkgZ3Vlc3MgaSBjYW4gdGVzdCBpdCBtb3JlIGJ5IGFsbG9jYXRpbmcgR1RU
IGFuZAo+Pj4+Pj4+Pj4+Pj4gVlJBTSBCT3MKPj4+Pj4+Pj4+Pj4+IGFuZCB0cnlpbmcgdG8gcmVh
ZC93cml0ZSB0byB0aGVtIGFmdGVyIGRldmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+IEFuZHJleQo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4g
UmVnYXJkcywKPj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+Pj4+Pj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4+
Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+Pj4+Pj4+PiBodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFt
cDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M5MjY1NGYwNTM2
Nzk0MTVkZTc0ODA4ZDhhMjgzOGIzZSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2Mzc0MzgwMzMxODE4NDM1MTIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlK
V0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2
TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9JTJCZVM3djVDckhSZmJsajJGRkNkNG5yREx4VXh6YW02
RXlITTZwb1BrR2M0JTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
