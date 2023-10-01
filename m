Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3FA7B46A9
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 12:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FE510E1EA;
	Sun,  1 Oct 2023 10:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5019210E1DB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 10:03:28 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly03b.srv.mailcontrol.com (MailControl) with ESMTP id 3919DLVU125362;
 Sun, 1 Oct 2023 10:13:21 +0100
Received: from rly03b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 3919DK6K125241
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:13:21 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly03b.srv.mailcontrol.com (MailControl) id 3919DJcJ125041;
 Sun, 1 Oct 2023 10:13:19 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2112.outbound.protection.outlook.com [104.47.11.112])
 by rly03b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 3919DIQS124890
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:13:19 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOFHpiVnj7PQH9hT0iwwXLyCRhEg5EH9/4c1ki3i5Ud5sBC4gwYvDrG4BW3CV7wf/u+yB1BX6JgP6m3vrVUL39qMfQWMmLHSCj6IC/nbyr09s3QMlLWtWG8Q7DI2pU4LJwPWCa9LW/09H5S8KKK7M55O5lSF0/Ayg1IH04HFsur18eqguNkR1hacb75qygvVJaDU8t3FK3ki1PU48QHfwEilH7wuRcSdIKpFGQaUbJqn+uWNzPlVZZJN+DXuMlrhU7Rg1bUWeommP8543yD58r6E+gQpw8047PvzBa76M26fAgVQrezoU16Tj4kGcdCWReC49Aczo877QIngHF9H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6podvsgkfeSbWQQBdkXQjWXZX39TVjyb2WOxs6m/+hE=;
 b=ArGNaG9Lzb+lvA6VvFgEmcxqj9YqbEvg6W7+uqRTaEXAmyuhe0Wy2eEPQwRFSRhDGzopDnNYrCYVkjA50++c0y2v24LFI3B2rk6d1bnTMCa0sdL7/+lhXH+xIB45HMrsNIuW+6zMBQxRSbgaLiUkuV/HrwVjYghD+wfb8nxwh8eC0/KKd04ox1imZ4K0/7p4lmUHAf7cIUE4hkgcTo3MSedd1QEMPuXC5eAaczle33dNPSTWLCjF/lLqFN5QsDiFT4bGDEIh0zp5Si0GgIHGh8MfjKMXHnoqXhqef9WqlD3HulGbR1kOfco8s1DrSDtzkzca6a/XqqCKr+tycqVMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6podvsgkfeSbWQQBdkXQjWXZX39TVjyb2WOxs6m/+hE=;
 b=HOv++nm1rTvGswy+g0R4r+o/l+FlHoRPcVYGuNH60quYBpRP/K894CxzCfwzBgfUxSRce5ny9nxT2ddvsnMgkrRNIbkeyZy5bW5ilNzYGH3ErObtAnuUoX4OFFc5yP8U23au3EACdF+EcQrUH95EW+tmvnsu9WnZ+SBbORmGxS9TBxOp/u3TfnUjjlmkLSFZJZonb/IViVRb50y6lawPEPHXTFVNXqXxlSlm041XLbkcNgARuHJJ6gkDrbe4Z42aUgz6IeRAulw4uUkbJtCulQY9YDhiwS1pa7Q0J6SiF/iXmw1qYTnJbb0Sv8tdvM32IcunzbRm0ZloCT/BHDl3tA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM9PR02MB6771.eurprd02.prod.outlook.com (2603:10a6:20b:2c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Sun, 1 Oct
 2023 09:13:18 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6813.027; Sun, 1 Oct 2023
 09:13:18 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] accel/habanalabs: minor cosmetics update to cpucp_if.h
Thread-Topic: [PATCH 1/9] accel/habanalabs: minor cosmetics update to
 cpucp_if.h
