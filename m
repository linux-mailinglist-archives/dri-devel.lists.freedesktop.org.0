Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032C616210
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B265110E102;
	Wed,  2 Nov 2022 11:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2105.outbound.protection.outlook.com [40.107.247.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7261610E102;
 Wed,  2 Nov 2022 11:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBOD6VHWRfO3UkwdsUgvBggYsuICMRPgajfsl5HgQZwW/NaC735TUqFyF9t9Y1Sp14d/yerW4BWMvGGCK+bPDk/j5bT4mhZHLUsXpXjAMXMMokgBpEj3bBpK4M2C3yaYXb+9XunQfk9QjQdnbwV/apxL4NOdxnBvvWyL8UR8h1e4/mkW3XLJbxDDaWRoKKXg5MZG7+05M/9BDm7hnov7N9ugF7654yeINmZGcQrqR0yPPscdnqzYtqYRsWR9I7BZOLoNzQ0gHM6jTIQZ8nhKwDu96ZedikCL8w4yhxOTy8bVJ8CnKQIzlOS5dadxqrfQEaoBBjib5hRBjOifkbwKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPlMNuvu4V2MXQvMbxjST7BoY7NL6NYYdHxzgmHtqI8=;
 b=NgWPay6bOTzxdpgB4O2QEvI89XwlRT/eVlK75+DYnhF0BCkMs+kyjXMPQxx94MUT0GgmTPhDRbj9cIBxAZIgkKg5wC5H+EbObMB2djSM5KkNBnKJmz1rSHY0WFWstuq2Ba4vlH4HY5ZBIdLt4K2shkNQC+cBjId9mIgZQdMW1nnBOdFWxDd/ltV7hquajAlhw0zu7FJ4qLKfTbREReBu+rcOLkwcSdJPEPoChqM/kzTqZBqDk257Z6rZd2SNgQd1mdC+85vOhTpfDymO00BB01UaJWDDIEBgDt145K8JMX8w0RTfC1X0GLYBssCABmt0TcPB0H8h/5Rdw0b7plp+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPlMNuvu4V2MXQvMbxjST7BoY7NL6NYYdHxzgmHtqI8=;
 b=A1Q5cOdzcGLlXPN6cbpunJcOc4wTF/4yE2aWfRa0IF16w4K/WGVVh4OjGT9zUpIniphKL10TwmJ6CN7Cw+s1wD1fdGn2BgI6d0u7SRA6QDpJKN1VDtH/bXNdefRPAgeTEWFEjeInjPSHldg5VN5UtItwYGNLfGGnLVbH9D78iKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by PR3PR10MB4062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 11:52:36 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::732f:4316:a0be:bdbc]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::732f:4316:a0be:bdbc%3]) with mapi id 15.20.5769.016; Wed, 2 Nov 2022
 11:52:36 +0000
