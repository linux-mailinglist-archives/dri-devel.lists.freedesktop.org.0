Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHtTGxYzqmm8NAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B521A65C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 02:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631C610E2F0;
	Fri,  6 Mar 2026 01:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SqztcIfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1110E2F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 01:51:15 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7d4ba9abbecso10273273a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 17:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772761874; x=1773366674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rjic6E4sYgoKxkNkNG8eG+bbyrYHUHzf7UJjTOVCQkA=;
 b=SqztcIfPRBD2tzqtLW/ac+y64QOL4W5AmcXWlV5s3IMJ0/wV+UxfGqBD2FPCsXyyo7
 7IglWvDRmXuesxe5kiIZlkl7pI+FP0SbGRBMd6h/Cd+UbeJWF0vem7m+z8S1ZEuVhy81
 cHsJFbMc4hZP75EFN9h4zCalRU+/rNFKCazXgdYLvfNDMbshsmwsK7oj0tCXM4K19omu
 56i6eUMOkauW0wQWanr4wHKjWjCinUzm1QocTQ++wLIGxg2o9Qd+lpRwwz6dBa4+ehMq
 PhoTfnZDbJtyDZhp5NkrCE87+FmpTLq3pUSgf1shfuUluPctcEaXHq6WhJwU2xQAR193
 HDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772761874; x=1773366674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rjic6E4sYgoKxkNkNG8eG+bbyrYHUHzf7UJjTOVCQkA=;
 b=toqcX/mnRXbT4LNPKO5nR3AxdccmcJQ3JykS8JEdN5tOFr4y90/jenOGZhwDmCEFkc
 IVxSgSmnCHauw3+U83vqNmwCb1cNm4UCn07mAwQGIY+TUrB0t+gqGWpmmrv/PdkXiW2G
 SsS/kxlhiGduNUJexNiWRH7VQ2OModKDfQBDxI/4sSCGgtfNP01aUufSlfp1PMq+hU3a
 BAhlY+iI9XM35XvKF++ffuSuIbji7bLgTFhGaz2btq5I8KxxSXPfRWrSww3k5W7ZLm8/
 w+jc/LmaBQ4wzM1jFdXdiNKiRuWJODa12ZJj11yI3Jf4opHuXcOdUiFrmdvlYp91iJ/3
 UM1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGC+6V20bTbBiMl4BsHtYCTKE0tTAiJEv61QSRTjHrB0b8FbuNeGtHMqDVLryfi8S8e26wDcaQUoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhrK6Zv2/0BUYhRKTQYza5gH9VgU1SRRV1U3pDVOyvKeyGeSvc
 AeVcsEUa0DHYhNIq7UVkyK3oY6rzKRHzCyUOCYpPqBrkiCo8IvPkKvuo
X-Gm-Gg: ATEYQzx5ck0Hu7EmBgb+z5jHXtUWuDhG7Nz/iXp840Z8Jg8NVo/VnuPzyzk4p5Ou1lD
 UemVszdWdsd+HDHnVzqXnqYQ12e1lSKxH1dCkiJXymtC6dkrNgbAcWzIUNhvoKfTsgcs/pmo1WV
 4AQePD6I4a11k1GYDVWnN6TVacBiYYiWirs/NbmfmE1jsAZwxDB8ZAWPcapyvqYwdM5oj1xxDUJ
 8W093QyqotHpEFQefyCET31zeRQxtXEu3fAHG/NR/+RouT9Pkpu3aKS325NLyHmUOJPKUt9wNWU
 jAq5O5VX4GaVYzg9JusxVhHFw37F6MnffbOS0bvIY+tbErYz3X1G78zDegy3enE1oKXp6xv+llb
 pk76xpBDUJZer6X1tDLgacXjTRtjP77EcvUfZjSCV9lPGRojgai6xRFRtktbHi8UikTlIRvnjLR
 kJrp3+1hhaFlQIvkHRZgDvC/a5Wow6dVMLELwWZz3Q8P8eI6Wr
X-Received: by 2002:a05:6820:3103:b0:663:11b2:d61d with SMTP id
 006d021491bc7-67b9bca1e01mr428086eaf.25.1772761874446; 
 Thu, 05 Mar 2026 17:51:14 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-67b9cc1a627sm115245eaf.6.2026.03.05.17.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 17:51:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 7/7] dyndbg-test: test keyword !value negation
Date: Thu,  5 Mar 2026 18:50:10 -0700
Message-ID: <20260306015022.1940986-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306015022.1940986-1-jim.cromie@gmail.com>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 206B521A65C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gvt-dev@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,kernel.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

---
 .../dynamic_debug/dyndbg_selftest.sh          | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 09937dca3056..5c35d7cc5ecf 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -350,12 +350,47 @@ function test_mod_submod {
     ifrmmod test_dynamic_debug
 }
 
+function test_negated_keywords {
+    echo -e "${GREEN}# TEST_NEGATED_KEYWORDS ${NC}"
+
+    # Test 1: Disable negated subset from enabled set
+    # Enables all 6 in init/main.c, then pulses ONLY those that are NOT run_init_process (the 2 blacklist sites) OFF.
+    ddcmd =_
+    ddcmd file init/main.c +p
+    check_match_ct 'init/main.c:.*=p' 6 -r
+    ddcmd file init/main.c func !run_init_process -p
+    # Result: 6 - 2 = 4 sites (run_init_process) remain enabled.
+    check_match_ct 'init/main.c:.*=p' 4 -r
+    check_match_ct 'run_init_process' 4 -r
+
+    # Test 2: Enable negated subset from clean slate
+    # Negation !run_init_process should match the 2 blacklist sites.
+    ddcmd =_
+    ddcmd file init/main.c func !run_init_process +p
+    # Verify exactly 2 sites enabled
+    check_match_ct 'init/main.c:.*=p' 2 -r
+    check_match_ct 'initcall_blacklist[[:space:]]' 1 -r
+    check_match_ct 'initcall_blacklisted[[:space:]]' 1 -r
+
+    # Test 3: Enable negated subset with wildcard
+    # Negation !run_init_* should match the same 2 blacklist sites.
+    ddcmd =_
+    ddcmd file init/main.c func !run_init_* +p
+    # Verify exactly 2 sites enabled
+    check_match_ct 'init/main.c:.*=p' 2 -r
+    check_match_ct 'initcall_blacklist[[:space:]]' 1 -r
+    check_match_ct 'initcall_blacklisted[[:space:]]' 1 -r
+
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
     # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
     test_mod_submod
+    test_negated_keywords
 )
 
 # Run tests
-- 
2.53.0