Thread-Index: AQHZ8FFnf1lkE3tjjkiPCE10/JJHlrA0rmSA
Date: Sun, 1 Oct 2023 09:13:18 +0000
Message-ID: <1723bb09-0637-161a-63b9-e63345c5c261@habana.ai>
References: <20230926081345.240927-1-ogabbay@kernel.org>
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM9PR02MB6771:EE_
x-ms-office365-filtering-correlation-id: bcc0ef1c-462e-453e-3c38-08dbc25ea69e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e6EApKUq5Ye/Oq9HkvQvgyCjceCJ7meuiP1/VWVnsmIABTLFIWho+RGLgWR+D0iLEBNNgjRj3vRjQ5bMDTjK3jvxXsZpJxazJY3ItilRHcvVzGStxaYhzIzcSZx5jQzS2PIhOqj01bRh2XhEOGYiETlE0nXEKWRhSodDKDQCoCDKnxYOXv48mAbe6Itk9/GjFsbPzFiRTW2chhWJ34EcDrfOARKXcWiQKHSFDDlGAann+IT/03QwP8aCQyue2vHeoelN+oNBOtIODF4Z4anvChYnvVsmn+Olsel7Y03ZqG0qI1EN50G1DUFso9GVzsDbBaGWQWo9D/P6NbyqsxKkCwNINAQuNOVuGC8qJ8zcH2LpvSfqBYvkR0YOtgMVSBUAeFlNFHTtiprEEN/uX31clE/7u7kgcmxLV3OS58J8yIPkR73vboTQ4CJ2KfuKAVJU5ewwzf96MhGPDAnpE44u/LxsF2BNSEyLe60qnkWMze/0RJca44lgqfuZ+we0bsKESDfvcAAjODTCJiNmeoUh+A7odx54PSE+RYPvwc7OrNWF4SiRlj+pTzVRQX6VhCV9pNg39m6RveXLnWWRHUEzXd2tXgW7QlL+riGyec9ihhcNhTcsgAS19dUiEKsFN/q7Mbe13iDBm8IzezyhJXKnI0v1EOB0OFgeH2W9oQViKGSHWEM/FBbw+WGeQZcdnTOq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39850400004)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(26005)(38100700002)(82960400001)(38070700005)(122000001)(31696002)(86362001)(36756003)(83380400001)(316002)(64756008)(8676002)(8936002)(5660300002)(41300700001)(66476007)(66446008)(66556008)(66946007)(91956017)(76116006)(110136005)(2906002)(15650500001)(31686004)(6506007)(53546011)(71200400001)(6512007)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZkYnVoeHozWEFkbTQ2RThtQUZIR3dkUGNXMlRJM2FLMDBrdThORGtwOHhJ?=
 =?utf-8?B?RGlmLzhQUkNIcGtFVlhMUlBWRmMvRWwyRU1BZ2FpTzd2MVhzTXZEYmliTE1s?=
 =?utf-8?B?VzZYTXIzeUpzZVc0SU5DeVhRTSttUEMzNUhRT1pvZGtnWUszUTF0QzVaRW96?=
 =?utf-8?B?d1NMNDZMVzdHNEZwM2pBY3lBcHB4dFlQMjcwWWZVOXdDc3lMVWxsVmZubzhM?=
 =?utf-8?B?Y0xmL1ZrS25jbUd5ZXc2eFlJTEVleUl1Zm54YkxQWkQxTTZOUkYzR2lpYTdT?=
 =?utf-8?B?Smo5SnhJRll3Z05sSWE5ckxMRVJ5YXFycFJrVnYzWUZNWHdvK1pFNUg4N2lN?=
 =?utf-8?B?U29uNUs3bzBtMnlIUVI2V2lCellLTFNqaFo5a2VIZGwxdEt1SkJjYXVnc1ll?=
 =?utf-8?B?NXJwejlOaDFaVlBHY2o1aEZkNmlRai9kckUvWkJ0R2czbUxDYmRNMVlDUXlE?=
 =?utf-8?B?Y0gxdjI1SDNHRU40aERkdjJZcUxBMmo5Zll2emszWmN3MDFoeXBDMUY5R2Y0?=
 =?utf-8?B?RU5JTDk2WlV2Q0JKeHduWU9WZXdqbmREYkhnRlJrRmplRHRmQUQ5RVBZOXA5?=
 =?utf-8?B?VVl6cEg5Rmxhd3ZJNkVzN1piRHZXbCs2M21UcEVMNDR4bkZuMzdXL0FkQWJv?=
 =?utf-8?B?ZW9jbWNSUHZOdktYQURZcm91L1ppYnMvOHppT2wvR2wvQWlGeml6UFdvMjZj?=
 =?utf-8?B?NnhLQTBHR21nVDh1bFdUQmVJdWlEN1MyeitRTmhjYkNhelV4Mk1zSVNKWGo0?=
 =?utf-8?B?TWFYZTFSVkljVE1oVElWakgyVEUvRVZoSkRndjVaVW9EUTAwbTdRU0Jhamoy?=
 =?utf-8?B?bHFiU1NoOW03djFiUlR5MGdBYnNvd2ZzL0YwSGZEWkMwaEE1ZWtQeTlTRzBz?=
 =?utf-8?B?cnlSeitSYTIxQU9VaU9JbXZhd2p6cXBodEtKQlpqbi94MUFtK2ZNdmdUNVpR?=
 =?utf-8?B?ajRUMHl6OWlWZGJnd0RjRG5oZUxQcDgwMUMzbC9oSWJOdEVKQ0x3Ykozdzlj?=
 =?utf-8?B?VFFKSlJyd3pSMGV3cUh5SDV1RVdtcXM5UlJtNk5PNDgwcGhEYTh1cnNadnE0?=
 =?utf-8?B?MldvWnZiei9vMGZja21Ra2MvU3IraHQwTjZTTEJ0K0hLWnBITlZDN1hFdmNN?=
 =?utf-8?B?TjJ6aWEyQU1lR1U5NDJaaHdFM1BJK1VzYTVMckxZeCtoaUxpTzFDR2tRMzZJ?=
 =?utf-8?B?bGRXa21CaUJFOWtDYW12OThnZVB3TUJ1Y1IzV0Q3RUNXVUxBTmZJNWRuMCt0?=
 =?utf-8?B?QmY4WW00bzMrVlVaNXY1cXVsSjV6a2UxZkl0bzNtRnVCSXIvRERVZDZVZWNw?=
 =?utf-8?B?bUYwSkxlMC9LSTlXSFFXcmFhY0N6aHRKck92VmlEUmNhcmtRcGVrcHY4eWN6?=
 =?utf-8?B?U3poQlZ2UjhETnhqUm9SelBOWnY3eUVWWFFIKzc0S1plaHd0YTQvQWJCWUJ0?=
 =?utf-8?B?V1hiRXgva0RTSyszamU1U0ovMWNEUk1Hc1F0M2hNVmhwZktPSlZjNnFLV1F0?=
 =?utf-8?B?WTBNdlc0NDhSNjdleDV3U0VyOUZlWFpxeWZ2UHJOK1hHdnUxblRkRENtcDFu?=
 =?utf-8?B?RERUUHQySzJpcEdZUmlOUXEyWjZQcTUzSGJGUnllK3N0VmUzc3JWdHV1cWFa?=
 =?utf-8?B?a0t0eUYydzk1NjF2LzVVSi9BcU1mWFhXZDRkTXZQQitrclBZV0R1TS9SRnVC?=
 =?utf-8?B?cXhBakVWd2EzWjBxN1VEbFg4WktwVFRRRldjM3I2dndLSEJvZHlXdGlwKzVG?=
 =?utf-8?B?TUVnVStXUGJyY0ZzU1hibytMRXVCcHZEOWs2TnlocVAyWWNwbHY1eXY0amVo?=
 =?utf-8?B?c2tqRHMraHExdU9nTFVHZFkzNkVxUFJsL2tERkwwOC93Rk5rdWRtaDNYNnkr?=
 =?utf-8?B?ajBvSHFGbHVBemVuT1FnaW1RVGlwbEprTXNWREQ1NUxGSElnVUQ2aWUwNy8y?=
 =?utf-8?B?VXZub3JUWlZpRXdwOTM4VWhsRm5GdUxqZEJUaG94YlphTmh1M2ZtY2Vpckxz?=
 =?utf-8?B?L0lSbVRUeTFwQTg5L3VCaHNsOVQ0QlVlKzM0VGFuQ3FxYnFJVENLUWpQY3No?=
 =?utf-8?B?OEJXbHdZKzFZeU9RUjgyanlrbm1JN3NuYWFRbmxMVUVXYzIwNnpFUGNmT050?=
 =?utf-8?Q?w7xA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <876B785F25131A41B34808BB8B5E3DB0@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bX7utVyFig+nvGC+eIx/2WWQ8O1GCs7UhhoTo647BpR5vMz3uEAyJlUdNREsJKWNJSH2dUg1xIcTNooEbBTkl/U7SjGys6lKC+y7x3x0l6uRNO/v/Y7/NhUw2WjqIrSMJkxttCzUVLl1pwxZfhm8xC388gyFMe3HrqbxPaOawZOaffGwd98lO/AGy0G3JWhZZKn+Oq5Mv1D/REFB1DrUVmG2viUYNZyIv/XJ6T+Nxx5OcGU+LTp6Ns2m+rA5qfODUR9Kc4cCabQ40vvumaeFKq8pmIpKiJ95PR6yzUMnAcDC74En4EIOiBRlpHYI0kTCobRaxPv/8Pk+HC+dB0CfkjzVI3MNygGEa1eSckoAHsyfY8FluEGn270U+6X9M9hlgtci6PrxrD21wvm/C/EWjL346Ng1mutptFj5+BhKTMTld/mGKy6GsDDu7IncAM1Y3Cte5XnbB+J3uitqwLJ/FurTJwKl8HAAUSnYrt4XaoOBuTtku7An+pDI1g50Cc0H9ErebDMuGaZh9uTWN12uJfIW+TPG5mi/FjdlhXEe2vEP7SsGwYYQQDBm0DLTNhZ3PDCOPqZpgUk64Dq3ZVNsknqKwBPl0NLbQAuGKAmpWnRu92LlFC8CD0s+2lP24ZGIHIqCN6iyjqbYUyCeCXNvusUH3brIeCUIYBxvkBl17I5OKPJkuZuX1sGLe97KzS8/gHmeyG9gEqlRuP/k60WzHW3txgYYs2FyDvxrPzsBmmr0lLdVLhcbgvkuHMjx4UzSqdNlW21NcMDj3ApzpwNV59t8rqnuBvZh7+3r2mOxdH5Qm6hsezgMTel90KJ4+Y2RAZ7wkmuI8SPSkYet4yybxHfu8WttZQOXGUJ8cCVrqTviV54JrNG+f2FMtySfiXpS
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc0ef1c-462e-453e-3c38-08dbc25ea69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:13:18.0566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfMwJmr6KkK9Ls8lDOW7mFg/j9dIdfH8aSrLwGyTLzc70WMXGUYkin+u0rmyWiXReIB7Q4afuedrAvLZ6END+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6771
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NjE1MTYwMDpGUEtleTEucHJpdjo4/3VG26++cY4OquNpqDvWuVC3ut0d9my/dX9rKKkJrq/hBOdtxWqcJA3DWYjH3zU0uQOPjzFgP+uiumeb2sMPsCUjCG+gi5IRfVmcmj3H1jrA9RZGy9QCN6t0lQcsyuE7WsOxz2bvfcD67cn0JDLqiPWGCMIOHA2gAaARStGxOZnZId0bk0n+7yfc6LMkH4uwNEadzmWx3MBZc+umnQ890vMNf0eyaKNt/ocV21GZDVzRhuQsvoLwZJbDfOJayIrE7drmmLvwQbQsO59I1d08szz72P6T4ehlS85lDA65RtmVnE8YnBOvRTAfQHeRj5cZHx46+UdbXFjF6aLAMN83
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.11.112
X-Mailcontrol-Refers-To: 3919DK6K125241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=6podvsgkfeSbWQQBdkXQjWXZX39TVjyb2WOxs6m/+hE=;
 b=1SUawQOUtrYhBa02zXg4w7aajiPw7nfmRdV4APs619G8Oc/LPgrACzOWSk8dfGgTFrF1NMmLhc1wVg7Zk7zXbULJbmV3pAbGjTngY4ztGIpH6YiOGDk1sg+9algml7r7FlPu2gQ3fT2gKGMoqaFbmnQm5yiyDmGK59HvR2608lFUhQbqkPQU3Q6j4eSOOZaAsklIvRplgsebtY6RDMw//DH7NF44T7zmE5y8eXpM8uhOAB1vA2C6hshdCFn21Z1kSlRNby6NVgJBL3fCbq5mg9qZokjOFbEqC6byL/I5bL5pzAS2Fhl6dA918MJPVxS3Kp/LEKvQEnokSFjzPLFGJA==
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

