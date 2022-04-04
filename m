Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC14F19B0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 20:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B8D10E336;
	Mon,  4 Apr 2022 18:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.142.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD2610E166;
 Mon,  4 Apr 2022 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649096460; x=1649701260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2rSf07q1+Y7StBoZO97LX+BorFPKkmB/osGTe5z4Y4U=;
 b=tRxfBe16+fKrnBAPsOhW6esp/AasuaFrvKGFiEN1czemtb96eD9l+2zt
 SgUachMW9koDSXeJ2c4cp0Mwu7jgGZug5JVp02uuNnWnvZul+NyzYJHk1
 l/k0w2KSvzEzOFdv1ZU7ueG6/xOQBR2DuIyOVugqMeZyYGEI7vNi/i8P1 8=;
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 18:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joX2BVdDNM1dxKETA9z/7eENnBRnZnxYw6heyXG7V5EAg9V3UF9aMfhlReNoiECRLDcDOWPnFCemIKwK6+T12Gm0TCHmHp10AudivVsPPFQFigyuoAp68qk+kk7Pajy0Vi7ycb7Minj6TG+pCqGHoa2/8KewPNGpuHaSDVFEeZ41sXk4vHOSoVJcB42TBqn3Qs854an7qqJZ0g3FD9V9h8oKPPzCkU1VzfJAmMF21iDm/t1MqR7hNwhT7anlZQ8Q9GogMZPIqlevwlySk+ciCZXRkZKneoXMfp8YNiL8ywVQSOM0s6rUKG897OvDysqjR5c1B1W6snvIQK6Wb0aQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rSf07q1+Y7StBoZO97LX+BorFPKkmB/osGTe5z4Y4U=;
 b=M3f3qN8jAab0NRM1PkKMQ/1snD/dOhTaozuI+gRWRv+L3c312ZUKJOw9VpPF9MX5dfc8WuS6z8d7/tlAu+uW3MSgGyt91Cg5p31wLJ22YpdFIBc7JqQ7HsAeTG45vLG5/CE+rQHtMCM9DEJf/ZHO68KXZ5AFHIXGpMgT8OBa3g09OBXEaxQPK7nLYygSgLjCBgPaDP/eoicKlODdMi4B0B6KpZ8LtHtmIlfCyfHsibPzIdIzIXiwMiQrf3pUXn+Y26H405oeHra6AJWtjcqNYDz401VHcHFa2ZCRX/oqZ1X31BybE+MVSdtqWNO/GjcnqqJztalkXnB9Lj1iKgX6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MW4PR02MB7186.namprd02.prod.outlook.com (2603:10b6:303:73::6)
 by SN6PR02MB5663.namprd02.prod.outlook.com (2603:10b6:805:ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 18:20:55 +0000
Received: from MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492]) by MW4PR02MB7186.namprd02.prod.outlook.com
 ([fe80::9485:c59c:6877:f492%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 18:20:55 +0000
From: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sankeerth Billakanti (QUIC)"
 <quic_sbillaka@quicinc.com>
Subject: RE: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from
 dp
Thread-Topic: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently
 from dp
Thread-Index: AQHYRE/UsJWR5XLNukW2wMYYKa9U06zYfJ8AgACEi0CAASMMgIAF9JqA
Date: Mon, 4 Apr 2022 18:20:55 +0000
Message-ID: <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
In-Reply-To: <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d5e2d26-17f6-4a4a-68ce-08da1667dbea
x-ms-traffictypediagnostic: SN6PR02MB5663:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB566394374A164FF24054F3169DE59@SN6PR02MB5663.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ORABxUnvWlAnmXP+oZ+p7Ko3vK5SUNtyrRvwPQ1aX3r7YkBEuNrmh7378TO4/bWy0PACHyKRrXau9+ZGMDJ8Yq1ebsI9ovWyTIiNAbhS1WMgVhCK5s8Nu0+1/D5m5+16cGZsiWuODcuoFMzZiLZt3JapPS6X0GUFeDLnx3Ciqroe7HQHS2oLCz22NcGj94e0iBcccy/2ZoqoYz/CfxeX6gecxE7xmh+OOkl9PQnRIHs+qWjKW7/Ud5NqOLoFGZ+9sHcrGz0VasBYVTupIcopjkWUgSCy+Rdl8/BmshsWgAAbgaqAB6vdjb++2vkOVVv0HWbaaUuuISWbYdOWVWZO5HWZCJpCunuCvCAHf4++mBzxnXEV2SbJ31b545YfzyOY5Lr9XCsCbemeOnUD2/puZzmOPfKAAi9wCzPOD0WKNjQcsxUV7Am0KqD1WMtjWxcWu1nHkiKNKtu/j78726ZiNE6bkGNDO392DX1mu+eDAD6eBa1Jo8zRK+MBziHct4En/jb1NT8M0q7lv5MZq4QFQ1TwajwCXbWz77JjGfTv5w/VRhL9iun3jDou0BElVJaUBkqXmRXa98fZ6xg8lUP2x973w2gN8KrYhwW4VQEG7HjjIdGUZzKm3dobjRm/AkxACP6zF2Va2SZMKrus554IfAoiwgaJ7DNi8uQ9rH/SmTWScpwUv/qOQgeWj/hlLbKVK0luGo7urIgT6SajBqFbpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR02MB7186.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(7416002)(110136005)(5660300002)(107886003)(508600001)(122000001)(966005)(6506007)(7696005)(53546011)(2906002)(54906003)(38070700005)(9686003)(316002)(33656002)(76116006)(66476007)(64756008)(8676002)(66556008)(66446008)(66946007)(86362001)(4326008)(186003)(71200400001)(83380400001)(26005)(52536014)(55016003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHVZaDhpRVoralFkVURkb2wwV1hLOEllcys4SUp4cFlWNUlVdlNWTVBLbGZo?=
 =?utf-8?B?VmFBVklrK3BQbEF2L0JjTW9KZEVGZnBXQXNoaFFIbHMwb3RVOVpyTWZZUHhh?=
 =?utf-8?B?R213OTlzdmxuWElld2FOakdQOTdYSElzWHBaa1NiMmJ5d3N0cjJzMDZYSHJM?=
 =?utf-8?B?TWNXejBmT281UVpsdVRsU2ZxQnRWQTM1ZmxPemdrbXhyV2dIMGlCSmwrTnlV?=
 =?utf-8?B?ZXVwaXJsVmN5V3BQbk8wQUU3N053RnpQWk44M0ZDY3RpcUVLbWtOYmI3NDJN?=
 =?utf-8?B?VTBtZ25SQ01GTDdkU2dJZUNGL0wzbEJVOVNWWkZFRFpna3pRSE9ueWZEZnRN?=
 =?utf-8?B?UzJYZDZQSE14TUF5RGQ4Wm9wZmVuc1VIbDQ4YndINGU1cERQM0FCS2J2MnVJ?=
 =?utf-8?B?eHlCNklDVFdRekpnbnlLWGxDZUpUZFV5QU5Hb2sxZTR4VG5EOGVHZUFtaDR5?=
 =?utf-8?B?QllaYnNJaDlJam1sQzBnRFNmZWdpTFFaZHVVNE9NVHhCZ200Z0J6MDB5bHhu?=
 =?utf-8?B?VEI4UDIvRnFscFhTSFFla2pvZ3lidTdzdXB5ZXRpc0lheVVieUZseitpcWNi?=
 =?utf-8?B?V1hIVG56dDRaM2poZ05ucEo0TlNZSVFUVUErY1FKaVFYSzl3dGxxTkN2K0Iz?=
 =?utf-8?B?Ny8yb2hFUUVkVWVvc1BONnBCUU9nTEliMzNTTVo4ZGxwYzQ5b2o1NTRHVHRS?=
 =?utf-8?B?Uk82c3NZUzJXYkJtTjg3dFRHNXpxVm5VTUViaENSZWtLbW0wQk1JbHBYeXAz?=
 =?utf-8?B?aUZodXlTZUt6UkRmRUZ5RnowelI4MDByVTRNdk5NWHY4MGtKeDZmaWhFY1Bz?=
 =?utf-8?B?d1FJRDFMalBMSi9QY2NGdjdtcXlVandBYkMzZWVuMStEQW9OWC9leXNCYXlS?=
 =?utf-8?B?dDlBN1dlVGZEUjdmUGtmZVdQemJ3OWxobGF5R0JuNDRpQTJlV3hsYUxJOTdQ?=
 =?utf-8?B?K0FOeWx6ZktteWkweHo3eGwxVTRkenNjYmpWN0ZQM2tWOExiSzBCNnVYWnRV?=
 =?utf-8?B?Y0Y1TFMzb0ZpMFFqNFRVcnZNLzdUV0xQUjZRZ3lWMThsYnN1Rnc0c2tGZ25t?=
 =?utf-8?B?K0duTEQ3VEMybGRZRVBiUElyakxtZFdUUERUNEFSd1hmRG4rbUVodWdhYTRq?=
 =?utf-8?B?VkcyamlZOHprL0xFMllSdm1JcEpVeW8zazh1bGpLK3ZuemRENDI1ODI4MHZl?=
 =?utf-8?B?WHc1TzkvWDNaanJsTjl5RnJ4TzF4ZzlsQTlrc3ZPS2prTmxOaDFHRHRHMit3?=
 =?utf-8?B?MGV3OFl4cFhPcUYzZDBKdXBpb3U3c3ZGc3Q2SmdOZ3BjL1NxaFV2WTZtY09G?=
 =?utf-8?B?WUZmVHYxR1RzQVpWTk1TZXVCM1JXaHpnWUF1L1MvUlh5MW1MdVAzdi9wQnVC?=
 =?utf-8?B?N00xUVBSV1FHOUYxUmp6bFUydytLcG1oajBnd2h3ekN4YVZ3WTdIMC9jUzVL?=
 =?utf-8?B?QVJKVGw4THJNNTF6MVRkUGkzc0tobzNTNmJKYWVTZGN4bUVYOVpYU3QxQlUw?=
 =?utf-8?B?MUZJeEpqOGUyU1B3bUM1VUx2YUI0L2pzckcrNitSTE9IRVdkcTNiRWNyTTRx?=
 =?utf-8?B?QlE1OUN5VXpsQ1RxL2tzeW5oam8vWHhuQUw5R0Y0MVh5YnRHaE9lcXBHbmcy?=
 =?utf-8?B?dGVwSFdVZnhUMTVkeXpySlg3R2JvNG1yR0YyT2pqUVN4U3g5cW5DNkE3K20v?=
 =?utf-8?B?Q01PS1lROWVaMVZTeE1aM01KbWloOHJOMjEyY0dBVXlhZkFtbkVGMzNXOUZL?=
 =?utf-8?B?UG81LzJDUVhVejMxT3hRcEh4WnFTb0NscENIRWlKeVJEM1YxR29xYU5nTGRY?=
 =?utf-8?B?aVorblJ5dXFONUp3aXZ4bTg2SzBLMUFud1V5RjlTM0FscU52TVBNT0NkTlVP?=
 =?utf-8?B?d3YvSHFvdGtiWWFzV3I3a0REQ2dwZkhUb1ZSdlhMZWZiYWtOUHNBQTFGdlp4?=
 =?utf-8?B?eXhNL0orVHE3MytmaVZXTTNhMXora1J2MndaYnB5YUhBZDRWckxVczQzbFI5?=
 =?utf-8?B?YVdMVzNRM2VyQXJSbzFIK2lSL2EzNFp4d3hMbnYzaVdObDlCODJMMmthWW4y?=
 =?utf-8?B?OUNxNUlRMk5ab1ZMWmFqaXoxR2lBelR5WUNvMjhEOGpFN3NpdHFXdmRROHE2?=
 =?utf-8?B?UElxWEM5UEx2dU9ETFhPL1gwcXE3RHNqdDlSNTBXcmZVK3lGR1UxcHAwVnRI?=
 =?utf-8?B?aTZHZjJkTmFQVzA1WDFzM0t1WEZrUXljd2VYak9IYU83Q2dFRnNWcjB2NUg5?=
 =?utf-8?B?YXMyVjNSVU5TQktMUm5FbHJNTDVPNzF5SWhndFZNcUFGZkxsMmxvSGNuMFBV?=
 =?utf-8?B?SjdWK0lGQjJlaGdnd1JHTWVzQXlreis1R0d1RVRrM1ovNmpWbjhndz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR02MB7186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e2d26-17f6-4a4a-68ce-08da1667dbea
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 18:20:55.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2CeeBOw4KZDhPZfT8sLR3JaFP+cEwl4rtLL3AASa/LfdOmmtBR/RCXma5obiejuvkIsX1IcnFVMAWCTGVKtlu2ws0zaqmHuzzy/Fbvjt0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5663
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Aravind
 Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZywNCg0KPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCAxMTowMiBQTSBTYW5rZWVydGgg
QmlsbGFrYW50aSAoUVVJQykNCj4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gSGkgRG1pdHJ5LA0KPiA+DQo+ID4gPiBPbiBXZWQsIDMwIE1hciAyMDIyIGF0IDE5
OjA0LCBTYW5rZWVydGggQmlsbGFrYW50aQ0KPiA+ID4gPHF1aWNfc2JpbGxha2FAcXVpY2luYy5j
b20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgcGFuZWwtZWRwIGRyaXZlciBtb2RlcyBu
ZWVkcyB0byBiZSB2YWxpZGF0ZWQgZGlmZmVyZW50bHkgZnJvbQ0KPiA+ID4gPiBEUCBiZWNhdXNl
IHRoZSBsaW5rIGNhcGFiaWxpdGllcyBhcmUgbm90IGF2YWlsYWJsZSBmb3IgRURQIGJ5IHRoYXQg
dGltZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2Fua2VlcnRoIEJpbGxha2Fu
dGkgPHF1aWNfc2JpbGxha2FAcXVpY2luYy5jb20+DQo+ID4gPg0KPiA+ID4gVGhpcyBzaG91bGQg
bm90IGJlIG5lY2Vzc2FyeSBhZnRlcg0KPiA+ID4NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzQ3OTI2MS8/c2VyaWVzPTEwMTY4MiZyZXY9MS4NCj4gPiA+IENvdWxk
IHlvdSBwbGVhc2UgY2hlY2s/DQo+ID4gPg0KPiA+DQo+ID4gVGhlIGNoZWNrIGZvciBEUF9NQVhf
UElYRUxfQ0xLX0tIWiBpcyBub3QgbmVjZXNzYXJ5IGFueW1vcmUgYnV0IHdlDQo+ID4gbmVlZCB0
byByZXR1cm4gZWFybHkgZm9yIGVEUCBiZWNhdXNlIHVubGlrZSBEUCwgZURQIGNvbnRleHQgd2ls
bCBub3QNCj4gPiBoYXZlIHRoZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbnVtYmVyIG9mIGxhbmVz
IGFuZCBsaW5rIGNsb2NrLg0KPiA+DQo+ID4gU28sIEkgd2lsbCBtb2RpZnkgdGhlIHBhdGNoIHRv
IHJldHVybiBhZnRlciB0aGUgRFBfTUFYX1BJWEVMX0NMS19LSFoNCj4gY2hlY2sgaWYgaXNfZURQ
IGlzIHNldC4NCj4gDQo+IEkgaGF2ZW4ndCB3YWxrZWQgdGhyb3VnaCBhbGwgdGhlIHJlbGV2YW50
IGNvZGUgYnV0IHNvbWV0aGluZyB5b3Ugc2FpZCBhYm92ZQ0KPiBzb3VuZHMgc3RyYW5nZS4gWW91
IHNheSB0aGF0IGZvciBlRFAgd2UgZG9uJ3QgaGF2ZSBpbmZvIGFib3V0IHRoZSBudW1iZXINCj4g
b2YgbGFuZXM/IFdlIF9zaG91bGRfLg0KPiANCj4gSXQncyBjZXJ0YWlubHkgcG9zc2libGUgdG8g
aGF2ZSBhIHBhbmVsIHRoYXQgc3VwcG9ydHMgX2VpdGhlcl8gMSBvciAyIGxhbmVzIGJ1dA0KPiB0
aGVuIG9ubHkgcGh5c2ljYWxseSBjb25uZWN0IDEgbGFuZSB0byBpdC4gLi4ub3IgeW91IGNvdWxk
IGhhdmUgYSBwYW5lbCB0aGF0DQo+IHN1cHBvcnRzIDIgb3IgNCBsYW5lcyBhbmQgeW91IG9ubHkg
Y29ubmVjdCAxIGxhbmUuDQo+IFNlZSwgZm9yIGluc3RhbmNlLCB0aV9zbl9icmlkZ2VfcGFyc2Vf
bGFuZXMuIFRoZXJlIHdlIGFzc3VtZSA0IGxhbmVzIGJ1dCBpZg0KPiBhICJkYXRhLWxhbmVzIiBw
cm9wZXJ0eSBpcyBwcmVzZW50IHRoZW4gd2UgY2FuIHVzZSB0aGF0IHRvIGtub3cgdGhhdCBmZXdl
cg0KPiBsYW5lcyBhcmUgcGh5c2ljYWxseSBjb25uZWN0ZWQuDQo+IA0KPiBJdCdzIGFsc28gcG9z
c2libGUgdG8gY29ubmVjdCBtb3JlIGxhbmVzIHRvIGEgcGFuZWwgdGhhbiBpdCBzdXBwb3J0cy4N
Cj4gWW91IGNvdWxkIGNvbm5lY3QgMiBsYW5lcyB0byBpdCBidXQgdGhlbiBpdCBvbmx5IHN1cHBv
cnRzIDEuIFRoaXMgY2FzZSBuZWVkcyB0bw0KPiBiZSBoYW5kbGVkIGFzIHdlbGwuLi4NCj4NCg0K
SSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBjaGVja3Mgd2UgZG8gZm9yIERQIGluIGRwX2JyaWRnZV9t
b2RlX3ZhbGlkLiBXZSBjaGVjayBpZiB0aGUNCkxpbmsgYmFuZHdpZHRoIGNhbiBzdXBwb3J0IHRo
ZSBwaXhlbCBiYW5kd2lkdGguIEZvciBhbiBleHRlcm5hbCBEUCBjb25uZWN0aW9uLCB0aGUNCklu
aXRpYWwgRFBDRC9FRElEIHJlYWQgYWZ0ZXIgY2FibGUgY29ubmVjdGlvbiB3aWxsIHJldHVybiB0
aGUgc2luayBjYXBhYmlsaXRpZXMgbGlrZSBsaW5rDQpyYXRlLCBsYW5lIGNvdW50IGFuZCBicHAg
aW5mb3JtYXRpb24gdGhhdCBhcmUgdXNlZCB0byB3ZSBmaWx0ZXIgb3V0IHRoZSB1bnN1cHBvcnRl
ZA0KbW9kZXMgZnJvbSB0aGUgbGlzdCBvZiBtb2RlcyBmcm9tIEVESUQuDQoNCkZvciBlRFAgY2Fz
ZSwgdGhlIGRwIGRyaXZlciBwZXJmb3JtcyB0aGUgZmlyc3QgZHBjZCByZWFkIGR1cmluZyBicmlk
Z2VfZW5hYmxlLiBUaGUNCmRwX2JyaWRnZV9tb2RlX3ZhbGlkIGZ1bmN0aW9uIGlzIGV4ZWN1dGVk
IGJlZm9yZSBicmlkZ2VfZW5hYmxlIGFuZCBoZW5jZSBkb2VzDQpub3QgaGF2ZSB0aGUgZnVsbCBs
aW5rIG9yIHRoZSBzaW5rIGNhcGFiaWxpdGllcyBpbmZvcm1hdGlvbiBsaWtlIGV4dGVybmFsIERQ
IGNvbm5lY3Rpb24sDQpieSB0aGVuLg0KDQpTbywgd2UgbmVlZCB0byBwcm9jZWVkIHdpdGggdGhl
IHJlcG9ydGVkIG1vZGUgZm9yIGVEUC4NCg0KPiANCj4gLURvdWcNCg==
