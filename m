Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF992D9F8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 22:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE4610E8EE;
	Wed, 10 Jul 2024 20:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YwikL/RN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516E10E8EA;
 Wed, 10 Jul 2024 20:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720642983;
 bh=S2S5BrlKFHCSOaQ/HORfy3cWipQAGsIPftq+UXjaxP4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YwikL/RNJJUIvHJd8wTCGaQR4mqEVxQVM9q+1THEV/PO0Jox6YasBoThKS7lOyK4D
 s1/IVqj+LV3+qeQ2WWDorlPAuL2IV2B3zCQRdijKkNisIgF43GlNevEo1FZa3ek+MV
 FTHUuZPjYSdkHuf1F5raTRMXXwSiX+OXPEjtp9JQIGeRFxZ94Pd7Ep90nhdlrDjs5X
 Xng6NE1wZh39mN4bsIlqTIAtLek9xnw+8JD5IFJvhziLXRoVlKdh0kD7sAjw7MU5MP
 27A8xeJqvC8s4PZq5rp6IBb8q11dTdTH4gSIYpwh5eF/4uPvQhXD1msWTrOBvFXjex
 u1cKdFk1ExTtQ==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E87A3782180;
 Wed, 10 Jul 2024 20:22:57 +0000 (UTC)
Message-ID: <22bc825c-d726-4a4d-bd3a-508773c04071@collabora.com>
Date: Wed, 10 Jul 2024 17:22:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/52] selftests-dyndbg: check KCONFIG_CONFIG to avoid
 silly fails
To: Jim Cromie <jim.cromie@gmail.com>, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-28-jim.cromie@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240702215804.2201271-28-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 02/07/2024 18:57, Jim Cromie wrote:
> Several tests are dependent upon config choices. Lets avoid failing
> where that is noise.
> 
> The KCONFIG_CONFIG var exists to convey the config-file around.  If
> the var names a file, read it and extract the relevant CONFIG items,
> and use them to skip the dependent tests, thus avoiding the fails that
> would follow, and the disruption to whatever CI is running these
> selftests.
> 
> If the envar doesn't name a config-file, ".config" is assumed.
> 
> CONFIG_DYNAMIC_DEBUG=y:
> 
> basic-tests() and comma-terminator-tests() test for the presence of
> the builtin pr_debugs in module/main.c, which I deemed stable and
> therefore safe to count.  That said, the test fails if only
> CONFIG_DYNAMIC_DEBUG_CORE=y is set.  It could be rewritten to test
> against test-dynamic-debug.ko, but that just trades one config
> dependence for another.
> 
> CONFIG_TEST_DYNAMIC_DEBUG=m
> 
> As written, test_percent_splitting() modprobes test_dynamic_debug,
> enables several classes, and count them.  It could be re-written to
> work for the builtin module also, but builtin test modules are not a
> common or desirable build/config.
> 
> CONFIG_TEST_DYNAMIC_DEBUG=m && CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m
> 
> test_mod_submod() recaps the bug found in DRM-CI where drivers werent

If this fixes any but listed in drm/ci/xfails folder, please update it too.

Regards,
Helen

> enabled by drm.debug=<bits>.  It modprobes both test_dynamic_debug &
> test_dynamic_debug_submod, so it depends on a loadable modules config.
> 
> It could be rewritten to work in a builtin parent config; DRM=y is
> common enough to be pertinent, but testing that config also wouldn't
> really test anything more fully than all-loadable modules, since they
> default together.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> 
> fixup-kconfig
> ---
>   .../dynamic_debug/dyndbg_selftest.sh          | 45 ++++++++++++++++++-
>   1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> index fccd2012b548..d09ef26b2308 100755
> --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> @@ -11,6 +11,30 @@ CYAN="\033[0;36m"
>   NC="\033[0;0m"
>   error_msg=""
>   
> +[ -e /proc/dynamic_debug/control ] || {
> +    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=y ${NC}"
> +    exit 0 # nothing to test here, no good reason to fail.
> +}
> +
> +# need info to avoid failures due to untestable configs
> +
> +[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=".config"
> +if [ -f "$KCONFIG_CONFIG" ]; then
> +    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
> +    grep -q "CONFIG_DYNAMIC_DEBUG=y" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=$?
> +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=m" $KCONFIG_CONFIG ; LACK_TMOD=$?
> +    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m" $KCONFIG_CONFIG ; LACK_TMOD_SUBMOD=$?
> +    if [ $V -eq 1 ]; then
> +	echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
> +	echo LACK_TMOD: $LACK_TMOD
> +	echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
> +    fi
> +else
> +    LACK_DD_BUILTIN=0
> +    LACK_TMOD=0
> +    LACK_TMOD_SUBMOD=0
> +fi
> +
>   function vx () {
>       echo $1 > /sys/module/dynamic_debug/parameters/verbose
>   }
> @@ -192,6 +216,10 @@ function check_err_msg() {
>   
>   function basic_tests {
>       echo -e "${GREEN}# BASIC_TESTS ${NC}"
> +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
>       ddcmd =_ # zero everything (except class'd sites)
>       check_match_ct =p 0
>       # there are several main's :-/
> @@ -214,6 +242,10 @@ EOF
>   
>   function comma_terminator_tests {
>       echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
> +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
>       # try combos of spaces & commas
>       check_match_ct '\[params\]' 4 -r
>       ddcmd module,params,=_		# commas as spaces
> @@ -226,9 +258,12 @@ function comma_terminator_tests {
>       ddcmd =_
>   }
>   
> -
>   function test_percent_splitting {
>       echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
> +    if [ $LACK_TMOD -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
>       ifrmmod test_dynamic_debug_submod
>       ifrmmod test_dynamic_debug
>       ddcmd =_
> @@ -248,6 +283,14 @@ function test_percent_splitting {
>   
>   function test_mod_submod {
>       echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
> +    if [ $LACK_TMOD -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
> +    if [ $LACK_TMOD_SUBMOD -eq 1 ]; then
> +	echo "SKIP"
> +	return
> +    fi
>       ifrmmod test_dynamic_debug_submod
>       ifrmmod test_dynamic_debug
>       ddcmd =_