T24gMjYvMDkvMjAyMyAxMToxMywgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IC0gVXBkYXRlIGNvcHly
aWdodCB5ZWFycw0KPiAtIEFsaWduIGNvbW1lbnRzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBPZGVk
IEdhYmJheSA8b2dhYmJheUBrZXJuZWwub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L2hh
YmFuYWxhYnMvY3B1Y3BfaWYuaCB8IDE3ICsrKysrKystLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9oYWJhbmFsYWJzL2NwdWNwX2lmLmggYi9pbmNsdWRlL2xpbnV4L2hh
YmFuYWxhYnMvY3B1Y3BfaWYuaA0KPiBpbmRleCA4NGQ3NGM0ZWU0ZDMuLjg2ZWE3YzYzYTBkMiAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9oYWJhbmFsYWJzL2NwdWNwX2lmLmgNCj4gKysr
IGIvaW5jbHVkZS9saW51eC9oYWJhbmFsYWJzL2NwdWNwX2lmLmgNCj4gQEAgLTEsNiArMSw2IEBA
DQo+ICAgLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gICAgKg0KPiAtICog
Q29weXJpZ2h0IDIwMjAtMjAyMiBIYWJhbmFMYWJzLCBMdGQuDQo+ICsgKiBDb3B5cmlnaHQgMjAy
MC0yMDIzIEhhYmFuYUxhYnMsIEx0ZC4NCj4gICAgKiBBbGwgUmlnaHRzIFJlc2VydmVkLg0KPiAg
ICAqDQo+ICAgICovDQo+IEBAIC02NjgsMTggKzY2OCwxNSBAQCBlbnVtIHBxX2luaXRfc3RhdHVz
IHsNCj4gICAgKiAgICAgICBPYnNvbGV0ZS4NCj4gICAgKg0KPiAgICAqIENQVUNQX1BBQ0tFVF9H
RU5FUklDX1BBU1NUSFJPVUdIIC0NCj4gLSAqICAgICAgR2VuZXJpYyBvcGNvZGUgZm9yIGFsbCBm
aXJtd2FyZSBpbmZvIHRoYXQgaXMgb25seSBwYXNzZWQgdG8gaG9zdA0KPiAtICogICAgICB0aHJv
dWdoIHRoZSBMS0QsIHdpdGhvdXQgZ2V0dGluZyBwYXJzZWQgdGhlcmUuDQo+ICsgKiAgICAgICBH
ZW5lcmljIG9wY29kZSBmb3IgYWxsIGZpcm13YXJlIGluZm8gdGhhdCBpcyBvbmx5IHBhc3NlZCB0
byBob3N0DQo+ICsgKiAgICAgICB0aHJvdWdoIHRoZSBMS0QsIHdpdGhvdXQgZ2V0dGluZyBwYXJz
ZWQgdGhlcmUuDQo+ICAgICoNCj4gICAgKiBDUFVDUF9QQUNLRVRfQUNUSVZFX1NUQVRVU19TRVQg
LQ0KPiAgICAqICAgICAgIExLRCBzZW5kcyBGVyBpbmRpY2F0aW9uIHdoZXRoZXIgZGV2aWNlIGlz
IGZyZWUgb3IgaW4gdXNlLCB0aGlzIGluZGljYXRpb24gaXMgcmVwb3J0ZWQNCj4gICAgKiAgICAg
ICBhbHNvIHRvIHRoZSBCTUMuDQo+ICAgICoNCj4gLSAqIENQVUNQX1BBQ0tFVF9SRUdJU1RFUl9J
TlRFUlJVUFRTIC0NCj4gLSAqICAgICAgIFBhY2tldCB0byByZWdpc3RlciBpbnRlcnJ1cHRzIGlu
ZGljYXRpbmcgTEtEIGlzIHJlYWR5IHRvIHJlY2VpdmUgZXZlbnRzIGZyb20gRlcuDQo+IC0gKg0K
PiAgICAqIENQVUNQX1BBQ0tFVF9TT0ZUX1JFU0VUIC0NCj4gLSAqICAgICAgUGFja2V0IHRvIHBl
cmZvcm0gc29mdC1yZXNldC4NCj4gKyAqICAgICAgIFBhY2tldCB0byBwZXJmb3JtIHNvZnQtcmVz
ZXQuDQo+ICAgICoNCj4gICAgKiBDUFVDUF9QQUNLRVRfSU5UU19SRUdJU1RFUiAtDQo+ICAgICog
ICAgICAgUGFja2V0IHRvIGluZm9ybSBGVyB0aGF0IHF1ZXVlcyBoYXZlIGJlZW4gZXN0YWJsaXNo
ZWQgYW5kIExLRCBpcyByZWFkeSB0byByZWNlaXZlDQo+IEBAIC03NTAsOSArNzQ3LDkgQEAgZW51
bSBjcHVjcF9wYWNrZXRfaWQgew0KPiAgIAlDUFVDUF9QQUNLRVRfUkVTRVJWRUQxMSwJCS8qIG5v
dCB1c2VkICovDQo+ICAgCUNQVUNQX1BBQ0tFVF9SRVNFUlZFRDEyLAkJLyogaW50ZXJuYWwgKi8N
Cj4gICAJQ1BVQ1BfUEFDS0VUX1JFU0VSVkVEMTMsICAgICAgICAgICAgICAgIC8qIGludGVybmFs
ICovDQo+IC0JQ1BVQ1BfUEFDS0VUX1NPRlRfUkVTRVQsICAgICAgICAgICAgICAgIC8qIGludGVy
bmFsICovDQo+IC0JQ1BVQ1BfUEFDS0VUX0lOVFNfUkVHSVNURVIsICAgICAgICAgICAgIC8qIGlu
dGVybmFsICovDQo+IC0JQ1BVQ1BfUEFDS0VUX0lEX01BWCAgICAgICAgICAgICAgICAgICAgIC8q
IG11c3QgYmUgbGFzdCAqLw0KPiArCUNQVUNQX1BBQ0tFVF9TT0ZUX1JFU0VULAkJLyogaW50ZXJu
YWwgKi8NCj4gKwlDUFVDUF9QQUNLRVRfSU5UU19SRUdJU1RFUiwJCS8qIGludGVybmFsICovDQo+
ICsJQ1BVQ1BfUEFDS0VUX0lEX01BWAkJCS8qIG11c3QgYmUgbGFzdCAqLw0KPiAgIH07DQo+ICAg
DQo+ICAgI2RlZmluZSBDUFVDUF9QQUNLRVRfRkVOQ0VfVkFMCTB4RkU4Q0U3QTUNCg0KQWNrIGZv
ciB0aGUgd2hvbGUgc2VyaWVzLg0KDQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25A
aGFiYW5hLmFpPg0K
