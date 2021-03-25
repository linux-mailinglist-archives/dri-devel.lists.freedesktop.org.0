Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597F349241
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 13:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70996EB5B;
	Thu, 25 Mar 2021 12:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11hn2221.outbound.protection.outlook.com [52.100.173.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4836EB5B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 12:42:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYviRlvCd5i1yeU/8vwW6mQGp+U9yqOrnZg3NuJDWBBVjVS07HL2wKqeLtJFnb7uOYD/Ynzi9MvF651SJ9h7vE3TH0M+AApWyFpHEBAZVP7C6EhH40bPbIIssFm2NqpssYizHFfLHx9cL/gqkw5I23/0qIUIlAq8hwDmRsgUPuAH+pq5A1iPPeYAhbbLP/PRU/JUf3j6KPZv33zXs126OxnwiY3vMpultY6EG/DM0n3nDJq0TUSp75BYrCtKV7UAWdrPEdsPIChm3wFlMmxbgoDZg7Otg6ozESw/RBmmKU8sznL09cDczi5DzUZ8WPLCC2mv54wtg1k0m3mjx0Uejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03WsnaROWyQiNOtnNuK+LyaWG3JHivZ5BcANgGg9Qa0=;
 b=LaoGvPiR6OA/q48VgN8Vf31eGc7yIok2ZE8w2eyK7afsS8zLAuDEw05VUH3aL8f8J79JVJJpuILx/p+fchgQ+9ObCOcj7aq4Z4uSdBAbpxCQ6LIdNJVKMyEdMTPFEEEOS12Gf4msOAZta9fjCnR8axTYHwnI3AU542fcYsP0r+Yk3o3+8X+eJQVEHWKBBwo4d76tyzFG0Dxh5fxDti5stH7FdDfEsTmRFPY42Zo5FJeTdnBhy3V+kBIKABKoF/35unQyd2O3nIWrXte1jbvDcbsZ1E+uKWwpArFpVpMbIsQ386ztQLLzLGUi80MVZ2NO1QaVPf8+PT1evSoxov20kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03WsnaROWyQiNOtnNuK+LyaWG3JHivZ5BcANgGg9Qa0=;
 b=UESgxSIkytOeADoG/TR/ete4m4W/CQIBs0NjlqfPUf/mA03FgVmhGMPheBsPzGYFQSqO+1GCmuH/98j6VoiS7yuSlYcHQgpVwZpH0aVIrf8USQSCIghmPFLKEXJzw/D/zLq/4bLuTzt9+Egoe1H7vIxwHWL6HO7rr2QZYnhF7MNVS9H7UM5vWPYxS4TbdXHNEocnDIri73JZjvOdCO9Od07sx6TuKu0kw2fEdxBD8jjSordOZZOKCWybucHoreKHma+hmf44NCXiKtqiKr9ghpeWwelcK07yrvw+pF46klOqB1mpOh3ic+s4mxaney/+PTVIxPMTPc9gcqOKw+/LYw==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 12:42:08 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 12:42:08 +0000
Date: Thu, 25 Mar 2021 09:42:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325124206.GA599656@nvidia.com>
References: <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
Content-Disposition: inline
In-Reply-To: <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:610:cc::9) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0064.namprd03.prod.outlook.com (2603:10b6:610:cc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 12:42:08 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPPJO-002W22-RE; Thu, 25 Mar 2021 09:42:06 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d679322f-21f3-415d-5ea8-08d8ef8b6713
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-Microsoft-Antispam-PRVS: <DM5PR12MB114785AD2D729764EB08E05BC2629@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aStBa1hUays5WnhGQUkzanUyOHBhYnc1YjRtT2dxcHNVMHMxZVBBdVByVE1K?=
 =?utf-8?B?cEFoWVc2RmdQSkpHaWN5RDF3Mlc0QkNRZlN5bzBJZjBZNjZJS3AzRlc4NFQv?=
 =?utf-8?B?d0NvZmYzT0Q4WkVvK3RheTZtcWw1WUMwTHQ5ZUtJa3BBM1dQTld5M2ZnSGxj?=
 =?utf-8?B?VkdtL2FvWTg1YXJzWEcvSHdFREZxRXcvNys1Y1NMYlBpSXdkNGlwbjc4Vmtw?=
 =?utf-8?B?TFBhbXYzY2JUeTNHdGd3MEhROHFoSVRlaWVwYmJ4TWlMTTRSSDMyT2Q0VCtq?=
 =?utf-8?B?ajdQSlZRcDBvNnl5RnFmT2Z4MXVxM0xyQkIyUHVNQnpiTDZnQ1ZiaENpZ2g4?=
 =?utf-8?B?dU9oeHlGVXdFM1NhTEtZMHV4dHh4bnIxeWlMVm0yMnpjeTZTdC96NFdldXhG?=
 =?utf-8?B?OHBkblM2ckJpcTczTXZuaVB3NHRUMTZQaVM3VzJpcm5lWVVxeW4vZFM0VWFx?=
 =?utf-8?B?YXcxaTVqbVU4RHVuc0J3blFMa3pyL3FLWEVBby83clkreHR6WXgzYzgrVEd4?=
 =?utf-8?B?bDluQnIxaC9XT21GZk4zbEhQV0JIMWJkRmlyWFhiL012QVcxSWp1Q1lXdm5m?=
 =?utf-8?B?ZHNkSEVyWnZ6Si9aRjJicVZ2WU13MTR5QnhQeWVDa3JRVjE5bVMxZlF5QWJ3?=
 =?utf-8?B?TXZ6QVl1MFZMaXd2QzRlWFJUZzlPc0JqR2trRHlSblBBalB0WGlmb2dCZzg5?=
 =?utf-8?B?U2FQdDZiYUZ4UENkUzhGQUNwcDJ5QmVIMjZmVHl3aWx2YURFS3N1QXFmMThp?=
 =?utf-8?B?ZjgrcUEvbFEzZWV5em9HcE0wQzFOYVFhc3VQTVF5UnEzcis4anQrZ2xkeHVw?=
 =?utf-8?B?TnRDNjU3L2JGS1J0M09mSmp1K3l5enhadEQxSVc4SG9oVVBBWmhmNCt2R1FE?=
 =?utf-8?B?Qmo2NEpFS3hEUnJpU1pVRWpwYmJJVEtkMHBMenRHUEtDS2ZxamJzSUhHNit6?=
 =?utf-8?B?MUtwN0RPY04wNTF5QjN0V3RQY1R3a0czM0t4SVFEM1lOVmV2NzhROUQ0ejhI?=
 =?utf-8?B?QlZLbjVrTmlLem1qOFIycTZ6anJ6WnlJWjR6eWhYN2plbmNVK1owb1daLzh2?=
 =?utf-8?B?U1d5SUNzRDBQano2TlVEbjVGYkJnWXEvWUhyTEZ4MEhzT1VmVzhsVGgramsw?=
 =?utf-8?B?Zld5dTJWUC91ZHdkTlI1SWExTk93VHVIS3Z5eUtockZvVWJESk9hZTZQYzNi?=
 =?utf-8?B?ajB4cHkrWlFucDBSWElkN2RsVFg2eEFwZW1qUEEvQSt4aUY5RXc3Mlg4aDVV?=
 =?utf-8?B?QjdnT0dPbzRrWDhYaS91YmdpV3FtU3FrMFBJWmhsZTN4QXFKMFJmMjl1enJV?=
 =?utf-8?B?V09NOWwxSXdDREtDSXZ1ZUMrYWVkbUhCQVNjNTRkUDJ2MEhRZUZ4RTlSR1o1?=
 =?utf-8?B?RUdsa3JzRWRTbFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(26005)(6916009)(426003)(86362001)(66946007)(5660300002)(2616005)(478600001)(8936002)(66476007)(66556008)(2906002)(186003)(38100700001)(54906003)(4326008)(1076003)(9786002)(33656002)(8676002)(9746002)(316002)(36756003)(27376004)(14583001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGRLSUFndi91UDdSL3I0aDNVa28vMVZqQUpKUzdYVitNOERSVUNNeXVuejds?=
 =?utf-8?B?MEE1VmI0dzc3VjdDbmtCRWJ3Kzl2TWUxcS9IbzlBQ3dQRXg5aXgvSHZGU09Q?=
 =?utf-8?B?S2hvWllUbWF2TEZTRDRwVTMzckZzRnV3YkNFcHl4NThYdlF1d0FubmFtVk16?=
 =?utf-8?B?K3FwWTBzWEg0b0pkbnRUV1lycElYRFVrR2VqQU40Mkh0THpndkZZTGhsV01X?=
 =?utf-8?B?NGUyNFE5NUtReFNyVUgvRFJMWXRmM1RJQ2pGQXZ5SHJDT0hzSTdkcXVsS05H?=
 =?utf-8?B?WHV4ZnJKZUVOL3lvdC95R0hZbzhyeXd4bEJZbDdFNjRYUGs4aXhseG1TYlBQ?=
 =?utf-8?B?eHZRenY5WEhmbGZmb2FMT1hhdkhlQUtEWktnVmxqbllEcHFLMlFSc1ZKcVZ5?=
 =?utf-8?B?UDBqeHJRakhzZFI2NytCV1pad1N2akVXUzdnaEk3MVUrQ1lOUTF4RU1QYU5C?=
 =?utf-8?B?anRxYUx4L3NHa3RZci9WYmtuaUlIb1ZLbm8rVGF5bGt0cFdSZ3dkWVdSU0t5?=
 =?utf-8?B?QUVHNzBRVE9WUHUrLzJITGhrUUl4cmYvOG5IRDVKKytpMXJlVHUzTXJpckVt?=
 =?utf-8?B?WDNiR2FNL3g0TFNHamN6U1hFVll2K04xcjNzMmd2VDVZQU11UnNMVGdQc3ZX?=
 =?utf-8?B?NGNmaVducHpnMlNseXU4MjdqTHVHcHJRTFltQ09WTllyN2dGTFJDVThBcjF5?=
 =?utf-8?B?RUhwbnVxc29CVUtMcy9pMkVCbDB6YTNvY0x2MnlTUWdETnkxcTBoRmVDK1NE?=
 =?utf-8?B?N09USklnOXVOT0k3c1R2RGUxUWR4VHhzbGprUTdSM2Z4YXIvQzJ3cWVRUFY1?=
 =?utf-8?B?Vml1QU10d1I5VVZQR0pROGZ5QTcrYmZtR256VElXS0RVSk8vdW9MQ2QxYXU1?=
 =?utf-8?B?NHE5MDRkc1hBME44UExUQjRvT1FZU29FVEY1VCtmdTNieWw0R1FQUTlVL2Fu?=
 =?utf-8?B?bTdPeUwyYkhZeGlYckZNMmNzZ285K2llUGU4TGRyWWtYNlJSNEtlMmQ1bnI5?=
 =?utf-8?B?VGVyRkxERUFOdUJDdm5NMVpNcEhrNDZUdm9jd1U4TitmdVQvbjViQTdSV3Rx?=
 =?utf-8?B?dXF0bXRCUFdDa3NKbmtnTlBXTkRGak9LdlNScHo0QysxMnFzSnBtWEdEWFVT?=
 =?utf-8?B?SWUyNjd1THJQUVU5cnF4Ym5VZGNUZE1TbElDdGVJNmFWM0RGc01VVjNjWHZa?=
 =?utf-8?B?c1BYaU5sTXlKYWp2V3JncnAvc29oY0hpTUJTemhUWFZ4ZzJUMUF3TUtOMVl5?=
 =?utf-8?B?bVVORi9vSjJwR0dJamt2T2luTngwK0EyMEtqbnhOTVd3NURUUHgzUm5LNXZa?=
 =?utf-8?B?cGxZcFZtN1RTdDAxNzQxR3NaK1R1RnVPZFQ4MHJrQ1F3STBBdGlLQ2Z5cVl2?=
 =?utf-8?B?N1N5a3Bmajg3V3N3SmhOQ05wdEhmcElGYjAzcEtaam5jK2NtalJvMDJOMUJu?=
 =?utf-8?B?ZVJXVmZtV1pVZTkwNDdvWTdXWGhWRkQyUnZTRFlodU5xQjlhZ3RPRTV3cGtI?=
 =?utf-8?B?OWxaYnRXUE1WcWNBV05aMkVWK1BxZmp1OFAvVXpwb3NVc2F5bXNqY3ZZcEVS?=
 =?utf-8?B?K3M3VjJpVkVsVXFtT0JzaTRqOVhiaC9TbWlCTDRld2R2ckVKNnRBNkJybXNu?=
 =?utf-8?B?ZFhlV0d3VjNZbkhQRlBFSmdnZElKVTRoVEJiclNZWDc3bFRrOXpveU9DOURZ?=
 =?utf-8?B?Q2ZMdGE0N1duNUhrQWhlRldLUHNEcUpDV1gzQlQxc0FSeEt2aDlMTWNIeFNV?=
 =?utf-8?Q?ZE+WeRoMdfm0DKrlsBsMP4Wg+w85K7+2H1l/I4m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d679322f-21f3-415d-5ea8-08d8ef8b6713
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 12:42:08.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhysqdtGajmH68GMu1ec8ndeg6WxZDKljetdriwFZDIRnyD0pnuJrXZ80kDV6/8v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDE6MDk6MTRQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAyNS4wMy4yMSB1bSAxMzowMSBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDEyOjUzOjE1UE0gKzAxMDAsIFRob21hcyBIZWxs
c3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiAKPiA+ID4gTm9wZS4gVGhlIHBvaW50IGhlcmUgd2Fz
IHRoYXQgaW4gdGhpcyBjYXNlLCB0byBtYWtlIHN1cmUgbW1hcCB1c2VzIHRoZQo+ID4gPiBjb3Jy
ZWN0IFZBIHRvIGdpdmUgdXMgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGlnbmVtZW50LCB0aGUg
ZHJpdmVyIG1pZ2h0Cj4gPiA+IG5lZWQgdG8gYmUgYXdhcmUgb2YgYW5kIGRvIHRyaWNrZXJ5IHdp
dGggdGhlIGh1Z2UgcGFnZS10YWJsZS1lbnRyeSBzaXplcwo+ID4gPiBhbnl3YXksIGFsdGhvdWdo
IEkgdGhpbmsgaW4gbW9zdCBjYXNlcyBhIHN0YW5kYXJkIGhlbHBlciBmb3IgdGhpcyBjYW4gYmUK
PiA+ID4gc3VwcGxpZWQuCj4gPiBPZiBjb3Vyc2UgdGhlIGRyaXZlciBuZWVkcyBzb21lIHdheSB0
byBpbmZsdWVuY2UgdGhlIFZBIG1tYXAgdXNlcywKPiA+IGdlcm5hbGx5IGl0IHNob3VsZCBhbGln
biB0byB0aGUgbmF0dXJhbCBwYWdlIHNpemUgb2YgdGhlIGRldmljZQo+IAo+IFdlbGwgYSBtbWFw
KCkgbmVlZHMgdG8gYmUgYWxpZ25lZCB0byB0aGUgcGFnZSBzaXplIG9mIHRoZSBDUFUsIGJ1dCBu
b3QKPiBuZWNlc3NhcmlseSB0byB0aGUgb25lIG9mIHRoZSBkZXZpY2UuCj4gCj4gU28gSSdtIHBy
ZXR0eSBzdXJlIHRoZSBkZXZpY2UgZHJpdmVyIHNob3VsZCBub3QgYmUgaW52b2x2ZWQgaW4gYW55
IHdheSB0aGUKPiBjaG9vc2luZyBvZiB0aGUgVkEgZm9yIHRoZSBDUFUgbWFwcGluZy4KCk5vLCBp
ZiB0aGUgZGV2aWNlIHdhbnRzIHRvIHVzZSBodWdlIHBhZ2VzIGl0IG11c3QgaW5mbHVlbmNlIHRo
ZSBtbWFwClZBIG9yIGl0IGNhbid0IGZvcm0gaHVnZSBwZ2Flcy4KCkl0IGlzIHRoZSBzYW1lIHJl
YXNvbiB3aHkgbW1hcCByZXR1cm5zIDJNIHN0dWZmIHRoZXNlIGRheXMgdG8gbWFrZSBUSFAKcG9z
c2libGUKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