Message-ID: <307b90cb-b80d-6ce3-14ae-4a0b2ee5e447@prevas.dk>
Date: Wed, 2 Nov 2022 12:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, keescook@chromium.org
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0023.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::24) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|PR3PR10MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: d98265cb-4295-412d-9afd-08dabcc8bc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZtqCAf3UC2Eccoy8hMC4iyObmYrpLDHlUfm9RwU/7f5WbiDltnjF7d71Ve++udH8fYv9PkdcP67kumbVMynZNgYlfrlk5jtQme6oYJnEUsY8MZ0GuMB/dWEoHcUQRu0cbBd6NjwaJJo1wP3ns2z2bWLNazOqJIbw6Xcjplx5yDCrTvbt7kWo8wVAQwV3+C6wrekAcUzkz8Mfir4+qhkuEa9JZ9ExcHB+v/tsufUw8sKM4qzEUBJ1SxIjk2IsMC2WgDgsvqXnIPjy3GEvvPH3p5btAEKtt3WQMUJdZyTUK53b/wkn3/iZ80MNpfH7SNq6ofRFqIoyySzpgj3GAdX9nzbgI+Q+TRI+7yLxFW9+casGZr8JdfGdcSHz/v0qf5WjoHfdcoZYktonJFQAYqkI8tBb3Go6/N0cjKR7LO+XQc83swuLBjyh1KiiSC4QGLxSvx/OCLbNyOTQSkjnVapjtFxjhCxmpEoYjX8ur+k+/cpNC3jDESru76v2UtBUAceltJkS17kP93FEbAZWxEufk/DfdBSEZnTiE3hEJS94OXIYSzz8mD3YJd5FOdNEgRTLa4Og7WxUlSnFWt2o+aRJmb2lRbEiU8FiUVVYawQVeOzrNwXc3wd4JTgfZRJC6sLnD6KLGX9Kn+wLTGB8gGun4vbdnvvEVdlK2Pt7zZ7OJJUScLWg417j2VK5sP677e06QOwu6s8avgvG5A2Pdo0JO2N77N8kEAqRD5Klx28340U7Y95UgfatLny3gxkVfIs4+eaoK+j0G/NReJcKhEHogKt5idQT59v3vnh9HqtjDMfUHqs81/WF93O5fM5yDKuw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(39850400004)(376002)(396003)(451199015)(66946007)(6512007)(6666004)(26005)(52116002)(7416002)(2906002)(6506007)(36756003)(44832011)(66556008)(4326008)(8676002)(66476007)(38100700002)(316002)(478600001)(8936002)(38350700002)(8976002)(6486002)(31696002)(86362001)(41300700001)(5660300002)(31686004)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjRndGp3M0pQUUl0bWhBZnh1THcySEdSa25ic09IODBoeWs4YlliRDdhVDI5?=
 =?utf-8?B?NEZGdk85THZNTzJDMlhNUWxEdFUyWXc1bHZIcWxncGNlMnY1SWpySmFYUDVK?=
 =?utf-8?B?ODI5Rlk1ajRLWlNrVXAraFFXWFVNYUF5Z05VRVphMnZMbnZZeTNENUNpaE5Y?=
 =?utf-8?B?N1JxSTVHeFFDcnFBYTEwRk1lbEp6QVk2NHEvUkFrMjh4K0cwa0loN2gzdzVK?=
 =?utf-8?B?eHN3Wkp2SDluc3Y3c0d1OWFoOTJ5anZCeTJ1TmFwZG5QL0o0SEJtWTV3ZklZ?=
 =?utf-8?B?OGtQbnlYbGorUEsyTUt2QW8rZk0vZFVhUXhXT09DSVdVMkhJRzNrTWVsc1Fv?=
 =?utf-8?B?Sk1oSnpPNVNmekRZK2VoWmFKakpTZWFzclFLZDV4VnVJTWFXekVsYXFJS1Bn?=
 =?utf-8?B?WXdWSzJITTRpbGxRQ3ZxZjFvQ2pIS1VObnluSWFIUVc0eDhwaVBDQzJpSlcx?=
 =?utf-8?B?dll4cHl1V3ZYNXBldjhUb2RZb1p4RFI4Y2xzcTBUMWtHZXU2VnBCRFREMlZ0?=
 =?utf-8?B?VGM4SThGOFMrS0FPRE1zb1lYQllzck1YdnRhUjFIb2tIakhsRUJvZ2NiM2No?=
 =?utf-8?B?eTBCUFkrVmpibVVodDFDa2NDRE5lem9aOFI0RmkxTnJnVTZ5ZGJTV1V6MjNi?=
 =?utf-8?B?VWV2bExLWFQ0eWtXQTNRbmZna2tmM0hsVGtiUGt3b1pwYlVCZ1gzK3dKdmRm?=
 =?utf-8?B?S25RQUlUVFF1MGd6ZEFKUTJJdEFLOTNYY3NZMFI0cld3cjZzZlJ2bjNXTFBE?=
 =?utf-8?B?cThHR0NHdUw0MU1KNGxOWURIbnJwdnNwbk9NeDBISEg4QlVQNEFvQWlJMEhn?=
 =?utf-8?B?anlZZGE4ZjZYRkl1SWxoYUI2RVFjRmpmRDllR3lNbVhWZlpUMzhsSjhmcXJB?=
 =?utf-8?B?UG9kOXNUL0F5ekJKVkFHc2Q3WW1KRFB5Q0RpRDFRNUN4WDh6RFA4Z0d2YlZi?=
 =?utf-8?B?UGxXcDhDeWV5NE92U2QzRWlYRGpjMHVwUGxFK1doMzRENUVqNXErdVQyQ1N2?=
 =?utf-8?B?NWhHVUY5NjNHY3JkRTdpa05MMTZhSDlMS0RVZHFqUm9UWW9ZZVl0WmtvSE5X?=
 =?utf-8?B?WHpTSFRBbzEyTTZZYWJiWG83L0ZXb1owelRsT2gxREJvaCtzZy9YVFVPRXND?=
 =?utf-8?B?alk4Q0ZuYXpsaHpjVjlON1ZCYWlEcDd1UDd3dFA5QWVDMUFzUnkzUTk0NVNO?=
 =?utf-8?B?U3JJdEpoclQ1VWpURTlZRFFBZ3YvTTdpVGlPclRFWjA1TmxKN2Q1TlQvWnlK?=
 =?utf-8?B?ank1RjZFZUNqak4wdGx6elpEN3JWZGZpUFM2dytscWJXMWhtNlRGUXN3T1N0?=
 =?utf-8?B?T0cvOEl1bDJBT2RtVlZOdVpEU1c1WWZHbFdGYTdvTzJDVXV4N2NqM3dJd3Ey?=
 =?utf-8?B?R3NoRjFuV0RWaTBNYUNxU1BsZnV4eEt0M29waHJVdVhobUVSTUVoTXFNbFp2?=
 =?utf-8?B?cDNqVzFSRFBqaDg5TjJNOC9oUnVySHVGL3ZqVkJuS0pqMC9qZ2hvcis2K09t?=
 =?utf-8?B?dlB3ZHpqVzBQZUxFeW4xMWpBZkU3WHNKYndBUHZEOGw4Y1JCei9oS1o0a09u?=
 =?utf-8?B?OWpYeTIxVFVoaXV1UzRMMEV0RUN1ckQ3T1FTOHBxVlNELzZEa1hXYVNqRkZ1?=
 =?utf-8?B?eTdacFlXU0lxTHZvSlRGekxsSDVGMk84dElERnNZYTB2TkdMeWhKR0ljdDc1?=
 =?utf-8?B?ZDVJY1RTZUxwckNndHAvK3BRenFNRDU2OThueERibStZb1N6YSsrV3JCMjZF?=
 =?utf-8?B?azRaazJ1YmVlNUhsa0o1Qk9jOWVETFNJUHZSYnU2QWtNWVZZV3AzaGpMai9w?=
 =?utf-8?B?Vzg0bTNhZ3pxUVFwa0J3U2hyQkhGNDlyU0loRXYyenFrYk9iSTZiYXpVYXRW?=
 =?utf-8?B?VGt1SVYyem90cGRtbWMveHBaN1FZNDJ4UFE4dEMwQnl1WE9kN0JXbDR3aXhi?=
 =?utf-8?B?K2o4NWxac0dBUjEvQ1JqbGFjU0NUWXlWUEE2M3l3OWRrMUN3aFQ4ZzlMQzFP?=
 =?utf-8?B?YkU0NzhwenFZTHlJTE5DaDFxVFVLSmFKb1dUcmV3QjZpVUxMbTVZY2dBNkFq?=
 =?utf-8?B?b04zdTRhTVpBeU44QlRod0MxZjFQaTVubC9mNURIemk4NXltdWtpay9tSFlC?=
 =?utf-8?B?dTBqYlpycHlPV1NxZDRmU0hLcTVBcFVxZWJYNW9taUxmdFZHVDFUenJ4aGdC?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d98265cb-4295-412d-9afd-08dabcc8bc1f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 11:52:36.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IA1FbjiF9JIZRXcEy0dkIlTg0K9M+3CmpD8j9Nkf93w95qMQ4idFktuR0/E3yvfbrvduSjTtLg/sb/yJu29dgcLCoUnUBo0XLuQSnMpxGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4062
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
Cc: airlied@linux.ie, trix@redhat.com, dlatypov@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
 llvm@lists.linux.dev, arnd@kernel.org, intel-gfx@lists.freedesktop.org,
 nathan@kernel.org, rodrigo.vivi@intel.com, mchehab@kernel.org,
 tvrtko.ursulin@linux.intel.com, mauro.chehab@linux.intel.com,
 ndesaulniers@google.com, gustavoars@kernel.org, vitor@massaru.org,
 luc.vanoostenryck@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/10/2022 22.11, Gwan-gyeong Mun wrote:
> From: Kees Cook <keescook@chromium.org>
> 
> Implement a robust overflows_type() macro to test if a variable or
> constant value would overflow another variable or type. This can be
> used as a constant expression for static_assert() (which requires a
> constant expression[1][2]) when used on constant values. This must be
> constructed manually, since __builtin_add_overflow() does not produce
> a constant expression[3].
> 
> Additionally adds castable_to_type(), similar to __same_type(), but for
> checking if a constant value would overflow if cast to a given type.
> 

> +#define __overflows_type_constexpr(x, T) (			\
> +	is_unsigned_type(typeof(x)) ?				\
> +		(x) > type_max(typeof(T)) ? 1 : 0		\
> +	: is_unsigned_type(typeof(T)) ?				\
> +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> +		: (x) < type_min(typeof(T)) ||			\
> +		  (x) > type_max(typeof(T)) ? 1 : 0)
> +

Can't all these instances of "foo ? 1 : 0" be simplified to "foo"? That
would improve the readability of this thing somewhat IMO.

Rasmus

